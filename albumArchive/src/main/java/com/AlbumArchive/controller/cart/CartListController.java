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
        
        // 사용자가 로그인한 상태에서 user_id를 받아옴
        String userId = (String) request.getSession().getAttribute("user_id");
        if (userId == null) {
            response.sendRedirect("main.do");
            return null;
        }

        // 장바구니 목록을 가져옴
        List<CartVO> cartList = CartDAO.getInstance().getCartList(userId);
        request.setAttribute("cartList", cartList);

        return "member/cartList";  // cartList.jsp로 이동
    }

    // 장바구니 수량 업데이트
    public String updateCartQty(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        
        CartDAO.getInstance().updateCartQty(cartId, qty);

        return "redirect:/cartList.do";  // 장바구니 페이지로 리디렉션
    }

    // 장바구니 항목 삭제
    public String removeFromCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        CartDAO.getInstance().removeFromCart(cartId);

        return "redirect:/cartList.do";  // 장바구니 페이지로 리디렉션
    }
}
