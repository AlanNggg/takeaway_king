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
import takeaway.bean.RestaurantOwnerConnections;

/**
 *
 * @author 170542155
 */
public class RestaurantOwnerConnectionDB {

    private String dbUrl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public RestaurantOwnerConnectionDB(String dbUrl, String dbUser, String dbPassword) {
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
    
    public ArrayList<RestaurantOwnerConnections> queryROC(String email) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        RestaurantOwnerConnections restaurant = null;
        ArrayList<RestaurantOwnerConnections> result = new ArrayList<RestaurantOwnerConnections>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM restaurant_owner_connections WHERE EMAIL=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new RestaurantOwnerConnections();
                restaurant.setOnwer_email(rs.getString(1));
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
}
