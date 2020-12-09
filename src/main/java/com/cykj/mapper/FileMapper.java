package com.cykj.mapper;

import com.cykj.bean.FileInf;

import java.util.List;

public interface FileMapper {
    public List<FileInf> findAll(FileInf fileInf);
    public int uploadFile(FileInf fileInf);
    public int delectFile(FileInf fileInf);
    public int updateFile(FileInf fileInf);
}
