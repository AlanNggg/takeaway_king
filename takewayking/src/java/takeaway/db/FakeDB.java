/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import takeaway.bean.Restaurant;

/**
 *
 * @author TerryFungPC
 */
public class FakeDB extends CMS {
            public FakeDB(){
                super("jdbc:mysql://localhost:3306/takeaway_king", "root", "");
           }

           public FakeDB(String dbUrl, String dbUser, String dbPassword) {
               super(dbUrl, dbUser, dbPassword);
           }
           public boolean saveAdminToDB(String email,String name,String pwd){
            int flag = 0;
            Connection cnnt = null;
           Statement stmnt = null;
          try {
              cnnt = getConnection();
            stmnt = cnnt.createStatement();
              String sql = "INSERT INTO administrator VALUES ( '"+email+"' , '" + name+"' , '" + pwd+"' )";
              flag = stmnt.executeUpdate(sql);

          } catch (SQLException ex) {
              while (ex != null) {
                  ex.printStackTrace();
                  ex = ex.getNextException();
              }
          } catch (IOException ex) {
              ex.printStackTrace();
          }

           if(flag == 1){
                return true;
            }else{
                return false;
            }
     }
               public boolean saveUserToDB(String email,String name,String pwd){
            int flag = 0;
            Connection cnnt = null;
           Statement stmnt = null;
          try {
              cnnt = getConnection();
            stmnt = cnnt.createStatement();
              String sql = "INSERT INTO user VALUES ( '"+email+"' , '" + name+"' , '" + pwd+"' )";
              flag = stmnt.executeUpdate(sql);

          } catch (SQLException ex) {
              while (ex != null) {
                  ex.printStackTrace();
                  ex = ex.getNextException();
              }
          } catch (IOException ex) {
              ex.printStackTrace();
          }

           if(flag == 1){
                return true;
            }else{
                return false;
            }
          }
                  public boolean saveOwnerToDB(String email,String name,String pwd){
            int flag = 0;
            Connection cnnt = null;
           Statement stmnt = null;
          try {
              cnnt = getConnection();
            stmnt = cnnt.createStatement();
              String sql = "INSERT INTO restaurant_owner VALUES ( '"+email+"' , '" + name+"' , '" + pwd+"' )";
              flag = stmnt.executeUpdate(sql);

          } catch (SQLException ex) {
              while (ex != null) {
                  ex.printStackTrace();
                  ex = ex.getNextException();
              }
          } catch (IOException ex) {
              ex.printStackTrace();
          }

           if(flag == 1){
                return true;
            }else{
                return false;
            }
          }
               public boolean saveRestaurantToDB(Restaurant rest){
            int flag = 0;
            Connection cnnt = null;
          Statement stmnt = null;
          try {
              cnnt = getConnection();
              stmnt = cnnt.createStatement();
              String sql = "INSERT INTO restaurant(name,category,tel,area,district,subdistrict,address) VALUES ('"+rest.getName() + "','"
                                                            +rest.getCategory()+"','"
                                                            + rest.getTel() +"','"
                                                            +rest.getArea()+"','"
                                                            +rest.getDistrict()+"','"
                                                            +rest.getSubdistrict()+"','"
                                                            +rest.getAddress()+"')";
//              stmnt = cnnt.prepareStatement(sql);
//              stmnt.setString(1, rest.getName());
//              stmnt.setString(2, rest.getCategory());
//              stmnt.setString(3, rest.getTel());
//              stmnt.setString(4, rest.getArea());
//              stmnt.setString(5, rest.getDistrict());
//              stmnt.setString(6, rest.getSubdistrict());
//              stmnt.setString(7, rest.getAddress());
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

           if(flag == 1){
                return true;
            }else{
                return false;
            }
     }
}
