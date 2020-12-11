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
            
            statement.executeUpdate();
            
            int articleID = statement.getInt(1);
            if(articleID != -1){
                return articleID;
            }else{
                return 0;
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
        return 0;
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
    
    public static ArrayList<Article> GetArticles(boolean publishedOnly){
        ArrayList<Article> articles = new ArrayList<Article>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetArticles(?)");
            statement.setBoolean(1, publishedOnly);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                // TODO
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return articles;
    }
}
