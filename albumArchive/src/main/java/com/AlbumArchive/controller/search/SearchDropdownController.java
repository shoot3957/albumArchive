package com.AlbumArchive.controller.search;

import java.io.IOException;
import java.util.List;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SearchDropdownController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 검색어를 요청 파라미터에서 받음
        String query = request.getParameter("query");
        if (query == null || query.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return null;
        }

        // AlbumDAO를 통해 관련 앨범 검색
        List<AlbumVO> albumList = AlbumDAO.getInstance().searchAlbumsForDropdown(query);

        // 결과를 JSON으로 반환
        response.setContentType("application/json");
        response.getWriter().write(new com.google.gson.Gson().toJson(albumList));

        return null;
    }
}
