package com.AlbumArchive.frontcontroller;

import java.util.HashMap;

import com.AlbumArchive.controller.MainController;
import com.AlbumArchive.controller.admin.AdminDeleteInquiryController;
import com.AlbumArchive.controller.admin.AdminInquiryAnswerController;
import com.AlbumArchive.controller.admin.AdminInquiryListController;
import com.AlbumArchive.controller.admin.AdminInquirySendAnswerController;
import com.AlbumArchive.controller.admin.AdminMemberDeleteController;
import com.AlbumArchive.controller.admin.AdminMemberListController;
import com.AlbumArchive.controller.admin.AdminPurchaseListController;
import com.AlbumArchive.controller.album.AlbumListAllController;
import com.AlbumArchive.controller.album.AlbumSortedByArtist;
import com.AlbumArchive.controller.album.AlbumSortedByGenre;
import com.AlbumArchive.controller.album.AlbumSortedByLikes;
import com.AlbumArchive.controller.inquiry.InquiryFormController;
import com.AlbumArchive.controller.inquiry.InquiryInfoController;
import com.AlbumArchive.controller.inquiry.InsertInquiryController;
import com.AlbumArchive.controller.member.CheckRdCode;
import com.AlbumArchive.controller.member.DeleteMemberController;
import com.AlbumArchive.controller.member.FindIdController;
import com.AlbumArchive.controller.member.FindPwController;
import com.AlbumArchive.controller.member.JoinController;
import com.AlbumArchive.controller.member.LoginController;
import com.AlbumArchive.controller.member.LogoutController;
import com.AlbumArchive.controller.member.MemberPurchaseListController;
import com.AlbumArchive.controller.member.MyPageController;
import com.AlbumArchive.controller.member.RdCodeResultController;
import com.AlbumArchive.controller.member.UpdateMemberController;
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
		mappings.put("/myPage.do", new MyPageController());
		mappings.put("/updateMember.do", new UpdateMemberController());
		mappings.put("/memberPurchaseList.do", new MemberPurchaseListController());
		mappings.put("/deleteMember.do", new DeleteMemberController());
		
		
		
		// 앨범 컨트롤러
		mappings.put("/albumListAll.do", new AlbumListAllController());
        mappings.put("/albumSortedByGenre.do", new AlbumSortedByGenre());  // 장르별 앨범 리스트
		mappings.put("/albumSortedByLikes.do", new AlbumSortedByLikes());
		mappings.put("/albumSortedByArtist.do", new AlbumSortedByArtist());
		
		// 관리자 컨트롤러
		mappings.put("/adminMemberList.do", new AdminMemberListController());
		mappings.put("/adminMemberDelete.do", new AdminMemberDeleteController());
		mappings.put("/adminPurchaseList.do", new AdminPurchaseListController());
		mappings.put("/adminInquiryList.do", new AdminInquiryListController());
		mappings.put("/adminInquiryAnswer.do", new AdminInquiryAnswerController());
		mappings.put("/adminSendAnswer.do", new AdminInquirySendAnswerController());
		mappings.put("/adminDeleteInquiry.do", new AdminDeleteInquiryController());
		
		// 문의 컨트롤러
		mappings.put("/inquiryForm.do", new InquiryFormController());
		mappings.put("/insertInquiry.do", new InsertInquiryController());
		mappings.put("/inquiryInfo.do", new InquiryInfoController());
		
		
	}

	public Controller getController(String key) {
		return mappings.get(key);
	}
}