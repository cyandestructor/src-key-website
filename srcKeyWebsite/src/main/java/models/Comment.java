/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.ArrayList;

/**
 *
 * @author delli
 */
public class Comment {
    private long id;
    private String commentText;
    private long upVotes;
    private long downVotes;
    private long parentID;
    
    private long userId;
    private String posterUsername;
    private String posterImg;
    
    private Comment parentComment;
    private ArrayList<Comment> childrenComments;

    public Comment(long id, String commentText, long upVotes, long downVotes, long userId, String posterUsername, long parent) {
        this.id = id;
        this.commentText = commentText;
        this.upVotes = upVotes;
        this.downVotes = downVotes;
        this.userId = userId;
        this.posterUsername = posterUsername;
        this.parentID = parent;
    }

    public Comment(String commentText) {
        this.commentText = commentText;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Comment getParentComment() {
        return parentComment;
    }

    public void setParentComment(Comment parentComment) {
        this.parentComment = parentComment;
    }

    public ArrayList<Comment> getChildrenComments() {
        return childrenComments;
    }

    public void setChildrenComments(ArrayList<Comment> childrenComments) {
        this.childrenComments = childrenComments;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getPosterImg() {
        return posterImg;
    }

    public void setPosterImg(String posterImg) {
        this.posterImg = posterImg;
    }

    public String getPosterUsername() {
        return posterUsername;
    }

    public void setPosterUsername(String posterUsername) {
        this.posterUsername = posterUsername;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
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

    public long getParentID() {
        return parentID;
    }

    public void setParentID(long parentID) {
        this.parentID = parentID;
    }
}
