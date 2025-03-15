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
}
