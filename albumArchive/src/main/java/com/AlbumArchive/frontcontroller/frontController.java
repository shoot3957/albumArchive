package com.AlbumArchive.frontcontroller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.do")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 1,  // 1MB
    maxRequestSize = 1024 * 1024 * 10  // 10MB
)
public class frontController extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String url = request.getRequestURI();
        System.out.println("url=" + url);
        String ctx = request.getContextPath();
        String command = url.substring(ctx.length());
        System.out.println("command=" + command);

        Controller controller = null;
        String nextPage = null;
        HandlerMapping mapping = new HandlerMapping();
        controller = mapping.getController(command);

        if (controller == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Controller not found for command: " + command);
            return;
        }

        nextPage = controller.requestHandler(request, response);
        System.out.println("nextpage = " + nextPage);

        if (nextPage != null) {
            if (nextPage.startsWith("redirect:")) {
                String redirectPath = nextPage.split(":")[1];
                if (redirectPath.startsWith(ctx)) {
                    redirectPath = redirectPath.substring(ctx.length());
                }
                response.sendRedirect(ctx + redirectPath);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeView(nextPage));
                rd.forward(request, response);
            }
        }
    }
}