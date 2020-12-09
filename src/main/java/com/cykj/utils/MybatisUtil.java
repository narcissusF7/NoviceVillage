package com.cykj.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

public class MybatisUtil {
    private SqlSessionFactory sessionFactory = null;
    private SqlSession session = null;
    private static MybatisUtil instance =null;
    private MybatisUtil(){
        Reader reader = null;
        try {
            reader = Resources.getResourceAsReader ( "mybatis-config.xml") ;
            sessionFactory = new SqlSessionFactoryBuilder().build (reader) ;
            session = sessionFactory.openSession(false) ;
        } catch ( IOException e) {
            e.printStackTrace () ;
        } finally {
            if (null != reader) {
                try{
                    reader.close (); ;
                } catch
                ( IOException e){
                    e.printStackTrace () ;
                }
            }
        }
    }
    //获取MybatisUtil单例
    public static synchronized MybatisUtil getInstance(){
        if (null==instance){
            synchronized (MybatisUtil.class){
                instance = new MybatisUtil();
            }
        }
        return instance;
    }
    public SqlSession getSqlSession(){
        return session;
    }
}
