package com.cykj.Dao;

import com.cykj.bean.FileInf;

import java.util.List;

public interface FileDao {
    public List<FileInf> findAll(FileInf fileInf);
    public int uploadFile(FileInf fileInf);
    public int delectFile(FileInf fileInf);
    public int updateFile(FileInf fileInf);

}
