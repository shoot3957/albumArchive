package com.AlbumArchive.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ValidEmailAjaxController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
	    System.out.println("받은 이메일: " + email);  // 이메일 값 확인

	    String id = MemberDAO.getInstance().isValidEmail(email);
	    System.out.println("조회된 ID: " + id);  // id 값 확인
	    
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    // JSON 형식으로 명확하게 반환
	    PrintWriter out = response.getWriter();
	    String jsonResponse = "{\"id\": " + (id == null ? "null" : "\"" + id + "\"") + "}";
	    
	    System.out.println("서버 응답: " + jsonResponse); // 콘솔에서 응답 확인
	    out.print(jsonResponse);
	    out.flush();
	    
	    return null;
	}

}
