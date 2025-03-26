package com.AlbumArchive.controller.cart;

import java.io.IOException;
import java.util.List;

import com.AlbumArchive.DAO.CartDAO;
import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.CartVO;
import com.AlbumArchive.VO.MemberVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProcessPurchaseController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 사용자 로그인 정보를 가져옴
    	String userId = request.getParameter("id");
    	System.out.println("userId =" + userId);
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

        // 캐시가 충분한지 확인
        if (userMoney < totalAmount) {
            // 캐시 부족 시, 메인 페이지로 리디렉션
            response.sendRedirect("main.do");
            return null;
        }

        // 캐시 차감
        MemberDAO.getInstance().updateMemberMoney(userId, userMoney - totalAmount);

        // 앨범 수량 업데이트
//        for (CartVO cartItem : cartList) {
//            // 장바구니에 담긴 앨범 수량만큼 실제 앨범 수량 차감
//            AlbumDAO.getInstance().updateAlbumQty(cartItem.getAlbum_num(), cartItem.getQty());
//        }

        // 장바구니에서 모든 항목 삭제
        CartDAO.getInstance().removeAllFromCartByUserId(userId);

        
		String ctx = request.getContextPath();
	
        return "redirect:/memberPurchaseList.do";
    }
}
