package com.cykj.mapper;

import com.cykj.bean.PointInf;
import com.cykj.bean.UserInf;

import java.util.List;

public interface PointMapper {
    List<PointInf> findAll();
    List<UserInf>findAllUser();
    List<UserInf>findUserByJoin();
    List<PointInf>findUserByJoin2();
}
