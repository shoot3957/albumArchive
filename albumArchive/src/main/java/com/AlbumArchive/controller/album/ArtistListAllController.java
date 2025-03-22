package com.AlbumArchive.controller.album;

import java.io.IOException;
import java.util.List;

import com.AlbumArchive.DAO.ArtistDAO;
import com.AlbumArchive.VO.ArtistVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ArtistListAllController implements Controller {

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // ArtistDAO에서 아티스트 목록 가져오기
        List<ArtistVO> artistList = ArtistDAO.getInstance().getAllArtists();
        
        // 아티스트 리스트를 JSP에 전달
        request.setAttribute("artistList", artistList);
        
        // JSP로 포워딩
        return "album/artistListAll";  // JSP 파일 경로
    }
}
