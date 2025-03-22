package com.AlbumArchive.DAO;

import com.AlbumArchive.VO.ArtistVO;
import com.AlbumArchive.util.MybatisConfig;
import org.apache.ibatis.session.SqlSession;
import java.util.List;

public class ArtistDAO {
    
    private static ArtistDAO instance;

    private ArtistDAO() {}

    public static ArtistDAO getInstance() {
        if (instance == null) {
            instance = new ArtistDAO();
        }
        return instance;
    }

    public List<ArtistVO> getAllArtists() {
        List<ArtistVO> artistList = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            artistList = session.selectList("com.AlbumArchive.mybatis.ArtistMapper.getAllArtists");
        } catch (Exception e) {
            System.out.println("getAllArtists 에러");
            e.printStackTrace();
        }
        return artistList;
    }
}
