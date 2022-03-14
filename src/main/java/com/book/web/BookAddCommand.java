package com.book.web;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class BookAddCommand {


    private String title;

    public String getTitle() {
        return title;
    }

    private String publisher;
    private java.sql.Date publisherDate;
    private String publisherAddress;
    private String branch;
    private String authorName;

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public void setDocumentId(long documentId) {
        this.documentId = documentId;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    private long documentId;
    private String isbn;

    public String getAuthorName() {
        return authorName;
    }

    public long getDocumentId() {
        return documentId;
    }

    public String getISBN() {
        return isbn;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public Date getPublisherDate() {
        return publisherDate;
    }

    public void setPublisherDate(Date publisherDate) {
        this.publisherDate = publisherDate;
    }

    public String getPublisherAddress() {
        return publisherAddress;
    }

    public void setPublisherAddress(String publisherAddress) {
        this.publisherAddress = publisherAddress;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}