package com.AlbumArchive.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
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

public class AdminInquirySendAnswerController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String answer = request.getParameter("answer");
		String id = request.getParameter("id");
		
		int cnt = InquiryDAO.getInstance().sendInquiryAnswer(answer, id);
		response.setContentType("text/html; charset=UTF-8");
		
		if(cnt == 0) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('답장 오류'); history.back();</script>");
			writer.close();
			return null;
		}else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('답장 완료'); window.location.href='" + request.getContextPath() + "/adminInquiryList.do';</script>");
			writer.close();
			return null;
		}
		
	}

}
