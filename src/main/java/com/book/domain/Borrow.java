package com.book.domain;

import java.math.BigDecimal;

public class Borrow {

  private long readerId;
  private long indexId;

  private long documentId;
  private BigDecimal fine;
  private String title;
  private String branch;

  private java.sql.Date bDatetime;
  private java.sql.Date rDatetime;

  public long getIndexId() {
    return indexId;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getBranch() {
    return branch;
  }

  public void setBranch(String branch) {
    this.branch = branch;
  }

  public BigDecimal getFine() {
    return fine;
  }

  public void setFine(BigDecimal fine) {
    this.fine = fine;
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


  public long getIndexId(long indexId) {
    return indexId;
  }

  public void setIndexId(long indexId) {
    this.indexId = indexId;
  }


  public java.sql.Date getBDatetime() {
    return bDatetime;
  }

  public void setBDatetime(java.sql.Date bDatetime) {
    this.bDatetime = bDatetime;
  }


  public java.sql.Date getRDatetime() {
    return rDatetime;
  }

  public void setRDatetime(java.sql.Date rDatetime) {
    this.rDatetime = rDatetime;
  }

}
