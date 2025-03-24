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
        
        // 장바구니 항목 삭제
        CartDAO.getInstance().removeFromCart(cartId);

        return "redirect:/cartList.do";  // 장바구니 페이지로 리디렉션
    }
}
