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
import takeaway.bean.MenuCollections;

/**
 *
 * @author user
 */
public class MenuCollectionDB {

    private String dbUrl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public MenuCollectionDB(String dbUrl, String dbUser, String dbPassword) {
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

    public ArrayList<MenuCollections> queryMeCollectionByEmail(String email) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        MenuCollections menu = null;
        ArrayList<MenuCollections> result = new ArrayList<MenuCollections>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM MENU_COLLECTIONS WHERE USER_EMAIL=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            System.out.print(rs);
            while (rs.next()) {
                menu = new MenuCollections();
                menu.setUser_email(rs.getString(1));
                menu.setMenu_id(rs.getString(2));
                menu.setRestaurant_id(rs.getString(3));
                menu.setRate(rs.getString(4));
                result.add(menu);
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
    
    public ArrayList<MenuCollections> queryMeCollectionByEmailAndRid(String email, String rid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        MenuCollections menu = null;
        ArrayList<MenuCollections> result = new ArrayList<MenuCollections>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM MENU_COLLECTIONS WHERE USER_EMAIL=? AND RESTAURANT_ID=? ORDER BY MENU_ID";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, rid);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                menu = new MenuCollections();
                menu.setUser_email(rs.getString(1));
                menu.setMenu_id(rs.getString(2));
                menu.setRestaurant_id(rs.getString(3));
                menu.setRate(rs.getString(4));
                result.add(menu);
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

    public boolean addMeCollection(String email, String mid, String rid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnt = getConnection();
            String preQueryStatement = "INSERT INTO MENU_COLLECTIONS (USER_EMAIL, MENU_ID, RESTAURANT_ID) VALUE (?, ?, ?)";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, mid);
            pStmnt.setString(3, rid);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
            }
            pStmnt.close();
            cnnt.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }
    
        public boolean delMeCollection(String email, String mid, String rid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnt = getConnection();
            String preQueryStatement = "DELETE FROM MENU_COLLECTIONS WHERE USER_EMAIL=? AND MENU_ID=? AND RESTAURANT_ID=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, mid);
            pStmnt.setString(3, rid);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
            }
            pStmnt.close();
            cnnt.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }
}
