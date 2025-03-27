package com.AlbumArchive.controller.review;

import com.AlbumArchive.DAO.ReviewDAO;
import com.AlbumArchive.VO.ReviewVO;
import com.AlbumArchive.frontcontroller.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class ReviewUpdateController implements Controller {
    private ReviewDAO reviewDAO = ReviewDAO.getInstance();

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 세션에서 로그인 상태 확인
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginId") == null) {
            response.sendRedirect("/albumArchive/login.do");
            return null;
        }

        String loginId = (String) session.getAttribute("loginId");
        String reviewNumStr = request.getParameter("reviewNum");
        String title = request.getParameter("title");
        String info = request.getParameter("info");
        String albumName = request.getParameter("albumName");

        // 디버깅 로그 출력
        System.out.println("컨트롤러 - reviewNum: " + reviewNumStr);
        System.out.println("컨트롤러 - title: " + title);
        System.out.println("컨트롤러 - info: " + info);
        System.out.println("컨트롤러 - albumName: " + albumName);

        // reviewNum이 null이거나 비어있는지 확인
        if (reviewNumStr == null || reviewNumStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "reviewNum이 누락됨");
            return null;
        }

        // reviewNum을 숫자로 변환 (예외 처리)
        int reviewNum;
        try {
            reviewNum = Integer.parseInt(reviewNumStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "reviewNum은 숫자여야 합니다.");
            return null;
        }

        // 리뷰 조회
        ReviewVO review = reviewDAO.getReviewByNum(reviewNum);
        if (review == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 리뷰를 찾을 수 없습니다.");
            return null;
        }

        // 로그인한 사용자가 리뷰를 작성한 사람인지 확인
        if (!review.getUserId().equals(loginId)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "자신의 리뷰만 수정할 수 있습니다.");
            return null;
        }

        // 리뷰 수정
        review.setTitle(title);
        review.setInfo(info);
        reviewDAO.updateReview(review);

        // 수정 후 앨범 상세 페이지로 리다이렉트
        return "redirect:/albumDetail.do?albumName=" + albumName;
    }
}
