package com.AlbumArchive.controller.member;

import java.io.IOException;
import java.util.ArrayList;

import com.AlbumArchive.DAO.PurchaseDAO;
import com.AlbumArchive.VO.PurchaseVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberPurchaseListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		
		ArrayList<PurchaseVO> list = new ArrayList<PurchaseVO>();
		
		list = (ArrayList<PurchaseVO>) PurchaseDAO.getInstance().getMemberPurchaseList(id);
		request.setAttribute("list", list);
		
		return "purchase/adminPurchaseList";
	}

}
