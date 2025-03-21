package com.AlbumArchive.controller.member;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.VO.SongVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AlbumInfoController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("albumName");
		System.out.println(name);
		AlbumVO album = AlbumDAO.getInstance().getOneAlbum(name);
		System.out.println("아이디는 "+album.getNum());
		List<SongVO> song = AlbumDAO.getInstance().getSongList(album.getNum());
		request.setAttribute("album", album);
		
		return "album/albumInfoForm";
	}

}
