package com.book.domain;


public class Book {

  private long documentId;
  private String authorName;
  private String isbn;


  public long getDocumentId() {
    return documentId;
  }

  public void setDocumentId(long documentId) {
    this.documentId = documentId;
  }


  public String getAuthorName() {
    return authorName;
  }

  public void setAuthorName(String authorName) {
    this.authorName = authorName;
  }


  public String getIsbn() {
    return isbn;
  }

  public void setIsbn(String isbn) {
    this.isbn = isbn;
  }

}
