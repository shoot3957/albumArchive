package com.AlbumArchive.DAO;

import com.AlbumArchive.util.MybatisConfig;
import com.AlbumArchive.VO.ReviewVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ReviewDAO {
    private static ReviewDAO instance;

    private ReviewDAO() {}

    public static ReviewDAO getInstance() {
        if (instance == null) {
            instance = new ReviewDAO();
        }
        return instance;
    }

    public void addReview(ReviewVO review) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            session.insert("com.AlbumArchive.mybatis.ReviewMapper.addReview", review);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to add review", e);
        }
    }

    public List<ReviewVO> getReviewsByAlbum(int albumNum) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            return session.selectList("com.AlbumArchive.mybatis.ReviewMapper.getReviewsByAlbum", albumNum);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void updateReview(ReviewVO review) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            session.update("com.AlbumArchive.mybatis.ReviewMapper.updateReview", review);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to update review", e);
        }
    }

    public void deleteReview(int reviewNum) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            session.delete("com.AlbumArchive.mybatis.ReviewMapper.deleteReview", reviewNum);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to delete review", e);
        }
    }

    public ReviewVO getReviewByNum(int reviewNum) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            return session.selectOne("com.AlbumArchive.mybatis.ReviewMapper.getReviewByNum", reviewNum);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}