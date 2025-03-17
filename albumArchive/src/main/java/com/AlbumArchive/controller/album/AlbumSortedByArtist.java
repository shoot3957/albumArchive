package com.AlbumArchive.controller.album;

import java.io.IOException;
import java.util.List;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AlbumSortedByArtist implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 아티스트 번호(artist_num)를 파라미터로 받아오기
        String artistNumStr = request.getParameter("artist_num");

        // artist_num이 null이거나 빈 문자열인 경우, 오류 처리
        if (artistNumStr == null || artistNumStr.trim().isEmpty()) {
            System.out.println("아티스트 번호 없음");
            response.sendRedirect("main.do");  // 메인 페이지로 리디렉션
            return null;
        }

        // artist_num을 정수로 변환
        int artistNum = 0;
        try {
            artistNum = Integer.parseInt(artistNumStr);
            System.out.println("artist_num 값: " + artistNum);  // artist_num 값 확인
        } catch (NumberFormatException e) {
            System.out.println("잘못된 artist_num");
            response.sendRedirect("main.do");  // 메인 페이지로 리디렉션
            return null;
        }

        // artist_num에 맞는 앨범 리스트를 가져오기 위해 AlbumDAO 사용
        List<AlbumVO> albumListByArtist = AlbumDAO.getInstance().getAlbumsByArtist(artistNum);

        // 만약 결과가 비어 있다면, 오류 처리 후 메인 페이지로 리디렉션
        if (albumListByArtist == null || albumListByArtist.isEmpty()) {
            System.out.println("결과가 비어있음: artist_num=" + artistNum);  // 디버깅 로그 추가
            response.sendRedirect("main.do");  // 메인 페이지로 리디렉션
            return null;
        }

        // 앨범 리스트를 request에 저장하여 JSP로 전달
        request.setAttribute("albumListByArtist", albumListByArtist);

        return "album/albumListByArtist";  // 포워딩 후에는 null을 반환
    }
}
