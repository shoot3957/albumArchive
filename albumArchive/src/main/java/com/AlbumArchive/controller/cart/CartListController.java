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
        String id = request.getParameter("id");
        System.out.println("list왔다감");
        if (id == null) {
            response.sendRedirect("main.do");
            return null;
        }

        // 장바구니 목록을 가져옴
        List<CartVO> cartList = CartDAO.getInstance().getCartList(id);
        request.setAttribute("cartList", cartList);
        System.out.println("id:"+id);
        return "member/cartList";  // cartList.jsp로 이동
    }
}
