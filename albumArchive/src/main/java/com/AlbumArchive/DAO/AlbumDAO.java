package com.AlbumArchive.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.AlbumArchive.VO.AlbumVO;
import com.AlbumArchive.VO.SongVO;
import com.AlbumArchive.util.MybatisConfig;

public class AlbumDAO {

    static private AlbumDAO instance;

    static public AlbumDAO getInstance() {
        if (instance == null) {
            instance = new AlbumDAO();
        }
        return instance;
    }

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

    public List<AlbumVO> getAlbumsByLikes() {
        List<AlbumVO> albumList = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
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

    public AlbumVO getOneAlbum(String name) {
        AlbumVO album = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            album = session.selectOne("com.AlbumArchive.mybatis.AlbumMapper.getOneAlbumInfo", name);
            if (album != null) {
                System.out.println("앨범아이디는 " + album.getNum());
                System.out.println("앨범이름은 " + album.getName());
            }
        } catch (Exception e) {
            System.out.println("getOneAlbumInfo 에러");
            e.printStackTrace();
        }
        return album;
    }

    public ArrayList<SongVO> getSongList(int albumNum) {
        ArrayList<SongVO> list = null;
        System.out.println("num = " + albumNum);
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            list = (ArrayList) session.selectList("com.AlbumArchive.mybatis.AlbumMapper.getSongList", albumNum);
        } catch (Exception e) {
            System.out.println("getSongList 에러");
            e.printStackTrace();
        }
        return list;
    }

    public List<AlbumVO> searchAlbums(String query) {
        List<AlbumVO> albumList = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            albumList = session.selectList("com.AlbumArchive.mybatis.AlbumMapper.searchAlbums", "%" + query + "%");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return albumList;
    }

    public List<AlbumVO> searchAlbumsForDropdown(String query) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            return session.selectList("com.AlbumArchive.mybatis.AlbumMapper.searchAlbumsForDropdown", "%" + query + "%");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
 // AlbumDAO에서 updateAlbumQty 메서드 확인
    public void updateAlbumQty(int albumNum, int qty) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession(true)) {
            // album 테이블에서 수량을 업데이트
            session.update("com.AlbumArchive.mybatis.AlbumMapper.updateAlbumQty", 
                new HashMap<String, Object>() {{
                    put("albumNum", albumNum);  // 앨범 번호 (int)
                    put("qty", qty);            // 구매한 수량
                }}
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    public String getAlbumImage(int albumNum) {
        String albumImage = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            albumImage = session.selectOne("com.AlbumArchive.mybatis.AlbumMapper.getAlbumImage", albumNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return albumImage;
    }
    
    public int updateAlbum(int num,String info,int price,int totalQty) {
    	int cnt = 0;
    	Map<String, Object> m = new HashMap<>();
        m.put("num", num);
        m.put("info", info);
        m.put("price", price);
        m.put("totalQty", totalQty);
    	 try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
    		 cnt = session.update("updateAlbum", m);
    		 session.commit();
         } catch (Exception e) {
        	 System.out.println("updateAlbum 에러");
             e.printStackTrace();
         }
    	
    	return cnt;
    }

    public boolean addAlbum(AlbumVO album) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            int result = session.insert("com.AlbumArchive.mybatis.AlbumMapper.addAlbum", album);
            if (result > 0) {
                session.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            System.out.println("addAlbum 에러");
            e.printStackTrace();
            return false;
        }
    }

}