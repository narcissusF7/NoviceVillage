package com.cykj.Dao.impl;

import com.cykj.Dao.UserDao;
import com.cykj.bean.UserInf;
import com.cykj.mapper.UserMapper;
import com.cykj.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.sql.*;
import java.util.List;

public class UserDaoImpl implements UserDao {
    SqlSession session = MybatisUtil.getInstance().getSqlSession();
    UserMapper userMap =session.getMapper(UserMapper.class);
    @Override
    public UserInf login(UserInf userInf) {
        UserInf loginer = userMap.login(userInf);
        session.commit();
        return loginer;
    }

    @Override
    public int register(UserInf userInf) {
        int a =userMap.addUser(userInf);
        session.commit();
        return a;
    }

    @Override
    public List<UserInf> findUsers(UserInf userInf) {
        List<UserInf> userInfs = userMap.findAll(userInf);
        session.commit();
        return userInfs;
    }

    @Override
    public int changeState(UserInf userInf) {
        int i = userMap.changeState(userInf);
        return i;
    }

    @Override
    public int deleteUser(UserInf userInf) {
        return userMap.deleteUserById(userInf);
    }
}
