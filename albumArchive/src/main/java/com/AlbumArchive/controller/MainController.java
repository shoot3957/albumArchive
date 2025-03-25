package com.AlbumArchive.controller;

import java.io.IOException;
import java.util.List;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MainController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");

	    String sortOrder = request.getParameter("sortOrder"); // 라디오 버튼 클릭 시 전달된 정렬 기준

	    List<AlbumVO> albumList = null;

	    // 기본값은 최신순, 정렬을 최신순 또는 좋아요순으로 처리
	    if ("likes".equals(sortOrder)) {
	        albumList = AlbumDAO.getInstance().getAlbumsByLikes(); // 좋아요순
	    } else {
	        albumList = AlbumDAO.getInstance().getAllAlbums(); // 최신순
	    }

	    // 페이지 번호 설정 (기본값은 1)
	    int page = 1;
	    if (request.getParameter("page") != null) {
	        page = Integer.parseInt(request.getParameter("page"));
	    }

	    // 한 페이지당 표시할 앨범 수 (9개)
	    int pageSize = 6;

	    // 총 앨범 수
	    int totalAlbums = albumList.size();

	    // 총 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalAlbums / pageSize);

	    // 페이지별로 앨범 리스트 추출
	    int start = (page - 1) * pageSize;
	    int end = Math.min(start + pageSize, totalAlbums);

	    List<AlbumVO> paginatedAlbumList = albumList.subList(start, end);

	    // 좋아요 순 10개 앨범을 가져오기
	    List<AlbumVO> topLikedAlbums = AlbumDAO.getInstance().getTopLikedAlbums();

	    // 앨범 리스트와 상위 10개 앨범을 요청에 저장
	    request.setAttribute("albumList", paginatedAlbumList);
	    request.setAttribute("totalPages", totalPages);
	    request.setAttribute("currentPage", page);
	    request.setAttribute("topLikedAlbums", topLikedAlbums);

	    return "main";  // main.jsp로 포워딩
	}


}