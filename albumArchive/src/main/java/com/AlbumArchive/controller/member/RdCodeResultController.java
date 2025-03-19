package com.AlbumArchive.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RdCodeResultController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		int rdCode = Integer.parseInt(request.getParameter("rdCode"));
		int myCode = Integer.parseInt(request.getParameter("myCode"));
		String email = request.getParameter("email");
		
		if(myCode == rdCode) {
			String pw = MemberDAO.getInstance().getPw(email);
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('비밀번호는 " + pw + " 입니다'); window.location.href='" + request.getContextPath() + "/login.do';</script>");
			writer.close();
		}else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('인증코드가 틀렸습니다'); history.back();</script>");
			writer.close();
		}
		return null;
	}

}
