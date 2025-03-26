package com.AlbumArchive.controller.review;

import com.AlbumArchive.DAO.ReviewDAO;
import com.AlbumArchive.VO.ReviewVO;
import com.AlbumArchive.frontcontroller.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class ReviewDeleteController implements Controller {
    private ReviewDAO reviewDAO;

    public ReviewDeleteController() {
        this.reviewDAO = ReviewDAO.getInstance();
    }

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginId") == null) {
            response.sendRedirect("/albumArchive/login.do");
            return null;
        }

        String loginId = (String) session.getAttribute("loginId");
        String reviewNumStr = request.getParameter("reviewNum");
        String albumName = request.getParameter("albumName");

        // 디버깅 로그
        System.out.println("ReviewDeleteController - loginId: " + loginId);
        System.out.println("ReviewDeleteController - reviewNum: " + reviewNumStr);
        System.out.println("ReviewDeleteController - albumName: " + albumName);

        if (reviewNumStr == null || reviewNumStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "reviewNum is missing or empty");
            return null;
        }
        if (albumName == null || albumName.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "albumName is missing or empty");
            return null;
        }

        int reviewNum;
        try {
            reviewNum = Integer.parseInt(reviewNumStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid reviewNum: must be a valid number, received: " + reviewNumStr);
            return null;
        }

        ReviewVO review = reviewDAO.getReviewByNum(reviewNum);
        if (review == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Review not found with reviewNum: " + reviewNum);
            return null;
        }

        boolean isAdmin = "admin".equals(loginId);
        if (!isAdmin && !review.getUserId().equals(loginId)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "You can only delete your own reviews");
            return null;
        }

        reviewDAO.deleteReview(reviewNum);

        return "redirect:/albumDetail.do?albumName=" + albumName;
    }
}