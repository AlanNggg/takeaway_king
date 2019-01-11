/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import takeaway.bean.Menus;
import takeaway.bean.Restaurant;
import takeaway.db.MenuDB;
import takeaway.db.RestaurantDB;

/**
 *
 * @author user
 */
@WebServlet(name = "RestaurantDetailController", urlPatterns = {"/restaurantDetail"})
public class RestaurantDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RestaurantDetailController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RestaurantDetailController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Restaurant restaurant = getRestaurantDetail(request, response);
        ArrayList<Menus> menus = getRestaurantMenus(request, response);
        request.setAttribute("restaurant", restaurant);
        request.setAttribute("menus", menus);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/RestaurantDetail.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private RestaurantDB redb;
    private MenuDB medb;
    
    public Restaurant getRestaurantDetail(HttpServletRequest request, HttpServletResponse response) {
        String rid = request.getParameter("rid");     
        return redb.queryRestaurantById(rid);
    }
    
    public ArrayList<Menus> getRestaurantMenus(HttpServletRequest request, HttpServletResponse response) {
        String rid = request.getParameter("rid");
        return medb.queryMenuByRestaurantId(rid);
    }
    
    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        redb = new RestaurantDB(dbUrl, dbUser, dbPassword);
        medb = new MenuDB(dbUrl, dbUser, dbPassword);
    }
}
