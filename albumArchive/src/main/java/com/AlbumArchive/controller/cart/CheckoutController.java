package com.AlbumArchive.controller.cart;

import java.io.IOException;
import java.util.List;

import com.AlbumArchive.DAO.CartDAO;
import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.VO.CartVO;
import com.AlbumArchive.VO.MemberVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CheckoutController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 사용자 로그인 정보를 가져옴
    	String userId = request.getParameter("id");
        System.out.println(userId);
        if (userId == null) {
            response.sendRedirect("main.do");
            return null;
        }

        // 장바구니 목록 가져오기
        List<CartVO> cartList = CartDAO.getInstance().getCartList(userId);

        // 사용자의 캐시 정보를 가져옴
        MemberVO member = MemberDAO.getInstance().getMemberInfo(userId);
        int userMoney = member.getMoney();

        // 총 금액 계산
        int totalAmount = 0;
        for (CartVO cartItem : cartList) {
            totalAmount += cartItem.getPrice() * cartItem.getQty();
        }

        // 결제 정보를 request에 저장
        request.setAttribute("cartList", cartList);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("userMoney", userMoney);

        // 결제 페이지로 이동
        return "member/checkout";  // checkout.jsp로 이동
    }
}
