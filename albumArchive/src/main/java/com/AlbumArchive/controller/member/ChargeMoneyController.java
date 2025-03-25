package com.AlbumArchive.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ChargeMoneyController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		int cMoney = Integer.parseInt(request.getParameter("chargeAmount"));
		int qMoney = Integer.parseInt(request.getParameter("qMoney"));
		int totalMoney = cMoney + qMoney;
		System.out.println("id = " + id);
		System.out.println("totalMoney = " + totalMoney);
		
		int cnt = MemberDAO.getInstance().chargeMoney(totalMoney, id);
		response.setContentType("text/html; charset=UTF-8");
		if(cnt == 0) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('충전 실패'); history.back();</script>");
			writer.close();
			return null;
		}else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('충전 완료'); window.location.href='" + request.getContextPath() + "/main.do';</script>");
			writer.close();
			return null;
		}
	}

}
