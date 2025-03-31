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
        
        String userId = request.getParameter("id");
        if (userId == null) {
            response.sendRedirect("login.do");
            return null;
        }

        int albumNum = Integer.parseInt(request.getParameter("album_num"));
        int price = Integer.parseInt(request.getParameter("price"));

        CartDAO dao = CartDAO.getInstance();

        // 기존에 담긴 항목이 있는지 확인
        CartVO existingItem = dao.getCartItem(userId, albumNum);

        if (existingItem != null) {
            // 이미 존재하면 수량 +1 업데이트
            int newQty = existingItem.getQty() + 1;
            dao.updateCartQty(existingItem.getNum(), newQty);
        } else {
            // 존재하지 않으면 새로 추가
            CartVO cart = new CartVO();
            cart.setAlbumNum(albumNum);
            cart.setUser_id(userId);
            cart.setPrice(price);
            cart.setQty(1);  // 기본 수량 1
            
            dao.addToCart(cart);
        }

        System.out.println("장바구니 추가");

        // 📌 cartList.do로 리다이렉트 (userId 파라미터 함께)
        return "redirect:/cartList.do?id=" + userId;
    }

}
