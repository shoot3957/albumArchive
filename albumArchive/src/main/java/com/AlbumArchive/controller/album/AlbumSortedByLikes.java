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

public class AlbumSortedByLikes implements Controller {
	
	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		List<AlbumVO> albumList = AlbumDAO.getInstance().getAlbumsByLikes();
		
		if(albumList == null || albumList.isEmpty()) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<script src='/js/album.js'></script>");
			response.getWriter().println("<script>");
			response.getWriter().println("redirectToHomePage();");  // 메인 페이지로 리디렉션
			response.getWriter().println("</script>");
			return null;
		}
		
		request.setAttribute("albumList", albumList);
		
		return "album/albumListByLikes";
	}

}
