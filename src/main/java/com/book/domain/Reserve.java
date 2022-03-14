package com.book.domain;


public class Reserve {

  private long readerId;
  private long indexId;
  private java.sql.Date beserveTime;
  private long documentId;
  private int state;
  private String branch;
  private String title;

  public String getBranch() {
    return branch;
  }

  public void setBranch(String branch) {
    this.branch = branch;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
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

  public long getReaderId() {
    return readerId;
  }

  public void setReaderId(long readerId) {
    this.readerId = readerId;
  }


  public long getIndexId() {
    return indexId;
  }

  public void setIndexId(long indexId) {
    this.indexId = indexId;
  }


  public java.sql.Date getBeserveTime() {
    return beserveTime;
  }

  public void setBeserveTime(java.sql.Date beserveTime) {
    this.beserveTime = beserveTime;
  }

}
