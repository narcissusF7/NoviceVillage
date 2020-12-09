package com.cykj.mapper;

import com.cykj.bean.PointInf;
import com.cykj.bean.UserInf;

import java.util.List;

public interface UserMapper {
    int addUser(UserInf userInf);
    int deleteUserById(UserInf userInf);
    int updateUser(UserInf userInf);
    List<UserInf>findAll(UserInf userInf);
    UserInf login(UserInf userInf);
    int changeState(UserInf userInf);
}
