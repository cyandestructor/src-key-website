/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Category;

/**
 *
 * @author delli
 */
public class CategoryDAO {
    
    public static int RegisterCategory(Category category){
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("{ ? = call RegisterCategory(?) }");
            statement.registerOutParameter(1, java.sql.Types.INTEGER);
            statement.setString(2, category.getCategoryName());
            
            statement.executeUpdate();
            
            return statement.getInt(1);
        } catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
    
}
