package com.AlbumArchive.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import com.AlbumArchive.DAO.AdminDAO;
import com.AlbumArchive.DAO.InquiryDAO;
import com.AlbumArchive.DAO.PurchaseDAO;
import com.AlbumArchive.VO.InquiryVO;
import com.AlbumArchive.VO.PurchaseVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminInquiryAnswerController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		System.out.println("id = " + id);
		InquiryVO info = InquiryDAO.getInstance().getInquiryInfo(id);
		
		request.setAttribute("info", info);
		
		return "admin/adminInquiryAnswer";
	}

}
