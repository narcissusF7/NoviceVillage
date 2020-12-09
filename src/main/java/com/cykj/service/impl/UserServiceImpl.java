package com.cykj.service.impl;

import com.cykj.Dao.UserDao;
import com.cykj.bean.UserInf;
import com.cykj.service.UserService;
import com.cykj.utils.ObjectFactory;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao userDao = (UserDao) ObjectFactory.newInstance("com.cykj.Dao.impl.UserDaoImpl");
    @Override
    public UserInf login(UserInf userInf){
        return userDao.login(userInf);
    }

    @Override
    public int register(UserInf userInf) {
        return userDao.register(userInf);
    }

    @Override
    public List<UserInf> findUsers(UserInf userInf) {
        return userDao.findUsers(userInf);
    }

    @Override
    public int changeState(UserInf userInf) {
        return userDao.changeState(userInf);
    }

    @Override
    public int deleteUser(UserInf userInf) {
        return userDao.deleteUser(userInf);
    }
}
