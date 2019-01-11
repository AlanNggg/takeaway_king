<%-- 
    Document   : Info
    Created on : Jan 11, 2019, 2:39:37 AM
    Author     : user
--%>

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
                height: 100%;
            }
            #header {
                font-family: "Open Sans", Arial, Helvetica, sans-serif !important;
            }
            .w3-card-4 {
                font-size: 25px !important;
            }
            form {
                margin: 0px;
                font-size: 20px !important;
                height: 90%;
                width: 100%;
                display: table;
            }
            input {
                height: 45px !important;
            }
            input[type="submit"], input[type="reset"] {
                float: right;
                font-size: 16px;
                height: 50px !important;
                margin: 0px 5px;
            }
        </style>
    </head>

    <body>
        <jsp:useBean id="user" class="takeaway.bean.User" scope="session"/>
        <jsp:include page="header.jsp"/>
        <jsp:include page="menu.jsp"/>
        <div style="margin: 150px 0px;"></div>
        <div class="w3-white w3-text-grey w3-card-4" style="display: flex; padding: 10px; margin: 0px 10px; height: 430px; width: 60%; margin: auto;">
            <div class="w3-container" style="padding: 20px; width: 50%; height: 100%;">
                <h2 style="color: black;"><i class="fa fa-user fa-fw w3-margin-right"></i>Personal Information</h2>
                <hr>
                <p><i class="fa fa-edit fa-fw w3-margin-right w3-text-teal"></i><%=user.getName()%></p>
                <p><i class="fa fa-edit fa-fw w3-margin-right w3-text-teal"></i><%=user.getEmail()%></p>
                <p><i class="fa fa-edit fa-fw w3-margin-right w3-text-teal"></i><%=user.getPassword()%></p>
            </div>
            <div class="w3-container" style="padding: 20px; width: 50%; height: 100%;">
                <h2 style="color: black;"><i class="fa fa-edit fa-fw w3-margin-right"></i>Edit Form</h2>
                <hr>
                <form method="post" action="UserInfoController">
                    Name: <input name="name" type="text"/>
                    <hr>
                    Password: <input name="password" type="password"/>
                    <input name="email" type="hidden" value="<%=user.getEmail()%>"/>
                    <br/>
                    <div>
                        <input type="submit"/>
                        <input type="reset"/>
                    </div>
                </form>
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
