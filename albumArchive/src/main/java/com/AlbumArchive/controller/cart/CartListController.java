package com.AlbumArchive.controller.cart;

import java.io.IOException;
import java.util.List;

import com.AlbumArchive.DAO.CartDAO;
import com.AlbumArchive.VO.CartVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CartListController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // URL 파라미터에서 user_id를 받아옴
        String userId = request.getParameter("id");
        
        System.out.println("User ID from request: " + userId);  // 디버깅용 로그 추가
        
        // userId가 null이면 로그인되지 않은 상태, 로그인 페이지로 리디렉션
        if (userId == null || userId.isEmpty()) {
            response.sendRedirect("main.do");
            return null;
        }

        // 장바구니 목록을 가져옴
        List<CartVO> cartList = CartDAO.getInstance().getCartList(userId);

        // 장바구니 목록을 request에 저장
        request.setAttribute("cartList", cartList);

        // 장바구니 목록 페이지로 이동
        return "member/cartList";  // cartList.jsp로 이동
    }
}
