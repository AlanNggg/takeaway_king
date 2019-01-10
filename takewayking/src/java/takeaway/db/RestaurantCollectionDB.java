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
import takeaway.bean.RestaurantCollections;

/**
 *
 * @author user
 */
public class RestaurantCollectionDB {

    private String dbUrl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public RestaurantCollectionDB(String dbUrl, String dbUser, String dbPassword) {
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

    public ArrayList<RestaurantCollections> queryReCollectionByEmail(String email) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        RestaurantCollections restaurant = null;
        ArrayList<RestaurantCollections> result = new ArrayList<RestaurantCollections>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT_COLLECTIONS WHERE USER_EMAIL=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            System.out.print(rs);
            while (rs.next()) {
                restaurant = new RestaurantCollections();
                restaurant.setUser_email(rs.getString(1));
                restaurant.setRestaurant_id(rs.getString(2));
                result.add(restaurant);
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

    public boolean addReCollection(String email, String rid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnt = getConnection();
            String preQueryStatement = "INSERT INTO RESTAURANT_COLLECTIONS VALUE (?, ?)";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, rid);
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
