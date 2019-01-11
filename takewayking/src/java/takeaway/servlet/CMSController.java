
package takeaway.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import takeaway.bean.Menus;
import takeaway.bean.Restaurant;
import takeaway.bean.User;
import takeaway.db.CMS;


@WebServlet(name = "CMSController", urlPatterns = {"/cmsController"})
public class CMSController extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action.equals("getDistrict")) {
           String areas = request.getParameter("areas");
           ArrayList<String>list =db.getAllDist(areas);
            JsonObjectBuilder jb = Json.createObjectBuilder();
            JsonArrayBuilder array = Json.createArrayBuilder();
         
           for(int i = 0 ; i< list.size();i++ ){
               array.add(list.get(i));
           }
           jb.add("dist",array);
           JsonObject json = jb.build();
           
            response.setContentType("application/json");
            response.getWriter().print(json.toString());
           
        }else if(action.equals("getSubDistrict")){
                String areas = request.getParameter("areas");
                String dist = request.getParameter("dist");
              
              ArrayList<String>list =db.getAllSubDist(areas, dist);
               JsonObjectBuilder jb = Json.createObjectBuilder();
               JsonArrayBuilder array = Json.createArrayBuilder();

              for(int i = 0 ; i< list.size();i++ ){
                  array.add(list.get(i));
              }
              jb.add("subdist",array);
              JsonObject json = jb.build();

               response.setContentType("application/json");
               response.getWriter().print(json.toString());
               
        }else if(action.equals("getRestList")){
            String areas = request.getParameter("areas");
            String dist = request.getParameter("dist");
            String subdist = request.getParameter("subdist");
             ArrayList<Restaurant>list =db.getRestList(areas, dist, subdist);
            JsonArrayBuilder array = Json.createArrayBuilder();
             for(int i = 0 ; i< list.size();i++ ){
                 Restaurant rest = list.get(i);
                 array.add(
                         Json.createObjectBuilder()
                                .add("id",rest.getId())
                                .add("name", rest.getName())
                                .add("category",rest.getCategory())
                                .add("address",rest.getAddress())
                                .add("rate",rest.getRate())
                                .add("visitor", rest.getVisitors())
                        );
              }
             JsonArray json = array.build();
             System.out.println(json.toString());
            response.setContentType("application/json");
            response.getWriter().print(json.toString());
            
        }else if(action.equals("uploadMenu")){
                String id = request.getParameter("id");
                String menus = request.getParameter("menus");
          
               boolean flag = db.saveMenuToDB(id, menus.trim());
                            
                      
                 
                if(!flag){
                        System.out.print("Insert fail ");
                        return;
                }
                  response.getWriter().print("Scuess!");
                  
        }else if(action.equals("getMenuByRid")){
                String id = request.getParameter("rid");
                ArrayList<Menus>menu =db.getMenus(id);

              JsonObjectBuilder jb = Json.createObjectBuilder();
            JsonArrayBuilder array = Json.createArrayBuilder();
            jb.add("rest_id",menu.get(0).getRestaurant_id());
           for(int i = 0 ; i< menu.size();i++ ){
               array.add(
                       Json.createObjectBuilder()
                                .add("id",menu.get(i).getId())
                                .add("menu", menu.get(i).getMenu())
                                .add("datetime", menu.get(i).getDatetime())
                                 .add("rate", menu.get(i).getRate())
                             );
           }
           jb.add("menus",array);
           JsonObject json = jb.build();
           System.out.println(json.toString());
            response.setContentType("application/json");
            response.getWriter().print(json.toString());
        }
              
//                ArrayList<Menus>list =db.getMenus("1");
//            JsonArrayBuilder array = Json.createArrayBuilder();
//             for(int i = 0 ; i< list.size();i++ ){
//                 Menus rest = list.get(i);
//                 array.add(
//                         Json.createObjectBuilder()
//                                .add("id",rest.getId())
//                                .add("rsid", rest.getRestaurant_id())
//                                .add("menu",rest.getMenu())
//                                .add("date",rest.getDatetime())
//                                .add("rate",rest.getRate())
//                        );
//              }
//             JsonArray json = array.build();
//            response.setContentType("application/json");
//            response.getWriter().print(json.toString());
              
                
            
        }
    


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    private CMS db;
    
//    private void doAuthenticate(HttpServletRequest request, HttpServletResponse response) 
//            throws IOException, ServletException {
//        
//        String email = request.getQueryString();
//        System.out.print(email);
//        String password = request.getParameter("password");
//        
//        String targetURL;
//        
//        boolean isValid = db.isValidUser(email, password);
//        
//        if (isValid) {
//            HttpSession session = request.getSession(true);
//            User user = db.getUser(email, password);
//            
//            session.setAttribute("user", user);
//            targetURL = "welcome.jsp";
//        } else {
//            request.setAttribute("isValid", isValid);
//            request.setAttribute("url", db.getDbUrl());
//            request.setAttribute("user", db.getDbUser());
//            request.setAttribute("password", db.getDbPassword());
//            targetURL = "login.jsp";
//        }
//        RequestDispatcher rd;
//        rd = getServletContext().getRequestDispatcher("/" + targetURL);
//        rd.forward(request, response);
  //  }
    
    
    
    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new CMS(dbUrl, dbUser, dbPassword);
    }
}
