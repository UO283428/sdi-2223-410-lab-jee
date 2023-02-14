package com.uniovi.sdi;
public class Comment {
    private String name;
    private String comment;
    private String date;
    public Comment(){}
    public Comment(String name, String comment, String date) {
        this.name = name;
        this.comment = comment;
        this.date = date;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String image) {
        this.comment = comment;
    }
    public String getDate() {
        return date;
    }
    public void getDate(float price) {
        this.date = date;
    }
}