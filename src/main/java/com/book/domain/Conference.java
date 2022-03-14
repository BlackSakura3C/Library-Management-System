package com.book.domain;


public class Conference {

  private long documentId;
  private java.sql.Date conferencedate;
  private String conferencelocation;
  private String proceedingEditor;


  public long getDocumentId() {
    return documentId;
  }

  public void setDocumentId(long documentId) {
    this.documentId = documentId;
  }


  public java.sql.Date getConferencedate() {
    return conferencedate;
  }

  public void setConferencedate(java.sql.Date conferencedate) {
    this.conferencedate = conferencedate;
  }


  public String getConferencelocation() {
    return conferencelocation;
  }

  public void setConferencelocation(String conferencelocation) {
    this.conferencelocation = conferencelocation;
  }


  public String getProceedingEditor() {
    return proceedingEditor;
  }

  public void setProceedingEditor(String proceedingEditor) {
    this.proceedingEditor = proceedingEditor;
  }

}
