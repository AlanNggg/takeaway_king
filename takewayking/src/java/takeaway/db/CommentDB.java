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
import java.sql.Timestamp;
import java.util.ArrayList;
import takeaway.bean.Comment;

/**
 *
 * @author user
 */
public class CommentDB {
    private String dbUrl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public CommentDB(String dbUrl, String dbUser, String dbPassword) {
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
    
    public ArrayList<Comment> queryComment() {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Comment comment = null;
        ArrayList<Comment> result = new ArrayList<Comment>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM COMMENTS ORDER BY DATETIME DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            System.out.print(rs);
            while (rs.next()) {
                comment = new Comment();
                comment.setId(rs.getString(1));
                comment.setUser_email(rs.getString(2));
                comment.setRestaurant_id(rs.getString(3));
                comment.setComment(rs.getString(4));
                comment.setDatetime(rs.getString(5));
                result.add(comment);
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
    
    public ArrayList<Comment> queryCommentByRestauratId(String rid) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        Comment comment = null;
        ArrayList<Comment> result = new ArrayList<Comment>();
        try {
            cnnt = getConnection();
            String preQueryStatement = "SELECT * FROM COMMENTS WHERE RESTAURANT_ID=? ORDER BY DATETIME DESC";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, rid);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            System.out.print(rs);
            while (rs.next()) {
                comment = new Comment();
                comment.setId(rs.getString(1));
                comment.setUser_email(rs.getString(2));
                comment.setRestaurant_id(rs.getString(3));
                comment.setComment(rs.getString(4));
                comment.setDatetime(rs.getString(5));
                result.add(comment);
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
    
    public boolean addComment(String email, String rid, String comment) {
        Connection cnnt = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        Timestamp date = new Timestamp(System.currentTimeMillis());
        try {
            cnnt = getConnection();
            String preQueryStatement = "INSERT INTO COMMENTS (USER_EMAIL, RESTAURANT_ID, COMMENT, DATETIME) VALUE (?, ?, ?, ?)";
            pStmnt = cnnt.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, rid);
            pStmnt.setString(3, comment);
            pStmnt.setTimestamp(4, date);
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
}
