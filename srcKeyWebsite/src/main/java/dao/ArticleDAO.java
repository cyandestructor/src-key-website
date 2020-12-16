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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Article;

/**
 *
 * @author delli
 */
public class ArticleDAO {
    
    public static int SubmitArticle(Article article){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("{ ? = call SubmitArticle(?,?,?,?) }");
            statement.registerOutParameter(1, java.sql.Types.INTEGER);
            statement.setString(2, article.getTitle());
            statement.setString(3, article.getDescription());
            statement.setString(4, article.getBody());
            statement.setLong(5, article.getAuthor());
            
            statement.executeUpdate();
            
            int articleID = statement.getInt(1);
            if(articleID != -1){
                return articleID;
            }else{
                return -1;
            }
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return -1;
    }
    
    public static int SetArticleCategory(long articleID, long categoryID){
        
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call SetArticleCategory(?,?)");
            statement.setLong(1, articleID);
            statement.setLong(2, categoryID);
            
            return statement.executeUpdate();
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
        
    }
    
    public static int SetArticleMultimedia(long articleID, String filepath, char fileType){
        
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call SetArticleMultimedia(?,?,?)");
            statement.setLong(1, articleID);
            statement.setString(2, filepath);
            statement.setString(3, Character.toString(fileType));
            
            return statement.executeUpdate();
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
        
    }
    
    public static ArrayList<Article> GetArticles(char state){
        ArrayList<Article> articles = new ArrayList<Article>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetArticles(?)");
            statement.setString(1, Character.toString(state));
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                String title = result.getString(2);
                Date aDate = result.getDate(3);
                String desc = result.getString(4);
                String body = result.getString(5);
                long author = result.getLong(6);
                Date creationDate = result.getDate(7);
                long upVotes = result.getLong(8);
                long downVotes = result.getLong(9);
                char aState = result.getString(10).charAt(0);
                
                Article article = new Article(id, title, aDate, desc, body, author, creationDate, upVotes, downVotes, aState);
                articles.add(article);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return articles;
    }
    
    public static ArrayList<Article> SearchArticles(String query){
        
        ArrayList<Article> articles = new ArrayList<Article>();
        
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call SearchArticles(?)");
            statement.setString(1, query);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                String title = result.getString(2);
                Date aDate = result.getDate(3);
                String desc = result.getString(4);
                String body = result.getString(5);
                long author = result.getLong(6);
                Date creationDate = result.getDate(7);
                long upVotes = result.getLong(8);
                long downVotes = result.getLong(9);
                char aState = result.getString(10).charAt(0);
                
                Article article = new Article(id, title, aDate, desc, body, author, creationDate, upVotes, downVotes, aState);
                articles.add(article);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return articles;
    }
    
    public static int MarkArticle(long articleID, long userID){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call AddMarkedArticle(?,?)");
            statement.setLong(1, userID);
            statement.setLong(2, articleID);
            
            return statement.executeUpdate();
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
    
    public static ArrayList<Article> GetMarkedArticles(long userID){
        ArrayList<Article> articles = new ArrayList<Article>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetMarkedArticles(?)");
            statement.setLong(1, userID);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                String title = result.getString(2);
                Date aDate = result.getDate(3);
                String desc = result.getString(4);
                String body = result.getString(5);
                long author = result.getLong(6);
                Date creationDate = result.getDate(7);
                long upVotes = result.getLong(8);
                long downVotes = result.getLong(9);
                char aState = result.getString(10).charAt(0);
                
                Article article = new Article(id, title, aDate, desc, body, author, creationDate, upVotes, downVotes, aState);
                articles.add(article);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return articles;
    }
    
    public static Article GetArticleByID(long articleID){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetArticleByID(?)");
            statement.setLong(1, articleID);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                String title = result.getString(2);
                Date aDate = result.getDate(3);
                String desc = result.getString(4);
                String body = result.getString(5);
                long author = result.getLong(6);
                Date creationDate = result.getDate(7);
                long upVotes = result.getLong(8);
                long downVotes = result.getLong(9);
                char aState = result.getString(10).charAt(0);
                
                return new Article(id, title, aDate, desc, body, author, creationDate, upVotes, downVotes, aState);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return null;
    }
    
    public static ArrayList<Article> GetUserArticles(long userId, char state){
        ArrayList<Article> articles = new ArrayList<Article>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetArticlesByUser(?,?)");
            statement.setLong(1, userId);
            statement.setString(2, Character.toString(state));
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                String title = result.getString(2);
                Date aDate = result.getDate(3);
                String desc = result.getString(4);
                String body = result.getString(5);
                long author = result.getLong(6);
                Date creationDate = result.getDate(7);
                long upVotes = result.getLong(8);
                long downVotes = result.getLong(9);
                char aState = result.getString(10).charAt(0);
                
                Article article = new Article(id, title, aDate, desc, body, author, creationDate, upVotes, downVotes, aState);
                articles.add(article);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return articles;
    }
    
    public static ArrayList<Article> GetUserArticles(long userId){
        ArrayList<Article> articles = new ArrayList<Article>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetArticlesByUser(?)");
            statement.setLong(1, userId);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                String title = result.getString(2);
                Date aDate = result.getDate(3);
                String desc = result.getString(4);
                String body = result.getString(5);
                long author = result.getLong(6);
                Date creationDate = result.getDate(7);
                long upVotes = result.getLong(8);
                long downVotes = result.getLong(9);
                char aState = result.getString(10).charAt(0);
                
                Article article = new Article(id, title, aDate, desc, body, author, creationDate, upVotes, downVotes, aState);
                articles.add(article);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return articles;
    }
    
    public static ArrayList<Article> GetTopArticles(){
        ArrayList<Article> articles = new ArrayList<Article>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetTopArticles()");
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                String title = result.getString(2);
                Date aDate = result.getDate(3);
                String desc = result.getString(4);
                String body = result.getString(5);
                long author = result.getLong(6);
                Date creationDate = result.getDate(7);
                long upVotes = result.getLong(8);
                long downVotes = result.getLong(9);
                char aState = result.getString(10).charAt(0);
                
                Article article = new Article(id, title, aDate, desc, body, author, creationDate, upVotes, downVotes, aState);
                articles.add(article);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return articles;
    }
    
    public static ArrayList<Article> GetRecentArticles(){
        ArrayList<Article> articles = new ArrayList<Article>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetRecentArticles()");
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                String title = result.getString(2);
                Date aDate = result.getDate(3);
                String desc = result.getString(4);
                String body = result.getString(5);
                long author = result.getLong(6);
                Date creationDate = result.getDate(7);
                long upVotes = result.getLong(8);
                long downVotes = result.getLong(9);
                char aState = result.getString(10).charAt(0);
                
                Article article = new Article(id, title, aDate, desc, body, author, creationDate, upVotes, downVotes, aState);
                
                articles.add(article);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return articles;
    }
    
    public static int SetArticleState(long articleID, char state){
        
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call SetArticleState(?,?)");
            statement.setLong(1, articleID);
            statement.setString(2, Character.toString(state));
            
            return statement.executeUpdate();
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
        
    }
}
