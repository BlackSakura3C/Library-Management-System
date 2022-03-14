package com.book.domain;


public class Library {

  private long libId;
  private String branchName;
  private String branchLocation;


  public long getLibId() {
    return libId;
  }

  public void setLibId(long libId) {
    this.libId = libId;
  }


  public String getBranchName() {
    return branchName;
  }

  public void setBranchName(String branchName) {
    this.branchName = branchName;
  }


  public String getBranchLocation() {
    return branchLocation;
  }

  public void setBranchLocation(String branchLocation) {
    this.branchLocation = branchLocation;
  }

}
