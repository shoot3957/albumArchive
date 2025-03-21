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

public class AdminDeleteInquiryController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		
		int cnt = InquiryDAO.getInstance().adminDeleteInquiry(id);
		response.setContentType("text/html; charset=UTF-8");
		
		if(cnt == 1) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('삭제 완료'); window.location.href='" + request.getContextPath() + "/adminInquiryList.do';</script>");
			writer.close();
			return null;
		}else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('삭제 오류'); history.back();</script>");
			writer.close();
			return null;
		}
		
	}

}
