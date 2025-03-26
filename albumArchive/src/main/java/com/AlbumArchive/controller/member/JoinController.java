package com.AlbumArchive.controller.member;

import java.io.IOException;

import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.VO.MemberVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JoinController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("name");
		if(name == null || name.trim().isEmpty()) {
			return "member/join";
		}
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		int age = Integer.parseInt(request.getParameter("age"));
		int money = 0;
		
		MemberVO m = new MemberVO(id,pw,name,address,email,phone,age,money);
		int cnt = MemberDAO.getInstance().memberJoin(m);
		System.out.println("cnt = " + cnt);
		if(cnt > 0) {
			System.out.println("회원가입 성공");
			return "redirect:/main.do";
		}else {
			throw new ServletException("not insert");
		}
	}

}
