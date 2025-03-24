package com.AlbumArchive.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.AlbumArchive.VO.CartVO;
import com.AlbumArchive.util.MybatisConfig;

public class CartDAO {

    // 싱글톤 패턴
    private static CartDAO instance;
    private CartDAO() {}
    public static CartDAO getInstance() {
        if (instance == null) {
            instance = new CartDAO();
        }	
        return instance;
    }

    // 장바구니에 앨범 추가
    public void addToCart(CartVO cart) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession(true)) {
            session.insert("com.AlbumArchive.mybatis.CartMapper.addToCart", cart);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 장바구니에서 특정 유저의 앨범 리스트 조회
    public List<CartVO> getCartList(String userId) {
        List<CartVO> cartList = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            cartList = session.selectList("com.AlbumArchive.mybatis.CartMapper.getCartList", userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartList;
    }

    // 장바구니에서 특정 앨범 삭제
    public void removeFromCart(int cartId) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession(true)) {
            session.delete("com.AlbumArchive.mybatis.CartMapper.removeFromCart", cartId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateCartQty(int cartId, int qty) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession(true)) {
            session.update("com.AlbumArchive.mybatis.CartMapper.updateCartQty", new CartVO(cartId, qty));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
