/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.nio.file.Paths;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Multimedia;

/**
 *
 * @author delli
 */
public class MultimediaDAO {
    
    public static ArrayList<Multimedia> GetArticleMultimeda(long articleID){
        
        ArrayList<Multimedia> files = new ArrayList<Multimedia>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetArticleMutimedia(?)");
            statement.setLong(1, articleID);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                char fType = result.getString(2).charAt(0);
                String filepath = result.getString(3);
                String filename = Paths.get(filepath).getFileName().toString();
                Date uploadDate = result.getDate(4);
                
                Multimedia multimedia = new Multimedia(id, fType, filename, uploadDate);
                files.add(multimedia);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MultimediaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return files;
    }
    
    public static ArrayList<Multimedia> GetArticleMultimeda(long articleID, char fileType){
        
        ArrayList<Multimedia> files = new ArrayList<Multimedia>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetArticleMutimedia(?,?)");
            statement.setLong(1, articleID);
            statement.setString(2, Character.toString(fileType));
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                char fType = result.getString(2).charAt(0);
                String filepath = result.getString(3);
                String filename = Paths.get(filepath).getFileName().toString();
                Date uploadDate = result.getDate(4);
                
                Multimedia multimedia = new Multimedia(id, fType, filename, uploadDate);
                files.add(multimedia);
            }
            
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MultimediaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return files;
    }
    
    public static int DeleteMultimedia(long multimediaID){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call DeleteMultimedia(?)");
            statement.setLong(1, multimediaID);
            
            return statement.executeUpdate();
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MultimediaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
}
