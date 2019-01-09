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
import takeaway.bean.Menus;

/**
 *
 * @author user
 */
public class MenuDB {

    private String dbUrl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public MenuDB(String dbUrl, String dbUser, String dbPassword) {
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

    public ArrayList<Menus> queryMenu() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Menus menu = null;
        ArrayList<Menus> result = new ArrayList<Menus>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM MENUS";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                menu = new Menus();
                menu.setId(rs.getString(1));
                menu.setRestaurant_id(rs.getString(2));
                menu.setMenu(rs.getString(3));
                menu.setDatetime(rs.getString(4));
                menu.setRate(rs.getString(5));
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
    
    public Menus queryOneMenuByRestaurantId(String reid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Menus menu = null;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM MENUS WHERE RESTAURANT_ID=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, reid);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                menu = new Menus();
                menu.setId(rs.getString(1));
                menu.setRestaurant_id(rs.getString(2));
                menu.setMenu(rs.getString(3));
                menu.setDatetime(rs.getString(4));
                menu.setRate(rs.getString(5));
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
        return menu;
    }

    public ArrayList<Menus> queryMenuByRestaurantId(String reid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Menus menu = null;
        ArrayList<Menus> result = new ArrayList<Menus>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM MENUS WHERE RESTAURANT_ID=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, reid);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                menu = new Menus();
                menu.setId(rs.getString(1));
                menu.setRestaurant_id(rs.getString(2));
                menu.setMenu(rs.getString(3));
                menu.setDatetime(rs.getString(4));
                menu.setRate(rs.getString(5));
                result.add(menu);
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
        return result;
    }
}
