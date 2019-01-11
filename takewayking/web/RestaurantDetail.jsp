<%-- 
    Document   : RestaurantDetail
    Created on : Jan 10, 2019, 6:23:06 AM
    Author     : user
--%>

<%@page import="takeaway.bean.MenuCollections"%>
<%@page import="takeaway.bean.RestaurantCollections"%>
<%@page import="takeaway.db.MenuCollectionDB"%>
<%@page import="takeaway.db.RestaurantCollectionDB"%>
<%@page import="takeaway.db.UserDB"%>
<%@page import="takeaway.bean.User"%>
<%@page import="takeaway.bean.User"%>
<%@page import="takeaway.bean.Comment"%>
<%@page import="takeaway.db.CommentDB"%>
<%@page import="takeaway.bean.Restaurant"%>
<%@page import="takeaway.bean.Menus"%>
<%@page import="java.util.ArrayList"%>
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
                overflow: hidden;
                background-color: #f1f1f1 !important;
            }
            #header {
                font-family: "Open Sans", Arial, Helvetica, sans-serif !important;
            }
            .menuarea, .commentarea {
                display: flex; 
                align-items: center;
                justify-content: center;
                background-color: rgba(200, 200, 200, 0.50);
                box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
            }
            .menuarea, .commentarea {
                padding: 20px 0px;
            }
            .slick-prev:before, .slick-next:before {
                color: black !important;
                font-size: 40px;
            }
            .slick-prev {
                left: -50px;
            }
            textarea:focus {
                overflow: auto;
                border: none;
                outline: none !important;
            }

            .right-container {
                border-radius: 5px;
                max-width: 40%;
                max-height: 700px;
                overflow-y: scroll;
                overflow-x:hidden;
            }
            .commentContent p {
                margin-bottom: 10px;
            }
            .fa-star {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%
            Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
            ArrayList<Menus> menus = (ArrayList<Menus>) request.getAttribute("menus");

            String dbUser = this.getServletContext().getInitParameter("dbUser");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");

            if (request.getAttribute("comments") == null) {
                CommentDB commentDb = new CommentDB(dbUrl, dbUser, dbPassword);
                ArrayList<Comment> comments = commentDb.queryCommentByRestauratId(String.valueOf(restaurant.getId()));
                request.setAttribute("comments", comments);
            }

            UserDB userDb = new UserDB(dbUrl, dbUser, dbPassword);
            ArrayList<User> users = new ArrayList<User>();
            ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
            for (Comment comment : comments) {
                User userWithComment = userDb.queryUserByEmail(comment.getUser_email());
                users.add(userWithComment);
            }
            request.setAttribute("users", users);
        %>
        <jsp:useBean id="user" class="takeaway.bean.User" scope="session"/>
        <jsp:include page="header.jsp"/>
        <jsp:include page="menu.jsp"/>
        <%
            RestaurantCollectionDB recDb = new RestaurantCollectionDB(dbUrl, dbUser, dbPassword);
            MenuCollectionDB mecDb = new MenuCollectionDB(dbUrl, dbUser, dbPassword);
            RestaurantCollections rec = recDb.queryReCollectionByEmailAndRid(user.getEmail(), String.valueOf(restaurant.getId()));
            String color = "";
            if (rec != null) {
                color = "rgb(255, 226, 0)";
            } else {
                color = "rgba(219, 195, 0, 0.7)";
            }
            request.setAttribute("recolor", color);
            ArrayList<MenuCollections> mec = mecDb.queryMeCollectionByEmailAndRid(user.getEmail(), String.valueOf(restaurant.getId()));
            ArrayList<String> addedMenuId = new ArrayList<String>();
            for (MenuCollections m : mec) {
                addedMenuId.add(m.getMenu_id());
            }
            ArrayList<String> colors = new ArrayList<String>();
            if (mec != null && mec.size() > 0) {
                for (int i = 0; i < menus.size(); i++) {
                    if (addedMenuId.contains(menus.get(i).getId())) {
                        colors.add("rgb(255, 226, 0)");
                    } else {
                        colors.add("rgba(219, 195, 0, 0.7)");
                    }
                }
            } else {
                for (int i = 0; i < menus.size(); i++) {
                    colors.add("rgba(219, 195, 0, 0.7)");
                }
            }
            request.setAttribute("mecolors", colors);
        %>
        <div class="detail" style="position: absolute; width: 100%;">
            <div id="modal01" class="w3-modal w3-black" onclick="this.style.display = 'none'">
                <span class="w3-button w3-large w3-black w3-display-topright" title="Close Modal Image"><i class="fa fa-remove"></i></span>
                <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
                    <img id="img01" class="w3-image">
                    <p id="caption" class="w3-opacity w3-large"></p>
                </div>
            </div>
            <div style="margin: 100px 0px;"></div>
            <div class="menuarea" style="display: flex; width: 60%; float: left; margin: 0px 15px;">
                <div class="allmenus" style="width: 85%;">
                    <c:forEach var="m" items="${menus}" varStatus="status">
                        <div id="menu" style="overflow: auto;">
                            <i id="${menus[status.index].id}" class="fas fa-star" onclick="addFavorite(this)" 
                               style="position: absolute; z-index: 4; color: ${mecolors[status.index]}; font-size: 40px; padding: 10px;"></i>
                            <img class='image_selected_style' onclick='onClick(this)' src='data:image/png;base64, ${menus[status.index].menu}' style="max-width:100%; max-height:100%; margin: auto;"/>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="right-container">
                <div class="w3-white w3-text-grey w3-card-4" style="display: flex; padding: 10px; margin: 0px 10px;">
                    <div class="w3-container">
                        <h2 style="color: black;">
                            <i id="restaurantId" class="fas fa-star" onclick="addFavorite(this)" style="float: left; color: ${recolor}; font-size: 35px; padding-right: 20px;"></i>
                            <%=restaurant.getName()%>
                        </h2>
                        <p><i class="fa fa-coffee fa-fw w3-margin-right w3-large w3-text-teal"></i><%=restaurant.getCategory()%></p>
                        <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><%=restaurant.getAddress()%></p>
                        <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><%=restaurant.getTel()%></p>
                    </div>
                </div>

                <div class="w3-white w3-text-grey w3-card-4" style="display: flex; padding: 10px 25px; margin: 20px 10px 0 10px; position: sticky; top: 0px;">
                    <% if (user.getEmail() == null) {%>       
                    <div style="display: flex; align-items: center; background-color: rgba(255, 255, 255, 0.7); padding: 20px; text-align: center; position:absolute;top:0;left:0;width:100%;height:100%;">
                        <p style="margin: auto; font-size: 25px; color: black;">Please Login Before Comment! <a href="login.jsp">login</a></p>
                    </div>
                    <% } %>
                    <form id="commentForm" method="post" action="comment" style="width: 100%; margin: 0px;">
                        <h2 style="color: black;">Comment</h2>
                        <hr/>
                        <div style="display: flex;">
                            <div style="color: white; display: flex; justify-content: center; align-items: center; border-radius: 100%; background-color: #198ae3; width: 80px; height: 80px; margin: 10px; font-size: 30px">
                                <% if (user.getEmail() != null) {%>  
                                <%=user.getName().substring(0, 1)%>
                                <% }%>
                            </div>
                            <textarea id="inputarea" name="comment" form="commentForm" style="border-radius: 4px; margin: 10px; width: 80%;"></textarea>
                            <input name="email" type="hidden" value="<%=user.getEmail()%>"/>
                            <input name="rid" type="hidden" value="<%=restaurant.getId()%>"/>
                            <input name="rname" type="hidden" value="<%=restaurant.getName()%>"/>
                        </div>
                        <input type="submit" style="float: right; margin: 10px;">
                    </form>
                </div>

                <div class="w3-white w3-text-grey w3-card-4" style="padding: 10px 25px; margin: 0px 10px;">
                    <c:forEach var="c" items="${comments}" varStatus="status">
                        <div style="overflow: auto; display: flex;">
                            <div style="color: white; display: flex; justify-content: center; align-items: center; border-radius: 100%; background-color: grey; width: 50px; height: 50px; margin: 10px; font-size: 30px">
                                <c:set var="uname" value="${users[status.index].name}"/>
                                ${fn:substring(uname, 0, 1)}
                            </div>

                            <div class="commentContent" style="padding: 10px; width: 100%; font-size: 20px;">
                                <p style="float: left; text-decoration: underline;">${users[status.index].name}</p>
                                <p style="float: right;">
                                    <c:set var="time" value="${comments[status.index].datetime}"/>
                                    ${fn:substring(time, 0, 19)}
                                </p><br/>
                                <p style="clear: both;">${comments[status.index].comment}</p>
                            </div>
                        </div>
                        <hr>
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
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script type="text/javascript">
                                function addFavorite(element) {
                                    var action, servlet, restaurantId, type;
                                    var id = element.id;
                                    var color = element.style.color;
                                    var email = "<%=user.getEmail()%>";
                                    if (email != null) {
                                        if (id == "restaurantId") {
                                            servlet = "restaurantcollection";
                                            restaurantId = "<%=restaurant.getId()%>";
                                            type = "restaurant";
                                        } else {
                                            servlet = "menucollection"
                                            restaurantId = "<%=restaurant.getId()%>";
                                            type = "menu";
                                        }
                                        if (color == "rgba(219, 195, 0, 0.7)") {
                                            action = "add";
                                        } else {
                                            action = "del";
                                        }
                                        var xhttp = new XMLHttpRequest();
                                        xhttp.onreadystatechange = function () {
                                            if (this.readyState === 4 && this.status === 200) {
                                                console.log(this.responseText);
                                                if (this.responseText == "true" && color == "rgba(219, 195, 0, 0.7)") {
                                                    element.style.color = "rgb(255, 226, 0)";
                                                } else {
                                                    element.style.color = "rgba(219, 195, 0, 0.7)";
                                                }
                                            }
                                        };
                                        console.log(servlet + "&action=" + action + "&email=" + email + "&rid=" + restaurantId + "&mid=" + id);
                                        xhttp.open("POST", servlet, true);
                                        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        if (type == "restaurant") {
                                            xhttp.send("action=" + action + "&email=" + email + "&rid=" + restaurantId);
                                        } else {
                                            xhttp.send("action=" + action + "&email=" + email + "&rid=" + restaurantId + "&mid=" + id);
                                        }
                                    }
                                }

                                function onClick(element) {
                                    document.getElementById("img01").src = element.src;
                                    document.getElementById("modal01").style.display = "block";
                                    var captionText = document.getElementById("caption");
                                    captionText.innerHTML = element.alt;
                                }

                                $(document).ready(function () {
                                    $('.allmenus').slick({
                                        dots: true,
                                        infinite: true,
                                        speed: 500,
                                        fade: true
                                    });
                                });


        </script>
    </body>
</html>
