package com.entity;

public class Feedback {
    private int id;
    private String parentName;
    private String studentName;
    private String description;
    private String reply;

    // Constructors
    public Feedback() {}

    public Feedback(String parentName, String studentName, String description, String reply) {
        this.parentName = parentName;
        this.studentName = studentName;
        this.description = description;
        this.reply = reply;
    }

    public Feedback(int id, String parentName, String studentName, String description, String reply) {
        this.id = id;
        this.parentName = parentName;
        this.studentName = studentName;
        this.description = description;
        this.reply = reply;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }
}
