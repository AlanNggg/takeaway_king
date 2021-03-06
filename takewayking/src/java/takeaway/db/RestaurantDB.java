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
import takeaway.bean.Restaurant;

/**
 *
 * @author user
 */
public class RestaurantDB {

    private String dbUrl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public RestaurantDB(String dbUrl, String dbUser, String dbPassword) {
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

    public int queryCountRow() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        int count = 0;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT COUNT(*) FROM RESTAURANT";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            rs.next();
            count = rs.getInt(1);
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return count;
    }

    public boolean updateVisitor(String count, String rid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnt = getConnection();
            String preQueryStatement = "";
            preQueryStatement = "UPDATE RESTAURANT SET VISITORS=? WHERE ID=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, count);
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

    public ArrayList<Restaurant> queryRestaurant() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public Restaurant queryRestaurantById(String rid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE ID=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, rid);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
                restaurant.setIcon(rs.getString(18));
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return restaurant;
    }

    public ArrayList<Restaurant> queryRestaurantByCategory(String category) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE CATEGORY=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, category);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByName(String name) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            name = "%" + name + "%";
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE NAME LIKE ? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByAddress(String address) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            address = "%" + address + "%";
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE ADDRESS LIKE ? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, address);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByKeyword(String keyword, String query) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            query = "%" + query + "%";
            keyword = keyword.toUpperCase();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE " + keyword + " LIKE ? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, query);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByArea(String area) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE AREA=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, area);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByDistrict(String district) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE DISTRICT=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, district);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantBySubdistrict(String subdistrict) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE SUBDISTRICT=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, subdistrict);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByAreaAndCategory(String area, String category) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE AREA=? AND CATEGORY=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, area);
            pStmnt.setString(2, category);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByDistrictAndCategory(String district, String category) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE DISTRICT=? AND CATEGORY=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, district);
            pStmnt.setString(2, category);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantBySubdistrictAndCategory(String subdistrict, String category) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE SUBDISTRICT=? AND CATEGORY=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, subdistrict);
            pStmnt.setString(2, category);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByAreaAndKeyword(String area, String keyword, String query) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            query = "%" + query + "%";
            keyword = keyword.toUpperCase();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE AREA=? AND " + keyword + " LIKE ? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, area);
            pStmnt.setString(2, query);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByDistrictAndKeyword(String district, String keyword, String query) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            query = "%" + query + "%";
            keyword = keyword.toUpperCase();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE DISTRICT=? AND " + keyword + " LIKE ? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, district);
            pStmnt.setString(2, query);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantBySubdistrictAndKeyword(String subdistrict, String keyword, String query) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            query = "%" + query + "%";
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE SUBDISTRICT=? AND " + keyword + " LIKE ? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, subdistrict);
            pStmnt.setString(2, query);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByAreaAndCategoryAndKeyword(String area, String category, String keyword, String query) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            query = "%" + query + "%";
            keyword = keyword.toUpperCase();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE AREA=? AND CATEGORY=? AND " + keyword + " LIKE ? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, area);
            pStmnt.setString(2, category);
            pStmnt.setString(3, query);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByDistrictAndCategoryAndKeyword(String district, String category, String keyword, String query) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            query = "%" + query + "%";
            keyword = keyword.toUpperCase();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE DISTRICT=? AND CATEGORY=? AND " + keyword + " LIKE ? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, district);
            pStmnt.setString(2, category);
            pStmnt.setString(3, query);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantBySubdistrictAndCategoryAndKeyword(String subdistrict, String category, String keyword, String query) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            query = "%" + query + "%";
            keyword = keyword.toUpperCase();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE SUBDISTRICT=? AND CATEGORY=? AND " + keyword + " LIKE ? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, subdistrict);
            pStmnt.setString(2, category);
            pStmnt.setString(3, query);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByCategoryAndKeyword(String category, String keyword, String query) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            query = "%" + query + "%";
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE CATEGORY=? AND " + keyword + " LIKE ? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, category);
            pStmnt.setString(2, query);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public Restaurant queryOneRestaurantByAreaAndRate(String area) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE AREA=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, area);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return restaurant;
    }

    public ArrayList<Restaurant> queryRestaurantByAreaAndRate(String area) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE AREA=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, area);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByDistrictAndRate(String district) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE DISTRICT=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, district);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantBySubdistrictAndRate(String district) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT WHERE SUBDISTRICT=? ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, district);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByVisitor() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT ORDER BY VISITOR DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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

    public ArrayList<Restaurant> queryRestaurantByRate() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Restaurant restaurant = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM RESTAURANT ORDER BY RATE DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                restaurant = new Restaurant();
                restaurant.setId(rs.getInt(1));
                restaurant.setName(rs.getString(2));
                restaurant.setCategory(rs.getString(3));
                restaurant.setTel(rs.getString(4));
                restaurant.setArea(rs.getString(5));
                restaurant.setDistrict(rs.getString(6));
                restaurant.setSubdistrict(rs.getString(7));
                restaurant.setAddress(rs.getString(8));
                restaurant.setMonday(rs.getString(9));
                restaurant.setTuesday(rs.getString(10));
                restaurant.setWednesday(rs.getString(11));
                restaurant.setThursday(rs.getString(12));
                restaurant.setFriday(rs.getString(13));
                restaurant.setSaturday(rs.getString(14));
                restaurant.setSunday(rs.getString(15));
                restaurant.setRate(rs.getInt(16));
                restaurant.setVisitors(rs.getInt(17));
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
