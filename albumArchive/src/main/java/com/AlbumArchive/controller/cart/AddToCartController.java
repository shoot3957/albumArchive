package com.AlbumArchive.controller.cart;

import java.io.IOException;
import com.AlbumArchive.DAO.CartDAO;
import com.AlbumArchive.VO.CartVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddToCartController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 사용자가 로그인한 상태에서 user_id를 받아옴
        String userId = (String) request.getSession().getAttribute("user_id");
        if (userId == null) {
            response.sendRedirect("login.do");
            return null;
        }

        // 요청 파라미터에서 앨범 ID, 가격, 수량을 받아옴
        String album_num = request.getParameter("album_num");
        int price = Integer.parseInt(request.getParameter("price"));
        int qty = Integer.parseInt(request.getParameter("qty"));

        // CartVO 객체 생성
        CartVO cart = new CartVO();
        cart.setAlbum_num(album_num);
        cart.setUser_id(userId);
        cart.setPrice(price);
        cart.setQty(qty);

        // 장바구니에 앨범 추가
        CartDAO.getInstance().addToCart(cart);

        // 장바구니 페이지로 리디렉션
        return "cart/cartList";  // cartList.jsp로 이동
    }
}
