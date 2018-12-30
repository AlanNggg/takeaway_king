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
public class TestEditRecord {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/takeaway_king";
        String username = "root";
        String password = "";
        UserDB userDb = new UserDB(url, username, password);

        
        User user = userDb.queryUserByEmail("abc@gmail.com");
        user.setName("Terry");
        userDb.editUser(user);
    }
}
