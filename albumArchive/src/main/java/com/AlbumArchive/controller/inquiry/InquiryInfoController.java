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

public class InquiryInfoController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("num = " + num);
		InquiryVO info = InquiryDAO.getInstance().getInquiryInfo(num);
		
		request.setAttribute("info", info);
		
		return "admin/adminInquiryAnswer";

    }
}