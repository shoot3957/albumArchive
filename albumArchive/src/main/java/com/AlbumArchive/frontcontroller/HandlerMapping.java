package com.AlbumArchive.frontcontroller;

import java.util.HashMap;

import com.AlbumArchive.controller.MainController;
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
		
	}

	public Controller getController(String key) {
		return mappings.get(key);
	}
}