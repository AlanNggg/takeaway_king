<%-- 
    Document   : Favourite
    Created on : Jan 10, 2019, 10:09:29 PM
    Author     : user
--%>

<%@page import="takeaway.bean.Menus"%>
<%@page import="takeaway.db.MenuDB"%>
<%@page import="takeaway.db.RestaurantDB"%>
<%@page import="takeaway.bean.Restaurant"%>
<%@page import="takeaway.db.MenuCollectionDB"%>
<%@page import="takeaway.bean.MenuCollections"%>
<%@page import="takeaway.db.RestaurantCollectionDB"%>
<%@page import="takeaway.bean.RestaurantCollections"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="/WEB-INF/tlds/tk-taglib" prefix="tk"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <link href="http://kenwheeler.github.io/slick/slick/slick.css" rel="stylesheet"/>
        <link href="http://kenwheeler.github.io/slick/slick/slick-theme.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            html, body {
                overflow: auto;
                background-color: #f1f1f1 !important;
            }
            #header {
                font-family: "Open Sans", Arial, Helvetica, sans-serif !important;
            }
            .contentbox {  
                width: 255px;
                height: 175px;
                margin: 10px;
                float: left;
                overflow: hidden;
                text-align: left;
                border-radius: 15px;
                text-align: center;
            }
            .boxTitle {
                font-weight: bold;
                color: white;
                font-size: 20px;
                background-color: rgb(255, 153, 0);
            }
            .contentbox img {
                width: 100%;
                height: auto;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="user" class="takeaway.bean.User" scope="session"/>
        <jsp:include page="header.jsp"/>
        <jsp:include page="menu.jsp"/>
        <%
            String dbUser = this.getServletContext().getInitParameter("dbUser");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");

            RestaurantCollectionDB rcDb = new RestaurantCollectionDB(dbUrl, dbUser, dbPassword);
            MenuCollectionDB mcDb = new MenuCollectionDB(dbUrl, dbUser, dbPassword);
            RestaurantDB restaurantDb = new RestaurantDB(dbUrl, dbUser, dbPassword);
            MenuDB menuDb = new MenuDB(dbUrl, dbUser, dbPassword);

            ArrayList<RestaurantCollections> rec = rcDb.queryReCollectionByEmail(user.getEmail());
            ArrayList<MenuCollections> mec = mcDb.queryMeCollectionByEmail(user.getEmail());

            ArrayList<Restaurant> restaurants = restaurantDb.queryRestaurant();
            ArrayList<Restaurant> addedRestaurants = new ArrayList<Restaurant>();

            ArrayList<Menus> menus = menuDb.queryMenu();
            ArrayList<Menus> addedMenus = new ArrayList<Menus>();
            ArrayList<Menus> reMenuList = new ArrayList<Menus>();
            ArrayList<Restaurant> reList = new ArrayList<Restaurant>();

            for (Restaurant r : restaurants) {
                for (RestaurantCollections rc : rec) {
                    if (rc.getRestaurant_id().equals(String.valueOf(r.getId()))) {
                        addedRestaurants.add(r);
                    }
                }
            }
            for (Menus m : menus) {
                for (MenuCollections mc : mec) {
                    if (mc.getRestaurant_id().equals(m.getRestaurant_id()) && mc.getMenu_id().equals(m.getId())) {
                        addedMenus.add(m);
                    }
                }
            }

            for (Restaurant restaurant : addedRestaurants) {
                Menus menu = menuDb.queryOneMenuByRestaurantId(String.valueOf(restaurant.getId()));
                reMenuList.add(menu);
            }

            for (Restaurant r : restaurants) {
                for (Menus am : addedMenus) {
                    if (am.getRestaurant_id().equals(String.valueOf(r.getId()))) {
                        reList.add(r);
                    }
                }
            }

            request.setAttribute("reList", reList);
            request.setAttribute("reMenuList", reMenuList);
            request.setAttribute("rec", addedRestaurants);
            request.setAttribute("mec", addedMenus);
        %>
        <div style="margin: 100px 0px;"></div>
        <div class="frestaurant">
            <div class="w3-white w3-text-grey w3-card-4" style="display: flex; padding: 10px; margin: 0px 10px;">
                <div class="w3-container">
                    <h2 style="color: black;"><i class="fa fa-utensils fa-fw w3-margin-right"></i>Favorite Restaurants</h2>
                    <c:forEach var="r" items="${rec}" varStatus="status">
                        <tk:box rid="${rec[status.index].id}" name="${rec[status.index].name}" category="${rec[status.index].category}" 
                                address="${rec[status.index].address}" tel="${rec[status.index].tel}">
                            <img class='image_selected_style' src='data:image/png;base64, ${reMenuList[status.index].menu}'/>
                        </tk:box>
                    </c:forEach>
                </div>
            </div>
        </div>
        <hr>
        <div class="fmenu">
            <div class="w3-white w3-text-grey w3-card-4" style="display: flex; padding: 10px; margin: 0px 10px;">
                <div class="w3-container">
                    <h2 style="color: black;"><i class="fa fa-utensils fa-fw w3-margin-right"></i>Favorite Menus</h2>
                    <c:forEach var="r" items="${mec}" varStatus="status">
                        <tk:box rid="${reList[status.index].id}" name="${reList[status.index].name}" category="${reList[status.index].category}" 
                                address="${reList[status.index].address}" tel="${reList[status.index].tel}">
                            <img class='image_selected_style' src='data:image/png;base64, ${mec[status.index].menu}'/>
                        </tk:box>
                    </c:forEach>
                </div>
            </div>
        </div>




        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
