package com.AlbumArchive.controller.member;

import java.io.IOException;

import com.AlbumArchive.DAO.PurchaseDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class memberPurchase implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String loginId = request.getParameter("loginId");
		String albumName = request.getParameter("albumName");
		int num = Integer.parseInt(request.getParameter("num"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		System.out.println(loginId + " " + albumName + " " +num + " " + qty + " " + price);
		
		PurchaseDAO.getInstance().deletePurchase(num,qty,price,loginId,albumName);
		return "main.do";
	}

}
