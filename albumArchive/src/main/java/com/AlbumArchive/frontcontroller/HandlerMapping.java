package com.AlbumArchive.frontcontroller;

import java.util.HashMap;

import com.AlbumArchive.controller.MainController;
import com.AlbumArchive.controller.album.AlbumListAllController;
import com.AlbumArchive.controller.album.AlbumSortedByArtist;
import com.AlbumArchive.controller.album.AlbumSortedByGenre;
import com.AlbumArchive.controller.album.AlbumSortedByLikes;
import com.AlbumArchive.controller.member.JoinController;
import com.AlbumArchive.controller.member.LoginController;
import com.AlbumArchive.controller.member.LogoutController;
import com.AlbumArchive.controller.member.VaildIdAjaxController;



public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();

		mappings.put("/main.do", new MainController());
		mappings.put("/join.do", new JoinController());
		mappings.put("/login.do", new LoginController());
		mappings.put("/vaildIdAjax.do", new VaildIdAjaxController());
		mappings.put("/logout.do", new LogoutController());
		
		mappings.put("/albumListAll.do", new AlbumListAllController());
        mappings.put("/albumSortedByGenre.do", new AlbumSortedByGenre());  // 장르별 앨범 리스트
		mappings.put("/albumSortedByLikes.do", new AlbumSortedByLikes());
		mappings.put("/albumSortedByArtist.do", new AlbumSortedByArtist());
	}

	public Controller getController(String key) {
		return mappings.get(key);
	}
}