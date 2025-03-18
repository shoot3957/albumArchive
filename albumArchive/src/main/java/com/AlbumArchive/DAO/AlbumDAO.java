package com.AlbumArchive.DAO;

import org.apache.ibatis.session.SqlSession;
import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.util.MybatisConfig;
import java.util.List;

public class AlbumDAO {

    static private AlbumDAO instance;

    // 싱글톤 패턴
    static public AlbumDAO getInstance() {
        if (instance == null) {
            instance = new AlbumDAO();
        }
        return instance;
    }

    // 앨범 전체 리스트 조회 (등록일 순)
    public List<AlbumVO> getAllAlbums() {
        List<AlbumVO> albumList = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            albumList = session.selectList("com.AlbumArchive.mybatis.AlbumMapper.getAllAlbums");
        } catch (Exception e) {
            System.out.println("getAllAlbums 에러");
            e.printStackTrace();
        }
        return albumList;
    }
    
    public List<AlbumVO> getAlbumsByGenre(String category) {
        List<AlbumVO> albumList = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            albumList = session.selectList("com.AlbumArchive.mybatis.AlbumMapper.getAlbumsByGenre", category);
        } catch (Exception e) {
            System.out.println("getAlbumsByGenre 에러");
            e.printStackTrace();
        }
        return albumList;
    }
    
    public List<AlbumVO> getAlbumsByLikes(){
    	List<AlbumVO> albumList = null;
    	try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()){
    		albumList = session.selectList("com.AlbumArchive.mybatis.AlbumMapper.getAlbumsByLikes");
    	} catch (Exception e) {
    		System.out.println("getAlbumsByLikes 에러");
    		e.printStackTrace();
    	}
    	return albumList;
    }
    
    public List<AlbumVO> getAlbumsByArtist(int artistNum) {
        List<AlbumVO> albumList = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            albumList = session.selectList("com.AlbumArchive.mybatis.AlbumMapper.getAlbumsByArtist", artistNum);
            System.out.println("앨범 리스트 크기: " + (albumList != null ? albumList.size() : "null"));
        } catch (Exception e) {
            System.out.println("getAlbumsByArtist 에러");
            e.printStackTrace();
        }
        return albumList;
    }
    
 // 좋아요 순으로 상위 10개 앨범 가져오기
    public List<AlbumVO> getTopLikedAlbums() {
        List<AlbumVO> topLikedAlbums = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            topLikedAlbums = session.selectList("com.AlbumArchive.mybatis.AlbumMapper.getTopLikedAlbums");
        } catch (Exception e) {
            System.out.println("getTopLikedAlbums 에러");
            e.printStackTrace();
        }
        return topLikedAlbums;
    }


}
