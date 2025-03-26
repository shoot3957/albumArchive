package com.AlbumArchive.controller.review;

import com.AlbumArchive.DAO.ReviewDAO;
import com.AlbumArchive.VO.ReviewVO;
import com.AlbumArchive.frontcontroller.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class ReviewLisetController implements Controller {
    private ReviewDAO reviewDAO;

    public ReviewLisetController() {
        this.reviewDAO = ReviewDAO.getInstance();
    }

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        System.out.println("loginId = " + (session != null ? session.getAttribute("loginId") : "null"));
        
        if (session == null || session.getAttribute("loginId") == null) {
            response.sendRedirect("/albumArchive/login.do");
            return null;
        }

        String loginId = (String) session.getAttribute("loginId");
        String albumNumStr = request.getParameter("albumNum");
        String title = request.getParameter("title");
        String info = request.getParameter("info");
        String albumName = request.getParameter("albumName");
        System.out.println("albumNumStr = " + albumNumStr);

        if (albumNumStr == null || title == null || info == null || albumName == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Required fields are missing");
            return null;
        }

        int albumNum;
        try {
            albumNum = Integer.parseInt(albumNumStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid albumNum");
            return null;
        }

        ReviewVO review = new ReviewVO(info, loginId, albumNum, title);
        reviewDAO.addReview(review);
        System.out.println("albumName = " + albumName);

        // 리뷰 작성 후 앨범 상세 페이지로 리다이렉트
        return "redirect:/albumDetail.do?albumName=" + albumName;
    }
}