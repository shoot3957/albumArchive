package com.AlbumArchive.controller.album;

import com.AlbumArchive.DAO.LikesDAO;
import com.AlbumArchive.frontcontroller.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class LikesController implements Controller {

    private final LikesDAO likesDAO = LikesDAO.getInstance();

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // 요청 파라미터 가져오기
        String albumNumStr = request.getParameter("albumNum");
        if (albumNumStr == null || albumNumStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "albumNum is required");
            return null;
        }

        int albumNum;
        try {
            albumNum = Integer.parseInt(albumNumStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid albumNum");
            return null;
        }
        // 사용자 세션 확인 (로그인 여부)
        HttpSession session = request.getSession(false);
        System.out.println("userId = " + session.getAttribute("loginId"));
        if (session == null || session.getAttribute("loginId") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return null;
        }
        String userId = (String) session.getAttribute("loginId");

        // 좋아요 상태 확인 및 토글
        boolean isLiked = likesDAO.checkLike(userId, albumNum);
        if (isLiked) {
            likesDAO.removeLike(userId, albumNum);
        } else {
            likesDAO.addLike(userId, albumNum);
        }

        // 업데이트된 좋아요 수와 상태 반환
        int updatedLikes = likesDAO.getLikesCount(albumNum);
        boolean updatedIsLiked = !isLiked;

        // JSON 응답 생성 (수동 문자열 조합)
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        String jsonResponse = "{\"liked\":" + updatedIsLiked + ",\"likes\":" + updatedLikes + "}";
        out.print(jsonResponse);
        out.flush();

        return null; // FrontController에서 뷰 렌더링을 하지 않음
    }
}