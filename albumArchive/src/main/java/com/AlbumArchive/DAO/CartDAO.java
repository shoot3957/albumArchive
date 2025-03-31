package com.AlbumArchive.DAO;

import java.util.List;
import java.util.Map;

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
 // 특정 사용자와 앨범 번호에 해당하는 장바구니 항목 조회
    public CartVO getCartItem(String userId, int albumNum) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            return session.selectOne("com.AlbumArchive.mybatis.CartMapper.getCartItem", 
                                    Map.of("userId", userId, "albumNum", albumNum));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
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
        System.out.println("카트삭제");
    }

    // 유저의 장바구니 전체 삭제
    public void removeAllFromCartByUserId(String userId) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession(true)) {
            session.delete("com.AlbumArchive.mybatis.CartMapper.removeAllFromCartByUserId", userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 장바구니 수량 업데이트
    public void updateCartQty(int cartId, int qty) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession(true)) {
            session.update("com.AlbumArchive.mybatis.CartMapper.updateCartQty", new CartVO(cartId, qty));
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("카트업뎃");
        System.out.println(cartId);
    }
}
