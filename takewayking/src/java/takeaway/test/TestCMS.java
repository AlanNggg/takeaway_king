/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.test;

import java.util.ArrayList;
import takeaway.bean.Restaurant;
import takeaway.db.UserDB;
import takeaway.db.CMS;

/**
 *
 * @author TerryFungPC
 */
public class TestCMS {
     public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/takeaway_king";
        String username = "root";
        String password = "";
        CMS user = new CMS(url, username, password);
        ArrayList<Restaurant> rs = user.getRestList("New Territories", "Sha Tin", "Tai Wai");
        Restaurant rest = rs.get(0);
        System.out.print(rest.getName());
       
    }
}
