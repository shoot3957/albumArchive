package com.AlbumArchive.DAO;

import com.AlbumArchive.util.MybatisConfig;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.Map;

public class LikesDAO {
    private static LikesDAO instance;

    private LikesDAO() {}

    public static LikesDAO getInstance() {
        if (instance == null) {
            instance = new LikesDAO();
        }
        return instance;
    }

    public boolean checkLike(String userId, int albumNum) {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("albumNum", albumNum);
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            int count = session.selectOne("com.AlbumArchive.mybatis.LikesMapper.checkLike", params);
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void addLike(String userId, int albumNum) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            params.put("albumNum", albumNum);
            session.insert("com.AlbumArchive.mybatis.LikesMapper.addLike", params);
            session.update("com.AlbumArchive.mybatis.LikesMapper.incrementLikes", albumNum);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to add like", e);
        }
    }

    public void removeLike(String userId, int albumNum) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            params.put("albumNum", albumNum);
            session.delete("com.AlbumArchive.mybatis.LikesMapper.removeLike", params);
            session.update("com.AlbumArchive.mybatis.LikesMapper.decrementLikes", albumNum);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to remove like", e);
        }
    }

    public int getLikesCount(int albumNum) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            Integer count = session.selectOne("com.AlbumArchive.mybatis.LikesMapper.getLikesCount", albumNum);
            return count != null ? count : 0;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to get likes count", e);
        }
    }
}