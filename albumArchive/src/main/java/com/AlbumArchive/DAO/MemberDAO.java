package com.AlbumArchive.DAO;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.AlbumArchive.VO.MemberVO;
import com.AlbumArchive.util.MybatisConfig;


public class MemberDAO {

	static private MemberDAO instance;
	static public MemberDAO getInstance() { 
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	public boolean isVaildId(String id) {
		
		String count = null;
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			count = session.selectOne("isVaildId", id);
		}catch(Exception e) {
			System.out.println(" isValidId() 에러");
			e.printStackTrace();
		}
		
	    if (count != null) {
	        return true;
	    }
		return false;
	}
	public int memberJoin(MemberVO m) {
		
		Integer count = 0;
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			count = session.insert("memberJoin",m);
			session.commit();
		}catch(Exception e) {
			System.out.println(" memberJoin 에러");
			e.printStackTrace();
		}
		
	    if (count != null && count > 0) {
	        return count;
	    }
		
		return count;
	}

	public boolean checkLogin(String id, String pw) {
        MemberVO m = new MemberVO();
        m.setId(id);
        m.setPw(pw);
        MemberVO result = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            result = session.selectOne("checkLogin", m);
        } catch (Exception e) {
            System.out.println("checkLogin 에러");
            e.printStackTrace();
        }
        return result != null; // 결과가 null이 아니면 로그인 성공
    }
	
	public String isValidEmail(String email) {
		
		String id = null;
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			id = session.selectOne("isValidEmail", email);
		}catch(Exception e) {
			System.out.println(" isValidEmail 에러");
			e.printStackTrace();
		}
		
	    return id;
	}
	
	public String getPw(String email) {
		
		String pw = null;
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			pw = session.selectOne("getPw",email);
		}catch(Exception e) {
			System.out.println(" getPw 에러");
			e.printStackTrace();
		}
		return pw;
	}
	
	public MemberVO getMemberInfo(String id) {
		MemberVO m = new MemberVO();
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			m = session.selectOne("getMemberInfo",id);
		}catch(Exception e) {
			System.out.println("getMemerInfo 에러");
			e.printStackTrace();
		}
		
		return m;
	}
	
	public int chargeMoney(int money,String id) {
		
		int cnt = 0;
		
		Map<String, Object> m = new HashMap<>();
	    m.put("id", id);
	    m.put("money", money);
		
	    try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			cnt = session.update("chargeMoney",m);
			session.commit();
		}catch(Exception e) {
			System.out.println("chargeMoney 에러");
			e.printStackTrace();
		}
	    return cnt;
	}
	
	public int getMyMoney(String id) {
		int money = 0;
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			money = session.selectOne("getMyMoney",id);
		}catch(Exception e) {
			System.out.println("getMyMoney 에러");
			e.printStackTrace();
		}
		
		return money;
	}
	
	public void updateMemberInfo(String pw,String address,String email,String id) {

		
		 Map<String, String> m = new HashMap<>();
		    m.put("pw", pw);
		    m.put("address", address);
		    m.put("email", email);
		    m.put("id", id);
		
		try(SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
			session.update("updateMemberInfo",m);
			session.commit();
		}catch(Exception e) {
			System.out.println("updateMemberInfo 에러");
			e.printStackTrace();
		}
		
	}
	
    public void updateMemberMoney(String userId, int newMoney) {
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession(true)) {
            // money 차감 쿼리 호출
            session.update("com.AlbumArchive.mybatis.MemberMapper.updateMemberMoney", new HashMap<String, Object>() {{
                put("userId", userId);
                put("newMoney", newMoney);
            }});
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
