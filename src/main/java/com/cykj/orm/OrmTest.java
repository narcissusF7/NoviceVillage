package com.cykj.orm;

import com.cykj.bean.UserInf;
import com.cykj.mapper.PointMapper;
import com.cykj.mapper.UserMapper;
import com.cykj.utils.MybatisUtil;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.text.SimpleDateFormat;
import java.util.Date;


public class OrmTest {
//    public static void main(String[] args) {
//        TestTable tt = new TestTable();
//        tt.setName("perter");
//        tt.setPwd("123456");
//        Element root =MappingUtils.fetchXml();
//        Element foo = null;
//        for (Iterator i = root.elementIterator("table");i.hasNext();){
//            foo= (Element) i.next();
//        }
//        String sql = MappingUtils.fetchInsertSql(foo.attributeValue("name"));
//        System.out.println(sql);
//    }
public static void main(String[] args) {
//    UserInf user = new UserInf();
//    user.setAccount("123qq");
//    user.setPassword("qwerdf");
////    RowBounds rb = new RowBounds(1,10);//分页
//    SqlSession session = MybatisUtil.getInstance().getSqlSession();
//    UserMapper userMap =session.getMapper(UserMapper.class);
//    userMap.addUser(user);
//    session.commit();
//    session.close();
    SqlSession session = MybatisUtil.getInstance().getSqlSession();
    PointMapper pointMapper = session.getMapper(PointMapper.class);
//    pointMapper.findAll();
//    pointMapper.findAllUser();
    pointMapper.findUserByJoin2();
    session.commit();
    session.close();

//    System.out.println(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
//    //把配置文件读取到Io流
//    try {
//        Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
//        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
//        SqlSession session = sessionFactory.openSession(false);//打开事务，关闭自动提交
//        UserMap userMap =session.getMapper(UserMap.class);
//        userMap.addUser(user);
//        session.commit();
//        session.close();
//    } catch (IOException e) {
//        e.printStackTrace();
//    }

}
}
