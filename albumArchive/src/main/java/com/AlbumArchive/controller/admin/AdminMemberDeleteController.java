package com.AlbumArchive.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import com.AlbumArchive.DAO.AdminDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminMemberDeleteController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		System.out.println("id = " + id);
		
		AdminDAO.getInstance().deleteMember(id);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('회원삭제완료'); window.location.href='" + request.getContextPath() + "/adminMemberList.do';</script>");
		writer.close();
		
		return null;
	}

}
