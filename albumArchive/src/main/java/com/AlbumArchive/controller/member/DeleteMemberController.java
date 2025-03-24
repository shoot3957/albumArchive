package com.AlbumArchive.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import com.AlbumArchive.DAO.AdminDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteMemberController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		System.out.println("id = " + id);
		
		AdminDAO.getInstance().deleteMember(id);
		HttpSession session = request.getSession();
		session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('탈퇴완료'); window.location.href='" + request.getContextPath() + "/main.do';</script>");
		writer.close();
		
		return null;
	}

}
