package com.entity;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String phoneno;
    private String role; 
    private String rollno;
    
    public User() {
        super();
    }

    public User(int id, String name, String email, String password, String phoneno, String role, String rollno) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneno = phoneno;
        this.role = role;
        this.rollno = rollno;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", phoneno=" + phoneno + ", role=" + role + rollno +"]";
    }
}
