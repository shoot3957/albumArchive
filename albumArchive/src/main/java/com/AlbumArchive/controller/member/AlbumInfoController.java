package com.AlbumArchive.controller.member;
import java.io.IOException;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AlbumInfoController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		
		AlbumVO album = AlbumDAO.getInstance().getOneAlbum(name);
		request.setAttribute("album", album);
		
		return "album/albumInfo";
	}

}
