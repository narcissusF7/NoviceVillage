package com.cykj.service;

import com.cykj.bean.UserInf;

import java.util.List;

public interface UserService {
    public UserInf login(UserInf userInf);
    public int register(UserInf userInf);
    public List<UserInf> findUsers(UserInf userInf);
    public int changeState(UserInf userInf);
    public int deleteUser(UserInf userInf);
}
