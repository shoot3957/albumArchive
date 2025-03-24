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
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("id");

        // 장바구니 수량 업데이트
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        int qty = Integer.parseInt(request.getParameter("qty"));

        // 장바구니 수량 업데이트
        CartDAO.getInstance().updateCartQty(cartId, qty);
        System.out.println("id:"+userId);
        // 장바구니 목록 페이지로 리디렉션, userId를 URL에 포함
        if (userId != null) {
            response.sendRedirect("cartList.do?id=" + userId);  // id 파라미터 추가
        } else {
            response.sendRedirect("main.do");  // 로그인되지 않은 경우 메인 페이지로 리디렉션
        }

        return null;
    }
}
