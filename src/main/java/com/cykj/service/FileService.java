package com.cykj.service;

import com.cykj.bean.FileInf;

import java.util.List;

public interface FileService {
    public List<FileInf> findAll(FileInf fileInf);
    public int uploadFile(FileInf fileInf);
    public int delectFile(FileInf fileInf);
    public int updateFile(FileInf fileInf);
}
