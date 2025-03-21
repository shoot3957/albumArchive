package com.AlbumArchive.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import com.AlbumArchive.DAO.InquiryDAO;
import com.AlbumArchive.VO.InquiryVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminInquiryListController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        InquiryDAO inquiryDAO = InquiryDAO.getInstance();

        // 페이징 파라미터 설정
        int pageSize = 5; // 페이지당 문의 수
        int currentPage = 1; // 기본값: 1페이지
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1; // 잘못된 값이면 1페이지로 설정
            }
        }

        // 전체 문의 수 가져오기
        int totalInquiries = inquiryDAO.getTotalInquiryCount();
        int totalPages = (int) Math.ceil((double) totalInquiries / pageSize);

        // 현재 페이지가 유효한 범위 내에 있는지 확인
        if (currentPage < 1) {
            currentPage = 1;
        } else if (currentPage > totalPages && totalPages > 0) {
            currentPage = totalPages;
        }

        // 현재 페이지에 해당하는 문의 목록 가져오기
        ArrayList<InquiryVO> list = (ArrayList<InquiryVO>) inquiryDAO.getAllInquiryList(currentPage, pageSize);

        // JSP에 전달할 속성 설정
        request.setAttribute("list", list);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);

        return "admin/adminInquiryList";
    }
}