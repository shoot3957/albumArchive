package com.AlbumArchive.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.AlbumArchive.DAO.AdminDAO;
import com.AlbumArchive.DAO.InquiryDAO;
import com.AlbumArchive.VO.InquiryVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminInquiryListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<InquiryVO> list = null;
		
		list = (ArrayList<InquiryVO>) InquiryDAO.getInstance().getAllInquiryList();
		
		request.setAttribute("list", list);
		
		return "admin/adminInquiryList";
	}

}
