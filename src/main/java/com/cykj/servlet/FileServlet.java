package com.cykj.servlet;

import com.alibaba.fastjson.JSON;
import com.cykj.Dao.FileDao;
import com.cykj.bean.FileInf;
import com.cykj.service.FileService;
import com.cykj.utils.ObjectFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/fileServlet")
public class FileServlet extends BaseServlet{
    FileService fileService = (FileService) ObjectFactory.newInstance("com.cykj.service.impl.FileServiceImpl");
    public void findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileName = req.getParameter("fileName");
        String account = req.getParameter("account");
        String timeBeg = req.getParameter("timeBeg");
        String timeEnd = req.getParameter("timeEnd");
        String fileType = req.getParameter("fileType");
        FileInf fileInf = new FileInf();
        fileInf.setFileName(fileName);
        fileInf.setAccount(account);
        fileInf.setTimeBeg(timeBeg);
        fileInf.setTimeEnd(timeEnd);
        fileInf.setFileType(fileType);
        List<FileInf> list =fileService.findAll(fileInf);
        if (list.size()>0){
            HashMap<String,Object> map =new HashMap<>();
            map.put("code",0);
            map.put("msg","查无数据");
            map.put("count",list.size());
            map.put("data",list);
            resp.getWriter().write(JSON.toJSONString(map));
        }
    }

    public void changeFileState(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileState = req.getParameter("fileState");
        String fileId = req.getParameter("fileId");
        System.out.println(fileId+"========="+fileState);
        FileInf fileInf = new FileInf();
        fileInf.setFileId(Integer.parseInt(fileId));
        fileInf.setFileState(fileState);
        int x =fileService.updateFile(fileInf);
        if (x>0){
            resp.getWriter().write("修改成功");
        }else{
            resp.getWriter().write("修改失败");
        }
    }

    public void changeFileTypeState(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] fileSufs = req.getParameterValues("fileSuf");
        System.out.println(fileSufs[0]);
    }
}
