package com.book.web;

import java.sql.Date;

public class PaperAddCommand {
    private String paperId;
    private String paperTitle;
    private String paperAuthor;
    private String paperDate;
    private String paperConferenceOrJournalname;
    private String paperIssue;
    private String paperVolume;
    private String paperPage;
    private String paperDoi;

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public String getPaperTitle() {
        return paperTitle;
    }

    public void setPaperTitle(String paperTitle) {
        this.paperTitle = paperTitle;
    }

    public String getPaperAuthor() {
        return paperAuthor;
    }

    public void setPaperAuthor(String paperAuthor) {
        this.paperAuthor = paperAuthor;
    }

    public String getPaperDate() {
        return paperDate;
    }

    public void setPaperDate(String paperDate) {
        this.paperDate = paperDate;
    }

    public String getPaperConferenceOrJournalname() {
        return paperConferenceOrJournalname;
    }

    public void setPaperConferenceOrJournalname(String paperConferenceOrJournalname) {
        this.paperConferenceOrJournalname = paperConferenceOrJournalname;
    }

    public String getPaperIssue() {
        return paperIssue;
    }

    public void setPaperIssue(String paperIssue) {
        this.paperIssue = paperIssue;
    }

    public String getPaperVolume() {
        return paperVolume;
    }

    public void setPaperVolume(String paperVolume) {
        this.paperVolume = paperVolume;
    }

    public String getPaperPage() {
        return paperPage;
    }

    public void setPaperPage(String paperPage) {
        this.paperPage = paperPage;
    }

    public String getPaperDoi() {
        return paperDoi;
    }

    public void setPaperDoi(String paperDoi) {
        this.paperDoi = paperDoi;
    }
}
