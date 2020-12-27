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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.User;

/**
 *
 * @author delli
 */
public class UserDAO {
    
    public static int RegisterUser(User user){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call RegisterUser(?,?,?,?,?)");
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getFirstName());
            statement.setString(3, user.getLastName());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getPassword());
            return statement.executeUpdate();
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
        return 0;
    }
    
    public static int EditUser(User user){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call EditUser(?,?,?,?,?)");
            statement.setLong(1, user.getId());
            statement.setString(2, user.getFirstName());
            statement.setString(3, user.getLastName());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getDescription());
            return statement.executeUpdate();
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
        return 0;
    }
    
    public static int SetUserProfilePic(long userID, String filename){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call SetUserProfilePic(?,?)");
            statement.setLong(1, userID);
            statement.setString(2, filename);
            
            return statement.executeUpdate();
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
        return 0;
    }
    
    public static int SetUserType(long userID, char type){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call SetUserType(?,?)");
            statement.setLong(1, userID);
            statement.setString(2, Character.toString(type));
            
            return statement.executeUpdate();
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
        return 0;
    }
    
    public static int SuspendUser(long adminID, long userID, String description){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call SuspendAccount(?,?,?)");
            statement.setLong(1, adminID);
            statement.setLong(2, userID);
            statement.setString(3, description);
            
            return statement.executeUpdate();
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
        return 0;
    }
    
    public static String GetUserFullName(long userId){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetUserFullName(?)");
            statement.setLong(1, userId);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                String name = result.getString(1);
                return name;
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
        return null;
    }
    
    public static User LogIn(String username, String password){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call LogIn(?,?)");
            statement.setString(1, username);
            statement.setString(2, password);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long id = result.getLong(1);
                String userName = result.getString(2);
                String firstName = result.getString(3);
                String lastName = result.getString(4);
                char userType = result.getString(5).charAt(0);
                char accountState = result.getString(6).charAt(0);
                
                return new User(id, userName, firstName, lastName, userType, accountState);
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
        return null;
    }
    
    public static User GetUserByID(long id){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call GetUser(?)");
            statement.setLong(1, id);
            
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                long userId = result.getLong(1);
                String userName = result.getString(2);
                String firstName = result.getString(3);
                String lastName = result.getString(4);
                String description = result.getString(5);
                String profilePic = result.getString(6);
                String email = result.getString(7);
                int level = result.getInt(8);
                char userType = result.getString(9).charAt(0);
                char accountState = result.getString(10).charAt(0);
                Date registrationDate = result.getDate(11);
                Date lastConnection = result.getDate(12);
                
                return new User(userId, userName, email, firstName, lastName, description, profilePic, level, userType, accountState, registrationDate, lastConnection);
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
        return null;
    }
}
