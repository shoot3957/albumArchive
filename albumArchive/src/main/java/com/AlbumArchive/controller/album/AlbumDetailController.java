package com.AlbumArchive.controller.album;

import com.AlbumArchive.DAO.AlbumDAO;
import com.AlbumArchive.DAO.LikesDAO;
import com.AlbumArchive.DAO.ReviewDAO;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.VO.SongVO;
import com.AlbumArchive.VO.ReviewVO;
import com.AlbumArchive.frontcontroller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AlbumDetailController implements Controller {
    private AlbumDAO albumDAO;
    private LikesDAO likesDAO;
    private ReviewDAO reviewDAO;

    public AlbumDetailController() {
        this.albumDAO = AlbumDAO.getInstance();
        this.likesDAO = LikesDAO.getInstance();
        this.reviewDAO = ReviewDAO.getInstance();
    }

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("albumName");
        System.out.println("앨범 이름: " + name);

        AlbumVO album = albumDAO.getOneAlbum(name);
        if (album == null) {
            System.out.println("앨범을 찾을 수 없습니다.");
            return "error";
        }

        System.out.println("앨범 ID: " + album.getNum());
        List<SongVO> songs = albumDAO.getSongList(album.getNum());
        List<ReviewVO> reviews = reviewDAO.getReviewsByAlbum(album.getNum());

        String loginId = (String) request.getSession().getAttribute("loginId");
        boolean isLiked = loginId != null && likesDAO.checkLike(loginId, album.getNum());

        request.setAttribute("album", album);
        request.setAttribute("songs", songs);
        request.setAttribute("reviews", reviews);
        request.setAttribute("isLiked", isLiked);
        request.setAttribute("loginId", loginId);

        return "album/albumDetail";
    }
}