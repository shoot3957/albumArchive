package com.AlbumArchive.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.AlbumArchive.VO.InquiryVO;
import com.AlbumArchive.util.MybatisConfig;

public class InquiryDAO {

	static private InquiryDAO instance;
	static public InquiryDAO getInstance() { 
		if(instance == null) {
			instance = new InquiryDAO();
		}
		return instance;
	}
	
	public List<InquiryVO> getAllInquiryList(){
		
		List<InquiryVO> list = null;
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			list = session.selectList("getAllInquiryList");
		}catch(Exception e) {
			System.out.println(" getAllInquiryList 에러");
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public InquiryVO getInquiryInfo(String id) {
		
		InquiryVO i = null;
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			i = session.selectOne("getInquiryInfo", id);
		}catch(Exception e) {
			System.out.println(" getInquiryInfo 에러");
			e.printStackTrace();
		}
		
		return i;
		
	}
	
	public int sendInquiryAnswer(String answer,String id) {
		
		int cnt = 0;
		Map<String, String> m = new HashMap<>();
		m.put("id", id);
		m.put("answer", answer);
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			
			cnt = session.update("sendInquiryAnswer",m);
			session.commit();
		}catch(Exception e) {
			System.out.println(" sendInquiryAnswer 에러");
			e.printStackTrace();
		}
		
		return cnt;
		
	}
	
	public int adminDeleteInquiry(String id) {
		
		int cnt = 0;
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			cnt = session.delete("adminDeleteInquiry",id);
			session.commit();
		}catch(Exception e) {
			System.out.println(" adminDeleteInquiry 에러");
			e.printStackTrace();
		}
		
		return cnt;
		
	}
	
}
