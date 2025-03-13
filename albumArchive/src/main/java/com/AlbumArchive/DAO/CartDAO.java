package com.AlbumArchive.DAO;

import org.apache.ibatis.session.SqlSessionFactory;

public class CartDAO {
	private static CartDAO instance = new CartDAO();
    private SqlSessionFactory factory;
    
    private CartDAO() {
    
    }
}
