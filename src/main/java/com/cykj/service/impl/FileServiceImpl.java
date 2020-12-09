package com.cykj.service.impl;

import com.cykj.Dao.FileDao;
import com.cykj.Dao.UserDao;
import com.cykj.bean.FileInf;
import com.cykj.service.FileService;
import com.cykj.utils.ObjectFactory;

import java.util.List;

public class FileServiceImpl implements FileService {
    FileDao fileDao = (FileDao) ObjectFactory.newInstance("com.cykj.Dao.impl.FileDaoImpl");
    @Override
    public List<FileInf> findAll(FileInf fileInf) {
        return fileDao.findAll(fileInf);
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
        return fileDao.updateFile(fileInf);
    }
}
