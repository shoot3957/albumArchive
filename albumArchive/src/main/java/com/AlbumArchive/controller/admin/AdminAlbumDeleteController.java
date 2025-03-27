package com.AlbumArchive.controller.admin;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.frontcontroller.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AdminAlbumDeleteController implements Controller {
    private AlbumDAO albumDAO;

    public AdminAlbumDeleteController() {
        this.albumDAO = AlbumDAO.getInstance(); // 싱글톤 인스턴스 사용
    }

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 요청 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 삭제할 앨범 번호 가져오기
        String numStr = request.getParameter("num");
        if (numStr == null || numStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "앨범 번호가 누락되었습니다.");
            return null;
        }

        int albumNum;
        try {
            albumNum = Integer.parseInt(numStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 앨범 번호 형식입니다.");
            return null;
        }

        // 관리자 권한 확인 (선택적)
        String loginId = (String) request.getSession().getAttribute("loginId");
        if (!"admin".equals(loginId)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "관리자만 삭제할 수 있습니다.");
            return null;
        }

        // 앨범 삭제
        boolean isSuccess = albumDAO.deleteAlbum(albumNum);

        if (isSuccess) {
            // 삭제 성공 시 앨범 목록 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/adminAlbumList.do");
        } else {
            // 삭제 실패 시 오류 메시지 출력
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "앨범 삭제에 실패했습니다.");
        }

        return null; // FrontController에서 뷰 렌더링을 하지 않음
    }
}