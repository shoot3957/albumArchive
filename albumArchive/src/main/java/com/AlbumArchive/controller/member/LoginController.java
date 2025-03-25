package com.AlbumArchive.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		if (id == null || id.trim().isEmpty()) {
			return "member/login";
		}
		String pw = request.getParameter("pw");

		String ctx = request.getContextPath();
		int money = MemberDAO.getInstance().getMyMoney(id);
		
		if(id.equals("admin") && pw.equals("admin")) {
			HttpSession session = request.getSession();
			session.setAttribute("loginId", "admin");
			return "redirect:/main.do";
		}
		System.out.println(id);
		if (!MemberDAO.getInstance().checkLogin(id, pw)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인 실패'); history.back();</script>");
			writer.close();
			return null;
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginId", id);
			session.setAttribute("myMoney", money);
			return "redirect:/main.do";
		}
		

	}
}

