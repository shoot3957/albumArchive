package com.AlbumArchive.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.AlbumArchive.VO.MemberVO;
import com.AlbumArchive.util.MybatisConfig;


public class AdminDAO {

	static private AdminDAO instance;
	static public AdminDAO getInstance() { 
		if(instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}
	
	public List<MemberVO> getMemberList() {
		List<MemberVO> list = null;
		
		try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            list =  session.selectList("getMemberList");
        } catch (Exception e) {
            System.out.println("getMemberList() 에러");
            e.printStackTrace();
        }
		
		return list;
	}
	
	public void deleteMember(String id) {
		
		try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            session.delete("deleteMember",id);
            session.commit();
        } catch (Exception e) {
            System.out.println("deleteMember 에러");
            e.printStackTrace();
        }
		
	}

}
