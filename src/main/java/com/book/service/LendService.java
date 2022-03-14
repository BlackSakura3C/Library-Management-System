package com.book.service;

import com.book.dao.LendDao;
import com.book.domain.Borrow;
import com.book.domain.Reserve;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class LendService {
    private LendDao lendDao;

    @Autowired
    public void setLendDao(LendDao lendDao) {
        this.lendDao = lendDao;
    }

    public boolean bookReturn(long documentId,long indexId){
        return lendDao.bookReturnOne(documentId,indexId)>0 && lendDao.bookReturnTwo(documentId,indexId)>0;
    }

    public boolean bookLend(long documentId,long indexId){
        return lendDao.bookLendOne(documentId,indexId)>0 && lendDao.bookLendTwo(documentId,indexId)>0;
    }

    public boolean bookReserve(long documentId,long indexId){
        return lendDao.bookReserve(documentId,indexId)>0;
    }

    public ArrayList<Borrow> lendList(){
        return lendDao.lendList();
    }
    public ArrayList<Borrow> myLendList(long readerId){
        return lendDao.myLendList(readerId);
    }
    public ArrayList<Reserve> myReserveList(long readerId){
        return lendDao.myReserveList(readerId);
    }
}
