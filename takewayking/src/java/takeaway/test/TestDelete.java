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
public class TestDelete {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/takeaway_king";
        String username = "root";
        String password = "";
        UserDB user = new UserDB(url, username, password);
        
        String[] emails = {"xyz@gmail", "qwe@gmail"};
        for(String email: emails) {
            boolean isSuccess = user.delUser(email);
            System.out.println(isSuccess);
        }
    }
}
