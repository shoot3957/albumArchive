package com.AlbumArchive.controller.cart;

import java.io.IOException;

import com.AlbumArchive.DAO.CartDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CartRemoveController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        String userId = request.getParameter("id");
        // 장바구니 항목 삭제
        CartDAO.getInstance().removeFromCart(cartId);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write("<script>");
        response.getWriter().write("alert('장바구니에서 삭제합니다');");
        response.getWriter().write("window.location.href = 'cartList.do?id=" + userId + "';");
        response.getWriter().write("</script>");
        return null;
    }
}
