package com.AlbumArchive.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.frontcontroller.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class adminAlbumListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 앨범 데이터를 가져오기 위해 AlbumDAO 사용
		List<AlbumVO> albumList = AlbumDAO.getInstance().getAllAlbums();

		// 만약 앨범 리스트가 비어 있다면, 오류 처리 또는 다른 페이지로 리디렉션
		if (albumList == null || albumList.isEmpty()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('앨범이 없습니다.'); history.back();</script>");
			writer.close();
			return null; // 실패 시 null을 반환해 리디렉션하지 않음
		}

		// 앨범 리스트를 request에 저장하여 JSP로 전달
		request.setAttribute("albumList", albumList);

		// 앨범 리스트를 보여줄 JSP로 포워딩
		return "admin/albumList"; // albumListAll.jsp로 이동
	}

}
