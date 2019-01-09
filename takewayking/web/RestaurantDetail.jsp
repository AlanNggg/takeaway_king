<%-- 
    Document   : RestaurantDetail
    Created on : Jan 10, 2019, 6:23:06 AM
    Author     : user
--%>

<%@page import="takeaway.bean.Restaurant"%>
<%@page import="takeaway.bean.Menus"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    </head>
    <body>
        <%
            Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
            ArrayList<Menus> menus = (ArrayList<Menus>) request.getAttribute("menus");
        %>
        <jsp:include page="header.jsp"/>
        <
    </body>
</html>
