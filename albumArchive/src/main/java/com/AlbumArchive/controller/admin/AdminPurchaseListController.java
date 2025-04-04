package com.AlbumArchive.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import com.AlbumArchive.DAO.PurchaseDAO;
import com.AlbumArchive.VO.PurchaseVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminPurchaseListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<PurchaseVO> list = new ArrayList<PurchaseVO>();
		
		list = (ArrayList<PurchaseVO>) PurchaseDAO.getInstance().getPurchaseList();
		request.setAttribute("list", list);
		
		return "purchase/adminPurchaseList";
	}

}
