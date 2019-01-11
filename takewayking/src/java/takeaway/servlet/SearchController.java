/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.json.JsonObject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import takeaway.bean.Restaurant;
import takeaway.db.RestaurantDB;

/**
 *
 * @author user
 */
@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

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
            out.println("<title>Servlet SearchController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchController at " + request.getContextPath() + "</h1>");
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
        ArrayList<Restaurant> restaurantList = getRestaurantList(request, response);
        request.setAttribute("restaurants", restaurantList);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/Detail.jsp");
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
        processRequest(request, response);
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

    private RestaurantDB db;

    public ArrayList<Restaurant> getRestaurantList(HttpServletRequest request, HttpServletResponse response) {
        String area = request.getParameter("area");
        String district = request.getParameter("district");
        String subdistrict = request.getParameter("subdistrict");
        String category = request.getParameter("category");
        String keyword = request.getParameter("keyword");
        String query = request.getParameter("query");

        if (area != null && !area.equals("0")) {
            request.setAttribute("area", area);
        }
        if (district != null && !district.equals("0")) {
            request.setAttribute("district", district);
        }
        if (subdistrict != null && !subdistrict.equals("0")) {
            request.setAttribute("subdistrict", subdistrict);
        }
        if (category != null && !category.equals("0")) {
            request.setAttribute("category", category);
        }
        if (keyword != null && !keyword.equals("keyword")) {
            request.setAttribute("keyword", keyword);
        }

        ArrayList<Restaurant> restaurants = new ArrayList<>();

        if (subdistrict != null && !subdistrict.equals("0")) {
            if (category != null && !category.equals("0")) {
                if (keyword != null && !keyword.equals("0") && query != null && query.length() > 0) {
                    restaurants = db.queryRestaurantBySubdistrictAndCategoryAndKeyword(subdistrict, category, keyword, query);
                } else {
                    //     Search Subdistrict And Category
                    restaurants = db.queryRestaurantBySubdistrictAndCategory(subdistrict, category);
                }
            } else {
                if (keyword != null && !keyword.equals("0") && query != null && !query.trim().equals("")) {
                    restaurants = db.queryRestaurantBySubdistrictAndKeyword(subdistrict, keyword, query);
                } else {
                    //    Search Subdistrict Only
                    restaurants = db.queryRestaurantBySubdistrict(subdistrict);
                }
            }
        } else if (district != null && !district.equals("0")) {
            if (category != null && !category.equals("0")) {
                if (keyword != null && !keyword.equals("0") && query != null && !query.trim().equals("")) {
                    restaurants = db.queryRestaurantByDistrictAndCategoryAndKeyword(district, category, keyword, query);
                } else {
                    //     Search District And Category
                    restaurants = db.queryRestaurantByDistrictAndCategory(district, category);
                }
            } else {
                if (keyword != null && !keyword.equals("0") && query != null && !query.trim().equals("")) {
                    //     Search District And Keyword Name
                    restaurants = db.queryRestaurantByDistrictAndKeyword(district, keyword, query);
                } else {
                    //    Search District Only
                    restaurants = db.queryRestaurantByDistrict(district);
                }
            }
        } else if (area != null && !area.equals("0")) {
            if (category != null && !category.equals("0")) {
                if (keyword != null && !keyword.equals("0") && query != null && !query.trim().equals("")) {
                    restaurants = db.queryRestaurantByAreaAndCategoryAndKeyword(area, category, keyword, query);
                } else {
                    //     Search Area And Category
                    restaurants = db.queryRestaurantByAreaAndCategory(area, category);
                }
            } else {
                if (keyword != null && !keyword.equals("0") && query != null && !query.trim().equals("")) {
                    //     Search Area And Keyword Name
                    restaurants = db.queryRestaurantByAreaAndKeyword(area, keyword, query);
                } else {
                    //    Search Area Only
                    restaurants = db.queryRestaurantByArea(area);
                }
            }
        } else if (category != null && !category.equals("0")) {
            if (keyword != null && !keyword.equals("0") && query != null && !query.trim().equals("")) {
                restaurants = db.queryRestaurantByCategoryAndKeyword(category, keyword, query);
            } else {
                //     Search Category
                restaurants = db.queryRestaurantByCategory(category);
            }
        } else if (keyword != null && !keyword.equals("0") && query != null && !query.trim().equals("")) {
            restaurants = db.queryRestaurantByKeyword(keyword, query);
        } else {
            //     Search All
            restaurants = db.queryRestaurant();
        }

        return restaurants;
    }

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new RestaurantDB(dbUrl, dbUser, dbPassword);
    }
}
