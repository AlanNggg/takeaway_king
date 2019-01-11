/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.servlet;



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import takeaway.bean.Administrator;
import takeaway.bean.User;
import takeaway.db.CMS;

@WebServlet(urlPatterns = {"/login_CMS"})
public class Login_CMS extends HttpServlet{
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
            
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        String cb = request.getParameter("remember");
        System.out.print("Input is " + email +" , "+ pwd + " , " + cb);
        
        CMS db = new CMS();
        String targetURL = null;
        boolean isValid =   db.isValidAdmin(email, pwd);
        
        if (isValid) {
              if(cb != null){
             Cookie ck=new Cookie("user",email);//deleting value of cookie  
                 ck.setMaxAge(60*60*2);//changing the maximum age to 0 seconds  
                response.addCookie(ck);//adding cookie in the response  
              }
            HttpSession session = request.getSession(true);
            Administrator user = db.getAdministrator(email, pwd);
            
            session.setAttribute("admin", user.getEmail());
                targetURL = "index_CMS.jsp";
        } else {
           
            targetURL = "login_CMS.jsp";
        }
        RequestDispatcher rd;
        rd = getServletContext().getRequestDispatcher("/" + targetURL);
        rd.forward(request, response);
        
      
               
        
        
    }
}
