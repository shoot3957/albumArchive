package com.AlbumArchive.controller.member;

import java.io.IOException;

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
			System.out.println("1");
			return "member/join";
		}
		
		return "redirect:/main.do";
	}

}
