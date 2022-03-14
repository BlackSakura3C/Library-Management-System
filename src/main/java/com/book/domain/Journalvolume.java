package com.book.domain;


public class Journalvolume {

  private long documentId;
  private String journalName;
  private String journalEditor;
  private String scope;
  private String volumeEditor;
  private String volumeName;


  public long getDocumentId() {
    return documentId;
  }

  public void setDocumentId(long documentId) {
    this.documentId = documentId;
  }


  public String getJournalName() {
    return journalName;
  }

  public void setJournalName(String journalName) {
    this.journalName = journalName;
  }


  public String getJournalEditor() {
    return journalEditor;
  }

  public void setJournalEditor(String journalEditor) {
    this.journalEditor = journalEditor;
  }


  public String getScope() {
    return scope;
  }

  public void setScope(String scope) {
    this.scope = scope;
  }


  public String getVolumeEditor() {
    return volumeEditor;
  }

  public void setVolumeEditor(String volumeEditor) {
    this.volumeEditor = volumeEditor;
  }


  public String getVolumeName() {
    return volumeName;
  }

  public void setVolumeName(String volumeName) {
    this.volumeName = volumeName;
  }

}
