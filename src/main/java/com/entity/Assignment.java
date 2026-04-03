package com.entity;


import java.sql.Timestamp;

public class Assignment {
    private int id;
    private String title;
    private String note;
    private String fileName;
    private Timestamp uploadDate;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }

    public String getFileName() { return fileName; }
    public void setFileName(String fileName) { this.fileName = fileName; }

    public Timestamp getUploadDate() { return uploadDate; }
    public void setUploadDate(Timestamp uploadDate) { this.uploadDate = uploadDate; }
}
