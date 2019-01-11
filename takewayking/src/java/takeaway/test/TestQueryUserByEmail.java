/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.test;

import java.util.ArrayList;
import takeaway.bean.MenuCollections;
import takeaway.bean.RestaurantCollections;
import takeaway.bean.User;
import takeaway.db.MenuCollectionDB;
import takeaway.db.RestaurantCollectionDB;
import takeaway.db.UserDB;

/**
 *
 * @author stit
 */
public class TestQueryUserByEmail {

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/takeaway_king";
        String username = "root";
        String password = "";
        UserDB userDb = new UserDB(url, username, password);
        
        RestaurantCollectionDB recDb = new RestaurantCollectionDB(url, username, password);
        RestaurantCollections rec = recDb.queryReCollectionByEmailAndRid("abc@gmail.com", "1");
        System.out.println(rec.getUser_email());
        System.out.println(rec.getRestaurant_id());
        MenuCollectionDB mecDb = new MenuCollectionDB(url, username, password);
        ArrayList<MenuCollections> mec = mecDb.queryMeCollectionByEmail("abc@gmail.com");
        for (int i = 0; i < mec.size(); i++) {
            System.out.println(mec.get(i).getUser_email());
            System.out.println(mec.get(i).getRestaurant_id());
            System.out.println(mec.get(i).getMenu_id() + "\n");
        }
//        String[] emails = {"xyz@gmail", "qwe@gmail"};
//        for(String email: emails) {
//            User user = userDb.queryUserByEmail(email);
//            System.out.println("Email: " + user.getEmail());
//            System.out.println("Name: " + user.getName());
//            System.out.println("Password: " + user.getPassword() + "\n");
//        }
    }
}
