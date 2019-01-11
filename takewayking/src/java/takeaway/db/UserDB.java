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
import java.util.logging.Level;
import java.util.logging.Logger;
import takeaway.bean.User;

/**
 *
 * @author user
 */
public class UserDB {

    private String dbUrl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public UserDB(String dbUrl, String dbUser, String dbPassword) {
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

    public boolean isValidUser(String email, String pwd) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isValid = false;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM USER WHERE EMAIL=? and PASSWORD=?";
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

    public User getUser(String email, String pwd) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM USER WHERE EMAIL=? and PASSWORD=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, pwd);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                user = new User();
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
    
    public User getUserByEmail(String email) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM USER WHERE EMAIL=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                user = new User();
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

    public boolean addUser(String email, String name, String pwd) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnt = getConnection();
            String preQueryStatement = "INSERT INTO USER VALUE (?, ?, ?)";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, name);
            pStmnt.setString(3, pwd);
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

    public boolean editUser(User user) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnt = getConnection();
            String preQueryStatement = "";
            if (!user.getName().equals("") && !user.getPassword().equals("")) {
                preQueryStatement = "UPDATE USER SET NAME=?, PASSWORD=? WHERE EMAIL=?";
                pStmnt = cnnt.prepareStatement(preQueryStatement);
                pStmnt.setString(1, user.getName());
                pStmnt.setString(2, user.getPassword());
                pStmnt.setString(3, user.getEmail());
            } else if (!user.getName().equals("")) {
                preQueryStatement = "UPDATE USER SET NAME=? WHERE EMAIL=?";
                pStmnt = cnnt.prepareStatement(preQueryStatement);
                pStmnt.setString(1, user.getName());
                pStmnt.setString(2, user.getEmail());
            } else {
                preQueryStatement = "UPDATE USER SET PASSWORD=? WHERE EMAIL=?";
                pStmnt = cnnt.prepareStatement(preQueryStatement);
                pStmnt.setString(1, user.getPassword());
                pStmnt.setString(2, user.getEmail());
            }
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

    public ArrayList<User> queryUser() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<User> result = new ArrayList<User>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM USER";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setEmail(rs.getString(1));
                user.setName(rs.getString(2));
                user.setPassword(rs.getString(3));
                result.add(user);
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

    public User queryUserByEmail(String email) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM USER WHERE EMAIL=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                user = new User();
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

    public ArrayList<User> queryUserByName(String name) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        User user = null;
        ArrayList<User> result = new ArrayList<User>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM USER WHERE NAME=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setEmail(rs.getString(1));
                user.setName(rs.getString(2));
                user.setPassword(rs.getString(3));
                result.add(user);
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

    public boolean delUser(String email) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnt = getConnection();
            String preQueryStatement = "DELETE FROM USER WHERE EMAIL=?";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
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

    public String getDbUrl() {
        return dbUrl;
    }

    public String getDbUser() {
        return dbUser;
    }

    public String getDbPassword() {
        return dbPassword;
    }
}
