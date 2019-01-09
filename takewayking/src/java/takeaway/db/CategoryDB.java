/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import takeaway.bean.Category;

/**
 *
 * @author user
 */
public class CategoryDB {
    private String dbUrl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public CategoryDB(String dbUrl, String dbUser, String dbPassword) {
        this.dbUrl = dbUrl;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
    }
    
    public Connection getConnection() throws SQLException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        } catch (ClassNotFoundException e) {
           e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<Category> queryCategory() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Category category = null;
        ArrayList<Category> result = new ArrayList<Category>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT_CATEGORY";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            System.out.print(rs);
            while (rs.next()) {
                category = new Category();
                category.setCategory(rs.getString(1));
                result.add(category);
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return result;
    }
}
