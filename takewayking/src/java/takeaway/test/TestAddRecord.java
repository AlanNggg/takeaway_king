/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.test;

import takeaway.db.UserDB;



/**
 *
 * @author stit
 */
public class TestAddRecord {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/takeaway_king";
        String username = "root";
        String password = "";
        UserDB user = new UserDB(url, username, password);
        
        System.out.println(user.addUser("xyz@gmail", "Peter", "123"));
        System.out.println(user.addUser("qwe@gmail", "Terry", "123"));
    }

}
