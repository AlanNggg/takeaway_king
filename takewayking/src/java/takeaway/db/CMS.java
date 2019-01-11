/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.db;

import java.sql.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import takeaway.bean.Administrator;
import takeaway.bean.Menus;
import takeaway.bean.Restaurant;
import takeaway.bean.RestaurantOwner;
import takeaway.bean.User;
import takeaway.bean.log;
import takeaway.db.UserDB;

/**
 *
 * @author TerryFungPC
 */
public class CMS extends UserDB {

    public CMS() {
        super("jdbc:mysql://localhost:3306/takeaway_king", "root", "");
    }

    public CMS(String dbUrl, String dbUser, String dbPassword) {
        super(dbUrl, dbUser, dbPassword);
    }

    public boolean isValidAdmin(String email, String pwd) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isValid = false;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM administrator WHERE EMAIL= ? and PASSWORD=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, pwd);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                isValid = true;
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
        return isValid;
    }

    public boolean isValidOwner(String email, String pwd) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isValid = false;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM restaurant_owner WHERE EMAIL= ? and PASSWORD=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, pwd);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                isValid = true;
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
        return isValid;
    }

    public Administrator getAdministrator(String email, String pwd) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Administrator user = null;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM Administrator WHERE EMAIL=? and PASSWORD=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, pwd);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                user = new Administrator();
                user.setEmail(rs.getString(1));
                user.setName(rs.getString(2));
                user.setPassword(rs.getString(3));
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
        return user;
    }

    public RestaurantOwner getRestaurantOwner(String email, String pwd) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        RestaurantOwner user = null;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM restaurant_owner WHERE EMAIL=? and PASSWORD=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, pwd);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                user = new RestaurantOwner();
                user.setEmail(rs.getString(1));
                user.setName(rs.getString(2));
                user.setPassword(rs.getString(3));
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
        return user;
    }

    public ArrayList<String> getAllAreas() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<String> result = new ArrayList<String>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM areas";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            System.out.print(rs);
            while (rs.next()) {
                result.add(rs.getString(1));
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

    public ArrayList<String> getAllDist(String area) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<String> result = new ArrayList<String>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT DISTINCT district FROM location where area = ?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, area);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                result.add(rs.getString(1));
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

    public ArrayList<String> getAllRestaurantID() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<String> result = new ArrayList<String>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT id FROM restaurant";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                result.add(rs.getString(1));
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
    
    public ArrayList<String> getAllDist() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<String> result = new ArrayList<String>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT DISTINCT district FROM location";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                result.add(rs.getString(1));
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

    public ArrayList<String> getAllSubDist() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<String> result = new ArrayList<String>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT DISTINCT subdistrict FROM location";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                result.add(rs.getString(1));
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

    public ArrayList<String> getAllSubDist(String area, String dist) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<String> result = new ArrayList<String>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT DISTINCT subdistrict FROM location where area = ? AND district = ?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, area);
            pStmnt.setString(2, dist);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                result.add(rs.getString(1));
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

    public ArrayList<Restaurant> getRestListById(String id) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM restaurant where id = ?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);

            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                Restaurant restaurant = new Restaurant();
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

    public ArrayList<Restaurant> getRestList(String area, String dist, String subdist) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<Restaurant> result = new ArrayList<Restaurant>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM restaurant where area = ? AND district = ? AND subdistrict = ?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, area);
            pStmnt.setString(2, dist);
            pStmnt.setString(3, subdist);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                Restaurant restaurant = new Restaurant();
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

    public boolean saveRestToDB(Restaurant rest) {
        int flag = 0;
        Connection cnnt = null;
        Statement stmnt = null;
        Restaurant re = rest;
        try {
            cnnt = getConnection();
            stmnt = cnnt.createStatement();
            String sql = "UPDATE restaurant SET "
                    + "name = '" + re.getName() + "',"
                    + "category = '" + re.getCategory() + "'."
                    + "tel = '" + re.getTel() + "',"
                    + "area = '" + re.getArea() + "',"
                    + "district = '" + re.getDistrict() + "',"
                    + "subdistrict = '" + re.getSubdistrict() + "',"
                    + "address = '" + re.getAddress() + "'"
                    + "WHERE id = " + re.getId();
            flag = stmnt.executeUpdate(sql);
            stmnt.close();
            cnnt.close();

        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        if (flag == 1) {
            return true;
        } else {
            return false;
        }
    }

    public boolean saveMenuToDB(String id, String menuList) {
        int flag = 0;
        Connection cnnt = null;
        Statement stmnt = null;
        try {
            cnnt = getConnection();
            stmnt = cnnt.createStatement();
            String sql = "INSERT INTO menus (restaurant_id,menu) VALUES ( " + id + " , '" + menuList + "' )";
            flag = stmnt.executeUpdate(sql);
            stmnt.close();
            cnnt.close();

        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        if (flag == 1) {
            return true;
        } else {
            return false;
        }
    }

    public boolean saveLogToDB(String res, String nonRest, String own, String date) {
        int flag = 0;
        Connection cnnt = null;
        Statement stmnt = null;
        try {
            cnnt = getConnection();
            stmnt = cnnt.createStatement();
            String sql = "INSERT INTO log VALUES ( '" + date + "' , '" + res + "' , '" + nonRest + "', '" + own + "' )";
            flag = stmnt.executeUpdate(sql);
            stmnt.close();
            cnnt.close();

        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        if (flag == 1) {
            return true;
        } else {
            return false;
        }
    }

    public ArrayList<log> getLog() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        log menu = null;
        ArrayList<log> result = new ArrayList<log>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM log";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                menu = new log();
                menu.setDate(rs.getString(1));
                menu.setRegister(rs.getString(2));
                menu.setNonRegister(rs.getString(3));
                menu.setOwner(rs.getString(4));
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
        System.out.println(result.size());
        return result;
    }

    public ArrayList<Menus> getMenusByRid(String rid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Menus menu = null;
        ArrayList<Menus> result = new ArrayList<>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM menus WHERE restaurant_id = ? ";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, rid);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                menu = new Menus();
                menu.setId(rs.getString("id"));
                menu.setRestaurant_id(rs.getString("restaurant_id"));
                menu.setMenu(rs.getString("menu"));
                menu.setDatetime(rs.getString("datetime"));
                menu.setRate(rs.getString("rate"));
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

    public ArrayList<Menus> getMenus(String rid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Menus m = null;
        ArrayList<Menus> result = new ArrayList<Menus>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM menus where restaurant_id= ?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, rid);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                m = new Menus();
                m.setId(rs.getString("id"));
                m.setMenu(rs.getString("menu"));
                m.setRestaurant_id(rs.getString("restaurant_id"));
                m.setDatetime(rs.getString("datetime"));
                m.setRate(rs.getString("rate"));
                result.add(m);
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

    public ArrayList<String> getCategory() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Menus m = null;
        ArrayList<String> result = new ArrayList<String>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM restaurant_category";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                result.add(rs.getString(1));
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

    public ArrayList<RestaurantOwner> getRestOwnerByRid(String rid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<RestaurantOwner> result = new ArrayList<RestaurantOwner>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM restaurant_owner_connections,restaurant_owner WHERE restaurant_owner_connections.owner_email = restaurant_owner.email and restaurant_owner_connections.restaurant_id = ?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, rid);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                RestaurantOwner rest = new RestaurantOwner();
                rest.setEmail(rs.getString("email"));
                rest.setName(rs.getString("name"));
                rest.setPassword(rs.getString("password"));
                result.add(rest);

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
