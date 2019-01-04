<%-- 
    Document   : welcome
    Created on : Nov 28, 2018, 4:19:41 PM
    Author     : stit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="user" class="takeaway.bean.User" scope="session"/>
        <b> Hello,    <jsp:getProperty name="user" property="name"/></b>
        <p>Welcome to the ICT</p>
        <form method="post" action="login">
            <input type="hidden" name="action"
                   value="logout"/>
            <input type="submit" value="Logout"
                   name="logoutButton"/>
        </form>
        <hr/>
        <a href="brandController?action=list">getAllBrands</a><br/>
    </body>
</html>
