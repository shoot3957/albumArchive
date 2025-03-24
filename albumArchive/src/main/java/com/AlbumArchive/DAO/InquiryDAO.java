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

    // 전체 문의 수를 가져오는 메서드 추가
    public int getTotalInquiryCount() {
        int count = 0;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            count = session.selectOne("getTotalInquiryCount");
        } catch (Exception e) {
            System.out.println("getTotalInquiryCount 에러");
            e.printStackTrace();
        }
        return count;
    }

    // 페이징을 지원하도록 getAllInquiryList 수정
    public List<InquiryVO> getAllInquiryList(int page, int pageSize) {
        List<InquiryVO> list = null;
        Map<String, Integer> params = new HashMap<>();
        params.put("start", (page - 1) * pageSize); // 시작 인덱스 계산
        params.put("pageSize", pageSize);

        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            list = session.selectList("getAllInquiryList", params);
        } catch (Exception e) {
            System.out.println("getAllInquiryList 에러");
            e.printStackTrace();
        }
        return list;
    }

    // 나머지 메서드는 변경 없음
    public InquiryVO getInquiryInfo(int num) {
        InquiryVO i = null;
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            i = session.selectOne("getInquiryInfo", num);
        } catch (Exception e) {
            System.out.println("getInquiryInfo 에러");
            e.printStackTrace();
        }
        return i;
    }

    public int sendInquiryAnswer(String answer, String id) {
        int cnt = 0;
        Map<String, String> m = new HashMap<>();
        m.put("id", id);
        m.put("answer", answer);
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            cnt = session.update("sendInquiryAnswer", m);
            session.commit();
        } catch (Exception e) {
            System.out.println("sendInquiryAnswer 에러");
            e.printStackTrace();
        }
        return cnt;
    }

    public int adminDeleteInquiry(String num) {
        int cnt = 0;
        int number = Integer.parseInt(num);
        try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
            cnt = session.delete("adminDeleteInquiry", number);
            session.commit();
        } catch (Exception e) {
            System.out.println("adminDeleteInquiry 에러");
            e.printStackTrace();
        }
        return cnt;
    }
    
    public int insertInquiry(String id, String title, String info) {
    	int cnt = 0;
    	
    	 System.out.println("id = " + id);
    	 System.out.println("title = " + title);
    	 System.out.println("info = " + info);
    	 Map<String,String> params = new HashMap<>();
         params.put("id", id); 
         params.put("title", title);
         params.put("info", info);
         
         try (SqlSession session = MybatisConfig.getSqlSessionFactory().openSession()) {
             cnt = session.insert("insertInquiry", params);
             session.commit();
         } catch (Exception e) {
             System.out.println("insertInquiry 에러");
             e.printStackTrace();
         }
    	
    	return cnt;
    	
    }
}