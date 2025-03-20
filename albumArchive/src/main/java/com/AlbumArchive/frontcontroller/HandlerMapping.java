package com.AlbumArchive.frontcontroller;

import java.util.HashMap;

import com.AlbumArchive.controller.MainController;
import com.AlbumArchive.controller.admin.AdminMemberDeleteController;
import com.AlbumArchive.controller.admin.AdminMemberListController;
import com.AlbumArchive.controller.album.AlbumListAllController;
import com.AlbumArchive.controller.album.AlbumSortedByArtist;
import com.AlbumArchive.controller.album.AlbumSortedByGenre;
import com.AlbumArchive.controller.album.AlbumSortedByLikes;
import com.AlbumArchive.controller.member.AlbumInfoController;
import com.AlbumArchive.controller.member.CheckRdCode;
import com.AlbumArchive.controller.member.FindIdController;
import com.AlbumArchive.controller.member.FindPwController;
import com.AlbumArchive.controller.member.JoinController;
import com.AlbumArchive.controller.member.LoginController;
import com.AlbumArchive.controller.member.LogoutController;
import com.AlbumArchive.controller.member.RdCodeResultController;
import com.AlbumArchive.controller.member.VaildIdAjaxController;
import com.AlbumArchive.controller.member.ValidEmailAjaxController;



public class HandlerMapping {
	private HashMap<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();

		// 멤버 컨트롤러
		mappings.put("/main.do", new MainController());
		mappings.put("/join.do", new JoinController());
		mappings.put("/login.do", new LoginController());
		mappings.put("/vaildIdAjax.do", new VaildIdAjaxController());
		mappings.put("/logout.do", new LogoutController());
		mappings.put("/findId.do", new FindIdController());
		mappings.put("/findPw.do", new FindPwController());
		mappings.put("/validEmailAjax.do", new ValidEmailAjaxController());
		mappings.put("/checkRdCode.do", new CheckRdCode());
		mappings.put("/rdCodeResult.do", new RdCodeResultController());
		
		// 앨범 컨트롤러
		mappings.put("/albumListAll.do", new AlbumListAllController());
        mappings.put("/albumSortedByGenre.do", new AlbumSortedByGenre());  // 장르별 앨범 리스트
		mappings.put("/albumSortedByLikes.do", new AlbumSortedByLikes());
		mappings.put("/albumSortedByArtist.do", new AlbumSortedByArtist());
		mappings.put("/albumDetail.do", new AlbumInfoController());
		
		// 관리자 컨트롤러
		mappings.put("/adminMemberList.do", new AdminMemberListController());
		mappings.put("/adminMemberDelete.do", new AdminMemberDeleteController());
		
		
		
	}

	public Controller getController(String key) {
		return mappings.get(key);
	}
}