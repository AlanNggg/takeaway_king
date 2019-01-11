/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import takeaway.db.CMS;
import takeaway.db.UserDB;

/**
 *
 * @author 170420115
 */
@WebServlet(name = "CMSController", urlPatterns = {"/add_user_CMS"})
public class add_user_CMS extends HttpServlet {
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
            String email = request.getParameter("add_user_email");
            String pwd = request.getParameter("add_user_pwd");
            String name = request.getParameter("add_user_name");
            
            UserDB db = new CMS();
            db.addUser(email, name, pwd);
            response.getWriter().print("<h1>Success!</h1>");
     }

    
}
