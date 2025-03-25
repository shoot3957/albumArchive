package com.AlbumArchive.controller.cart;

import java.io.IOException;

import com.AlbumArchive.DAO.CartDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CartUpdateController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 세션에서 user_id 가져오기
        String userId = request.getParameter("id");
        
        // 장바구니 수량 업데이트
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        int qty = Integer.parseInt(request.getParameter("qty"));

        // 장바구니 수량 업데이트
        CartDAO.getInstance().updateCartQty(cartId, qty);
        System.out.println("id:" + userId);
        
        // JavaScript alert과 리디렉션을 위해 response에 내용 삽입
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write("<script>");
        response.getWriter().write("alert('장바구니 수량이 업데이트되었습니다.');");
        response.getWriter().write("window.location.href = 'cartList.do?id=" + userId + "';");
        response.getWriter().write("</script>");
        
        return null;
    }
}
