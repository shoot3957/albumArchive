package com.AlbumArchive.DAO;

import java.util.List;

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
	
}
