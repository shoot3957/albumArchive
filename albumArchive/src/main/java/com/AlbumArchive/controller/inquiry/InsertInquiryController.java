package com.AlbumArchive.controller.inquiry;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.AlbumArchive.DAO.InquiryDAO;
import com.AlbumArchive.VO.InquiryVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertInquiryController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String info = request.getParameter("info");
       
        int cnt = InquiryDAO.getInstance().insertInquiry(id, title, info);
        response.setContentType("text/html; charset=UTF-8");
        if(cnt == 0) {
        	PrintWriter writer = response.getWriter();
			writer.println("<script>alert('문의작성 오류'); history.back();</script>");
			writer.close();
        	return null;
        }else {
        	PrintWriter writer = response.getWriter();
			writer.println("<script>alert('문의작성 완료'); window.location.href='" + request.getContextPath() + "/adminInquiryList.do';</script>");
			writer.close();
        	return null;
        }

    }
}