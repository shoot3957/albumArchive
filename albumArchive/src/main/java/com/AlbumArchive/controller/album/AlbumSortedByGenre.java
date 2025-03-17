package com.AlbumArchive.controller.album;

import java.io.IOException;
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
            // JavaScript로 alert을 띄우고, history.back()으로 이전 페이지로 돌아가게 함
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script src='/js/album.js'></script>");
            response.getWriter().println("<script>");
            response.getWriter().println("alertNoGenre();");  // 장르 선택 안 했을 때 처리
            response.getWriter().println("</script>");
            return null;
        }

        // 장르에 맞는 앨범 리스트를 가져오기 위해 AlbumDAO 사용
        List<AlbumVO> albumListByGenre = AlbumDAO.getInstance().getAlbumsByGenre(category);

        // 만약 결과가 비어 있다면, 오류 처리 또는 다른 페이지로 리디렉션
        if (albumListByGenre == null || albumListByGenre.isEmpty()) {
            // JavaScript로 alert을 띄우고, 메인 페이지로 리디렉션
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script src='/js/album.js'></script>");
            response.getWriter().println("<script>");
            response.getWriter().println("redirectToHomePage('해당 장르의 앨범이 없습니다.');");  // 장르별 앨범이 없을 때 메인 페이지로 리디렉션
            response.getWriter().println("</script>");
            return null;
        }

        // 앨범 리스트를 request에 저장하여 JSP로 전달
        request.setAttribute("albumListByGenre", albumListByGenre);

        // 장르별 앨범 리스트를 보여줄 JSP로 포워딩
        return "album/albumListByGenre";  // albumListByGenre.jsp로 이동
    }
}
