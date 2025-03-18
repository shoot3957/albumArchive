package com.AlbumArchive.controller.member;

import java.io.IOException;

import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ValidEmailAjaxController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id=request.getParameter("id"); // { "id" : id  }
		System.out.println("id = "+id);
		String passData = MemberDAO.getInstance().isVaildId(id)? "notValid" : "valid";
		System.out.println("passData = "+passData);
	
		response.getWriter().print(passData); // "notValid" : "valid";
		
		return null;
	}

}
