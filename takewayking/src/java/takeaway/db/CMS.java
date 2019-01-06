/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import takeaway.bean.Restaurant;
import takeaway.bean.User;
import takeaway.db.UserDB;

/**
 *
 * @author TerryFungPC
 */
public class CMS extends UserDB {
    
    public CMS(){
         super("jdbc:mysql://localhost:3306/takeaway_king", "root", "");
    }
    
    public CMS(String dbUrl, String dbUser, String dbPassword) {
        super(dbUrl, dbUser, dbPassword);
    }
    
    public ArrayList<String> getAllAreas(){
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

    public ArrayList<String> getAllDist(String area){
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
     public ArrayList<String> getAllSubDist(String area,String dist){
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
       public ArrayList<Restaurant> getRestList(String area,String dist,String subdist){
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
               Restaurant rest = new Restaurant();
               rest.setAddress(rs.getString(8));
               rest.setCategory(rs.getString(3));
               rest.setName(rs.getString(2));
               rest.setId(rs.getInt(1));
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
