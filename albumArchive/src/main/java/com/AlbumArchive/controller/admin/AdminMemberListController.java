package com.AlbumArchive.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.AlbumArchive.DAO.AdminDAO;
import com.AlbumArchive.VO.MemberVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminMemberListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
            ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) AdminDAO.getInstance().getMemberList();
            request.setAttribute("memberList", memberList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "회원 목록을 불러오는 중 오류가 발생했습니다.");
        }
		
		return "admin/memberList";
	}

}
