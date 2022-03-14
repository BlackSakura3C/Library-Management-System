package com.book.service;

import com.book.domain.Library;
import com.book.domain.Reader;
import com.book.dao.ReaderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ReaderService {

    private ReaderDao readerDao;
    @Autowired
    public void setReaderDao(ReaderDao readerDao) {
        this.readerDao = readerDao;
    }
    public ArrayList<Reader> Readers(){
        return readerDao.getAllReader();
    }
    public ArrayList<Library> libraries(){
        return readerDao.getAllLibrary();
    }
    public ArrayList<Reader> Frequent(int libID){return readerDao.getFrequentReader(libID);}

    public boolean deleteReader(int readerId){
        return readerDao.deleteReader(readerId)>0;
    }

    /*public Reader getReader(int readerId){
        return readerDao.findReaderinfoByReaderId(readerId);
    }
    public boolean editReader(Reader Reader){
        return readerDao.editReader(Reader)>0;
    }*/
    public boolean addReader(Reader Reader){
        return  readerDao.addReader(Reader)>0;
    }

    /*
    public boolean updatePasswd(int readerId,String passwd){
        return readerDao.rePassword(readerId,passwd)>0;
    }
    public boolean updateName(int readerId,String name){
        return readerDao.updateName(readerId,name)>0;
    }*/
}
