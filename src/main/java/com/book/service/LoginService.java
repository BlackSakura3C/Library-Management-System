package com.book.service;

import com.book.dao.AdminDao;
import com.book.dao.ReaderDao;
import com.book.domain.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    private ReaderDao readerDao;
    private AdminDao adminDao;
    @Autowired
    public void setReaderDao(ReaderDao readerDao) {
        this.readerDao = readerDao;
    }



    @Autowired
    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    public boolean hasMatchReader(int readerId,String passwd){
        return  readerDao.getMatchCount(readerId, passwd)>0;
    }

    public Reader findReaderByUserId(int readerId){
        return readerDao.findReaderByReaderId(readerId);
    }

    public boolean hasMatchAdmin(long adminId,String password){
        return adminDao.getMatchCount(adminId,password)==1;
    }

    public boolean adminRePasswd(long adminId,String newPasswd){
        return adminDao.rePassword(adminId,newPasswd)>0;
    }
    public String getAdminPasswd(long id){
        return adminDao.getPasswd(id);
    }



}
