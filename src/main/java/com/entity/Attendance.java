package com.entity;

public class Attendance {
    private int id;
    private String rollNo;
    private String subject;
    private String timing;
    private String status;
    private String scannedTime;
    private String date; // ✅ New field for date

    // Constructors
    public Attendance() {}

    public Attendance(String rollNo, String subject, String timing, String status, String scannedTime, String date) {
        this.rollNo = rollNo;
        this.subject = subject;
        this.timing = timing;
        this.status = status;
        this.scannedTime = scannedTime;
        this.date = date;
    }

    public Attendance(String rollNo, String subject, String timing, String status) {
        this.rollNo = rollNo;
        this.subject = subject;
        this.timing = timing;
        this.status = status;
    }

    public Attendance(String rollNo, String subject, String timing, String status, String scannedTime) {
        this.rollNo = rollNo;
        this.subject = subject;
        this.timing = timing;
        this.status = status;
        this.scannedTime = scannedTime;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getRollNo() {
        return rollNo;
    }
    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }

    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTiming() {
        return timing;
    }
    public void setTiming(String timing) {
        this.timing = timing;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public String getScannedTime() {
        return scannedTime;
    }
    public void setScannedTime(String scannedTime) {
        this.scannedTime = scannedTime;
    }

    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
}
