/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Comment;

/**
 *
 * @author delli
 */
public class CommentDAO {
    
    public static int CreateComment(Comment comment, long articleID, long userID){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call CreateComment(?,?,?)");
            statement.setLong(1, articleID);
            statement.setLong(2, userID);
            statement.setString(3, comment.getCommentText());
            return statement.executeUpdate();
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
    
    public static int CreateComment(Comment comment, long articleID, long userID, long parent){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call CreateComment(?,?,?,?)");
            statement.setLong(1, articleID);
            statement.setLong(2, userID);
            statement.setString(3, comment.getCommentText());
            statement.setLong(4, parent);
            return statement.executeUpdate();
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
    
    public static int DeleteComment(long commentID){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call DeleteComment(?)");
            statement.setLong(1, commentID);
            
            return statement.executeUpdate();
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
    
    public static int VoteComment(long commentID, boolean upVote){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call VoteComment(?,?,?)");
            statement.setLong(1, commentID);
            statement.setBoolean(2, upVote);
            statement.setBoolean(3, !upVote);
            
            return statement.executeUpdate();
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
    
    static public ArrayList<Comment> GetArticleComments(long articleID){
        
        ArrayList<Comment> comments = new ArrayList<Comment>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetArticleComments(?)");
            statement.setLong(1, articleID);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long commentID = result.getLong(1);
                String commentBody = result.getString(2);
                long upVotes = result.getLong(3);
                long downVotes = result.getLong(4);
                long userID = result.getLong(5);
                String username = result.getString(6);
                long parentID = result.getLong(7);
                
                Comment comment = new Comment(commentID, commentBody, upVotes, downVotes, userID, username, parentID);
                
                comments.add(comment);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return comments;
    }
    
    public static ArrayList<Comment> GetChildrenComments(long parentID){
        
        ArrayList<Comment> comments = new ArrayList<Comment>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetChildrenComments(?)");
            statement.setLong(1, parentID);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long commentID = result.getLong(1);
                String commentBody = result.getString(2);
                long upVotes = result.getLong(3);
                long downVotes = result.getLong(4);
                long userID = result.getLong(5);
                String username = result.getString(6);
                
                Comment comment = new Comment(commentID, commentBody, upVotes, downVotes, userID, username, parentID);
                
                comments.add(comment);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return comments;
    }
    
    public static Comment GetComment(long commentID){
        
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetComment(?)");
            statement.setLong(1, commentID);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                String commentBody = result.getString(2);
                long upVotes = result.getLong(3);
                long downVotes = result.getLong(4);
                long userID = result.getLong(5);
                String username = result.getString(6);
                long parentID = result.getLong(7);
                
                return new Comment(commentID, commentBody, upVotes, downVotes, userID, username, parentID);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
}
