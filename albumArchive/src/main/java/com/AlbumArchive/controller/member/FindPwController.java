package com.AlbumArchive.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import com.AlbumArchive.DAO.MemberDAO;
import com.AlbumArchive.VO.MemberVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class FindPwController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        
        // ID가 없는 경우 (최초 페이지 요청)
        if (id == null || id.trim().isEmpty()) {
            return "member/findPw";
        }
        
        
        Random rd = new Random();
        
        int rdCode = rd.nextInt(100000)+1;
        
        // MemberDAO를 통해 아이디 유효성 체크
        String passData = MemberDAO.getInstance().isVaildId(id) ? "notValid" : "valid"; // 오타: isVaildId -> isValidId로 가정
        System.out.println("passData = " + passData);
        System.out.println("id = " + id);
        System.out.println("rdCode = " + rdCode);
        
        request.setAttribute("passData", passData);
        request.setAttribute("rdCode",rdCode);
        return "member/findPw";
    }
}