package com.cykj.servlet;


import com.alibaba.fastjson.JSON;
import com.cykj.bean.UserInf;
import com.cykj.service.UserService;
import com.cykj.service.impl.UserServiceImpl;
import com.cykj.utils.ObjectFactory;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/userServlet")
public class UserServlet extends BaseServlet {

    UserService userService = (UserService) ObjectFactory.newInstance("com.cykj.service.impl.UserServiceImpl");
    //登录
    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accont = req.getParameter("account");
        String pwd = req.getParameter("password");
        System.out.println("账号： "+accont+" 密码： "+pwd);
        UserInf loginUser = new UserInf();
        loginUser.setAccount(accont);
        loginUser.setPassword(pwd);
        UserInf userInf = userService.login(loginUser);
        if(userInf!=null){
            req.getSession().setAttribute("userInf",userInf);
            resp.getWriter().write("登录成功");
        }else{
            resp.getWriter().write("登录失败");
        }

    }
    //注册
    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String education = request.getParameter("education");
        String sex = request.getParameter("sex");
        String profession = request.getParameter("profession");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        UserInf userInf = new UserInf(account,password,sex,phone,email,education,profession);
        System.out.println(userInf.getUserState());
        int a = userService.register(userInf);
        if (a>0){
            response.getWriter().write("注册成功");
        }else{
            response.getWriter().write("注册失败");
        }
    }
    //用户查找
    public void findUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String regTimebeg = request.getParameter("regTimebeg");
        String regTimeend = request.getParameter("regTimeend");
        UserInf userInf = new UserInf();
        if (account!=null){
            userInf.setAccount(account);
            userInf.setRegTimebeg(regTimebeg);
            if(regTimeend!=""){
                userInf.setRegTimeend(regTimeend);
            }
            System.out.println(userInf.getRegTimebeg()+"======="+userInf.getRegTimeend()+"======="+userInf.getAccount());
        }
        List<UserInf> list =userService.findUsers(userInf);
        if (list.size()>0){
            HashMap<String,Object> map =new HashMap<>();
            map.put("code",0);
            map.put("msg","");
            map.put("count",list.size());
            map.put("data",list);
            response.getWriter().write(JSON.toJSONString(map));
        }
    }
    public void changeState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId =request.getParameter("userId");
        String userState = request.getParameter("userState");
        if (userState.equals("启用")){
            userState="禁用";
        }else{
            userState="启用";
        }
        UserInf userInf = new UserInf();
        userInf.setUserState(userState);
        userInf.setUserId(Integer.parseInt(userId));
        int i = userService.changeState(userInf);
        if (i>0){
            response.getWriter().write("修改成功");
        }else {
            response.getWriter().write("修改失败");
        }
    }
    public void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId =request.getParameter("userId");

        UserInf userInf = new UserInf();
        userInf.setUserId(Integer.parseInt(userId));
        int i = userService.deleteUser(userInf);
        if (i>0){
            response.getWriter().write("修改成功");
        }else {
            response.getWriter().write("修改失败");
        }
    }
}