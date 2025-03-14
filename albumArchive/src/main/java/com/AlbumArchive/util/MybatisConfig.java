package com.AlbumArchive.util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisConfig {
    private static SqlSessionFactory sqlSessionFactory;

    static {
        try {
            String resource = "com/AlbumArchive/mybatis/config.xml"; 
            System.out.println("MyBatis 설정 파일 로드 시도: " + resource);
            
            InputStream inputStream = Resources.getResourceAsStream(resource);
            
            if (inputStream == null) {
                throw new RuntimeException("MyBatis 설정 파일을 찾을 수 없습니다: " + resource);
            }

            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            System.out.println("MyBatis 설정 완료!");
        } catch (Exception e) {
            System.err.println("MyBatis 설정 오류: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }
}