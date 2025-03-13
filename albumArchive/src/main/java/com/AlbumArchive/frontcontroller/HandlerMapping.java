package com.AlbumArchive.frontcontroller;

import java.util.HashMap;

import com.AlbumArchive.controller.MainController;
import com.AlbumArchive.controller.member.JoinController;
import com.AlbumArchive.controller.member.LoginController;



public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();

		mappings.put("/main.do", new MainController());
		mappings.put("/join.do", new JoinController());
		mappings.put("/login.do", new LoginController());
		
	}

	public Controller getController(String key) {
		return mappings.get(key);
	}
}