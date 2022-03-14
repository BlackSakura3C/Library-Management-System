package com.book.domain;


public class Document {

  private long documentId;
  private String title;
  private String publisher;
  private java.sql.Date publisherDate;
  private String publisherAddress;
  private int state;
  private long indexID;
  private String branch;
  private int count;

  public int getCount() {
    return count;
  }

  public void setCount(int count) {
    this.count = count;
  }

  public String getBranch() {
    return branch;
  }

  public void setBranch(String branch) {
    this.branch = branch;
  }

  public long getIndexID() {
    return indexID;
  }

  public void setIndexID(long indexID) {
    this.indexID = indexID;
  }

  public int getState() {
    return state;
  }

  public void setState(int state) {
    this.state = state;
  }

  public long getDocumentId() {
    return documentId;
  }

  public void setDocumentId(long documentId) {
    this.documentId = documentId;
  }


  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }


  public String getPublisher() {
    return publisher;
  }

  public void setPublisher(String publisher) {
    this.publisher = publisher;
  }


  public java.sql.Date getPublisherDate() {
    return publisherDate;
  }

  public void setPublisherDate(java.sql.Date publisherDate) {
    this.publisherDate = publisherDate;
  }


  public String getPublisherAddress() {
    return publisherAddress;
  }

  public void setPublisherAddress(String publisherAddress) {
    this.publisherAddress = publisherAddress;
  }

}
