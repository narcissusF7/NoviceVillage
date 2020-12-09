package com.cykj.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class UserInf {
    private int userId;
    private String account ="";
    private String password;
    private String sex;
    private String phoneNum;
    private int roleId;
    private int points;
    private String regTime;
    private String state;
    private String email;
    private String education;
    private String profession;
    private String userState = "启用";
    private String regTimebeg ="";
    private String regTimeend =new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    private int upLoads = 0;
    private int downLoads = 0;
    List<PointInf> pointInfs;
    PointInf pointInf;
    public UserInf() {
    }

    public UserInf(String account, String password, String sex, String phoneNum, String email, String education, String profession) {
        this.account = account;
        this.password = password;
        this.sex = sex;
        this.phoneNum = phoneNum;
        this.email = email;
        this.education = education;
        this.profession = profession;
    }

    public UserInf(int userId, String account, String password, String sex, String phoneNum, int roleId, int points, String regTime, String state, String email, String education, String profession) {
        this.userId = userId;
        this.account = account;
        this.password = password;
        this.sex = sex;
        this.phoneNum = phoneNum;
        this.roleId = roleId;
        this.points = points;
        this.regTime = regTime;
        this.state = state;
        this.email = email;
        this.education = education;
        this.profession = profession;
    }

    public String getRegTimebeg() {
        return regTimebeg;
    }

    public void setRegTimebeg(String regTimebeg) {
        this.regTimebeg = regTimebeg;
    }

    public String getRegTimeend() {
        return regTimeend;
    }

    public void setRegTimeend(String regTimeend) {
        this.regTimeend = regTimeend;
    }

    public String getUserState() {
        return userState;
    }

    public void setUserState(String userState) {
        this.userState = userState;
    }

    public int getUpLoads() {
        return upLoads;
    }

    public void setUpLoads(int upLoads) {
        this.upLoads = upLoads;
    }

    public int getDownLoads() {
        return downLoads;
    }

    public void setDownLoads(int downLoads) {
        this.downLoads = downLoads;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public String getRegTime() {
        return regTime;
    }

    public void setRegTime(String regTime) {
        this.regTime = regTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public List<PointInf> getPointInfs() {
        return pointInfs;
    }

    public void setPointInfs(List<PointInf> pointInfs) {
        this.pointInfs = pointInfs;
    }

    public PointInf getPointInf() {
        return pointInf;
    }

    public void setPointInf(PointInf pointInf) {
        this.pointInf = pointInf;
    }
}
