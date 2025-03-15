package com.AlbumArchive.controller.album;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AlbumSortedByGenre implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 장르를 파라미터로 받아오기
        String category = request.getParameter("category");

        // category가 null이거나 빈 문자열인 경우, 오류 처리
        if (category == null || category.trim().isEmpty()) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.println("<script>alert('장르를 선택해주세요.'); history.back();</script>");
            writer.close();
            return null;
        }

        // 장르에 맞는 앨범 리스트를 가져오기 위해 AlbumDAO 사용
        List<AlbumVO> albumListByGenre = AlbumDAO.getInstance().getAlbumsByGenre(category);

        // 만약 결과가 비어 있다면, 오류 처리 또는 다른 페이지로 리디렉션
        if (albumListByGenre == null || albumListByGenre.isEmpty()) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.println("<script>alert('해당 장르의 앨범이 없습니다.'); history.back();</script>");
            writer.close();
            return null;  // 실패 시 null을 반환해 리디렉션하지 않음
        }

        // 앨범 리스트를 request에 저장하여 JSP로 전달
        request.setAttribute("albumListByGenre", albumListByGenre);

        // 장르별 앨범 리스트를 보여줄 JSP로 포워딩
        return "album/albumListByGenre";  // albumListByGenre.jsp로 이동
    }
}
