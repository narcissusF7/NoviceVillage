package com.cykj.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@WebServlet(name = "BaseServlet")
public class BaseServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        拿到方法名
        String methodName =req.getParameter("methodName");
        System.out.println(methodName);
//        获取字节码对象
        Class clazz = this.getClass();

        try {
//            判断方法名是否存在
            if (methodName!=null&&!methodName.trim().equals("")) {
//                拿到方法
                Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
//                拿到地址
                String path = (String) method.invoke(this, req, resp);
//                判断地址是否存在
                if (path != null && !path.trim().equals("")) {
//                    转发地址
                    req.getRequestDispatcher(path).forward(req, resp);
                }
            }
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

    }
}