package com.AlbumArchive.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.AlbumArchive.VO.PurchaseVO;
import com.AlbumArchive.util.MybatisConfig;

public class PurchaseDAO {

	static private PurchaseDAO instance;
	static public PurchaseDAO getInstance() { 
		if(instance == null) {
			instance = new PurchaseDAO();
		}
		return instance;
	}
	
	public List<PurchaseVO> getPurchaseList(){
		
		List<PurchaseVO> list = null;
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			list = session.selectList("getPurchaseList");
		}catch(Exception e) {
			System.out.println(" getPurchaseList 에러");
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public List<PurchaseVO> getMemberPurchaseList(String id){
		
		List<PurchaseVO> list = null;
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			list = session.selectList("getMemberPurchaseList",id);
		}catch(Exception e) {
			System.out.println(" getMemberPurchaseList 에러");
			e.printStackTrace();
		}
		
		
		return list;
	}
    // 구매 내역 추가
    public void addPurchase(PurchaseVO purchase) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession(true)) {
            session.insert("com.AlbumArchive.mybatis.PurchaseMapper.addPurchase", purchase);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
