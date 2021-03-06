/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author delli
 */
public class Article {
    private long id;
    private String title;
    private Date articleDate;
    private String description;
    private String body;
    private long author;
    private Date creationDate;
    private long upVotes;
    private long downVotes;
    private char articleState;
    
    private String authorName;
    
    private ArrayList<Multimedia> articleMultimedia;

    public Article(long id, String title, Date articleDate, String description, String body, long author, Date creationDate, long upVotes, long downVotes, char articleState) {
        this.id = id;
        this.title = title;
        this.articleDate = articleDate;
        this.description = description;
        this.body = body;
        this.author = author;
        this.creationDate = creationDate;
        this.upVotes = upVotes;
        this.downVotes = downVotes;
        this.articleState = articleState;
    }

    public Article(String title, String description, String body, long author) {
        this.title = title;
        this.description = description;
        this.body = body;
        this.author = author;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public ArrayList<Multimedia> getArticleMultimedia() {
        return articleMultimedia;
    }

    public void setArticleMultimedia(ArrayList<Multimedia> articleMultimedia) {
        this.articleMultimedia = articleMultimedia;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getAuthor() {
        return author;
    }

    public void setAuthor(long author) {
        this.author = author;
    }

    public Date getArticleDate() {
        return articleDate;
    }

    public void setArticleDate(Date articleDate) {
        this.articleDate = articleDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public long getUpVotes() {
        return upVotes;
    }

    public void setUpVotes(long upVotes) {
        this.upVotes = upVotes;
    }

    public long getDownVotes() {
        return downVotes;
    }

    public void setDownVotes(long downVotes) {
        this.downVotes = downVotes;
    }

    public char getArticleState() {
        return articleState;
    }

    public void setArticleState(char articleState) {
        this.articleState = articleState;
    }
}
