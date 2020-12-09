package com.cykj.bean;

import java.util.List;

public class PointInf {
    private int userId;
    private String action;
    private String updateTime;
    private String type;
    private int pointChange;
    List<UserInf> users;
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPointChange() {
        return pointChange;
    }

    public void setPointChange(int pointChange) {
        this.pointChange = pointChange;
    }

    public List<UserInf> getUsers() {
        return users;
    }

    public void setUsers(List<UserInf> users) {
        this.users = users;
    }
}
