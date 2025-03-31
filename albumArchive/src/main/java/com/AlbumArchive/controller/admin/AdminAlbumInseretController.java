package com.AlbumArchive.controller.admin;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.frontcontroller.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AdminAlbumInseretController implements Controller {
    private AlbumDAO albumDAO;

    public AdminAlbumInseretController() {
        this.albumDAO = AlbumDAO.getInstance(); // 싱글톤 인스턴스 사용
    }

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 요청 인코딩 설정
    	request.setCharacterEncoding("UTF-8");

        // 폼 데이터 추출
        String name = request.getParameter("name");
        String artistNumStr = request.getParameter("artistNum");
        String info = request.getParameter("info");
        String priceStr = request.getParameter("price");
        String totalQtyStr = request.getParameter("totalQty");
        String category = request.getParameter("category");
        String dates = request.getParameter("dates");
        String img = request.getParameter("img");

        // 필수 파라미터 검증
        if (name == null || artistNumStr == null || info == null || priceStr == null ||
            totalQtyStr == null || category == null || dates == null || img == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "필수 파라미터가 누락되었습니다.");
            return null;
        }

        try {
            // 숫자형 데이터 파싱
            int artistNum = Integer.parseInt(artistNumStr);
            int price = Integer.parseInt(priceStr);
            int totalQty = Integer.parseInt(totalQtyStr);

            // AlbumVO 객체 생성 및 데이터 설정
            AlbumVO album = new AlbumVO();
            album.setName(name);
            album.setArtistNum(artistNum);
            album.setInfo(info);
            album.setPrice(price);
            album.setTotalQty(totalQty);
            album.setCategory(category);
            album.setDates(dates);
            album.setImg(img);
            album.setMood(info);

            // 데이터베이스에 앨범 추가
            boolean isSuccess = albumDAO.addAlbum(album);

            // 응답 처리
            if (isSuccess) {
                // 성공 시 앨범 목록 페이지로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/adminAlbumList.do");
            } else {
                // 실패 시 오류 메시지 출력
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "앨범 추가에 실패했습니다.");
            }
        } catch (NumberFormatException e) {
            // 숫자 변환 실패 시 오류 응답
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 숫자 형식입니다.");
            return null;
        }

        return null; // FrontController에서 뷰 렌더링을 하지 않음
    }
}