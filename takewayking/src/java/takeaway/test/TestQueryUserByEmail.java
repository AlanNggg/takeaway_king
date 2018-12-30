/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.test;

import takeaway.bean.User;
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
        
        String[] emails = {"xyz@gmail", "qwe@gmail"};
        for(String email: emails) {
            User user = userDb.queryUserByEmail(email);
            System.out.println("Email: " + user.getEmail());
            System.out.println("Name: " + user.getName());
            System.out.println("Password: " + user.getPassword() + "\n");
        }
    }
}
