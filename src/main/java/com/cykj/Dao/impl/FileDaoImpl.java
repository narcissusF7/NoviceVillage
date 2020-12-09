package com.cykj.Dao.impl;

import com.cykj.Dao.FileDao;
import com.cykj.bean.FileInf;
import com.cykj.mapper.FileMapper;
import com.cykj.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class FileDaoImpl implements FileDao {
    SqlSession session = MybatisUtil.getInstance().getSqlSession();
    FileMapper fileMapper = session.getMapper(FileMapper.class);
    @Override
    public List<FileInf> findAll(FileInf fileInf) {
        List<FileInf> fileInfs = fileMapper.findAll(fileInf);
        return fileInfs;
    }

    @Override
    public int uploadFile(FileInf fileInf) {
        return 0;
    }

    @Override
    public int delectFile(FileInf fileInf) {
        return 0;
    }

    @Override
    public int updateFile(FileInf fileInf) {
        System.out.println("1111111");
        return fileMapper.updateFile(fileInf);
    }
}
