package com.AlbumArchive.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminAlbumUpdateController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		String info = request.getParameter("info");
		int price = Integer.parseInt(request.getParameter("price"));
		int totalQty = Integer.parseInt(request.getParameter("totalQty"));
		
		System.out.println(num);
		System.out.println(info);
		System.out.println(price);
		System.out.println(totalQty);
		
		int cnt = AlbumDAO.getInstance().updateAlbum(num, info, price, totalQty);
		response.setContentType("text/html; charset=UTF-8");
		if(cnt == 0) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('앨범수정 오류'); history.back();</script>");
			writer.close();
        	return null;
		}else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('앨범수정 완료'); window.location.href='" + request.getContextPath() + "/main.do';</script>");
			writer.close();
        	return null;
		}
		
	}
	
}
