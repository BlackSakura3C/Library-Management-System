package com.book.service;

import com.book.dao.BookDao;
import com.book.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BookService {
    private BookDao bookDao;

    @Autowired
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    public ArrayList<Document> queryBook(String searchWord) {
        return bookDao.queryBook(searchWord);
    }

    public ArrayList<Paper> queryPaper(String searchWord) {
        return bookDao.queryPaper(searchWord);
    }

    public ArrayList<Document> getAllBooks() {
        return bookDao.getAllBooks();
    }

    public ArrayList<Paper> getAllPapers() {
        return bookDao.getAllPaper();
    }

    public boolean matchPaper(String searchWord) {
        return bookDao.matchPaper(searchWord) > 0;
    }

    public int addPaper(Paper paper) {
        return bookDao.addPaper(paper);
    }


    public boolean deletePaper(int paperId) {
        return bookDao.deletePaper(paperId) > 0;
    }


    public int deleteBook(long bookId) {
        return bookDao.deleteBook(bookId);
    }

    public boolean matchBook(String searchWord) {
        return bookDao.matchBook(searchWord) > 0;
    }

//    public boolean addDocument(Document document) {
//        return bookDao.addDocument(document) > 0;
//    }

    public int addBook(Document document, Book book) {
        return bookDao.addDocument(document, book);
    }

    public Document getDocument(Long documentId) {
        Document document = bookDao.getDocument(documentId);
        return document;
    }

    public Book getbook(Long documentId) {
        Book book = bookDao.getBook(documentId);
        return book;
    }

    public Journalvolume getjournalvolume(Long documentId) {
        Journalvolume journalvolume = bookDao.getjournalvolume(documentId);
        return journalvolume;
    }

    public Conference getconference(Long documentId) {
        Conference conference = bookDao.getconference(documentId);
        return conference;
    }

    public ArrayList<Document> getpopularBooks(int libID) {
        return bookDao.getpopularDocument(libID);
    }

    /*public boolean editBook(Book book){
        return bookDao.editBook(book)>0;
    }*/

}
