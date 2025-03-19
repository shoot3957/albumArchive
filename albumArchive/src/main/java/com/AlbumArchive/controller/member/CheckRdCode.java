package com.AlbumArchive.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.VO.MemberVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CheckRdCode implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
		System.out.println("email = " + email);
		int rdCode = Integer.parseInt(request.getParameter("rdCode"));
		System.out.println("rdCode = " + rdCode);
		
		request.setAttribute("email", email);
		request.setAttribute("rdCode", rdCode);
		
		return "member/checkRdCode";
		
		
		
		
	}

}
