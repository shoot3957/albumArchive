package com.AlbumArchive.controller.member;

import java.io.IOException;

import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.VO.MemberVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.invalidate();
		String ctx = request.getContextPath();
		response.sendRedirect(ctx + "/main.do");
		return null;
	}

}
