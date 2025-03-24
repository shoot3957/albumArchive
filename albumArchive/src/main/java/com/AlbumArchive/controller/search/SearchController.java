package com.AlbumArchive.controller.search;

import java.io.IOException;
import java.util.List;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SearchController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 검색어를 요청 파라미터에서 받음
        String query = request.getParameter("query");
        if (query == null || query.trim().isEmpty()) {
            // 검색어가 없으면 메인 페이지로 리디렉션
            response.sendRedirect("main.do");
            return null;
        }

        // AlbumDAO를 통해 검색 결과 가져오기
        List<AlbumVO> albumList = AlbumDAO.getInstance().searchAlbums(query);

        // 검색 결과를 request에 저장
        request.setAttribute("albumList", albumList);

        // 검색 결과 페이지로 이동
        return "album/searchResults";  // searchResults.jsp로 이동
    }
}