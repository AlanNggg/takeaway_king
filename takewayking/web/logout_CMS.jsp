<%-- 
    Document   : logout_CMS
    Created on : 2019年1月11日, 下午01:07:49
    Author     : 170420115
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
                request.getSession().setAttribute("admin", null); 
                String targetURL = "login_CMS.jsp";
                    RequestDispatcher rd;
                    rd = getServletContext().getRequestDispatcher("/" + targetURL);
                    rd.forward(request, response);

      %>
    </body>
</html>
