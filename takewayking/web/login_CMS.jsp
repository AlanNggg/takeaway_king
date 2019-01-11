
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CMS Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <%
                String username = (String)request.getSession().getAttribute("admin"); 
                String targetURL = null;
                if(username != null){
                    targetURL = "index_CMS.jsp";
                    RequestDispatcher rd;
                    rd = getServletContext().getRequestDispatcher("/" + targetURL);
                    rd.forward(request, response);
                }
        %>
      <div class="w3-container">
          

    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="margin-top: 100px;max-width:600px">
  
      <div class="w3-center"><br>
       CMS of TakeAway King
      </div>

      <form class="w3-container" method="post" action="login_CMS">
        <div class="w3-section">
          <label><b>Username</b></label>
          <input class="w3-input w3-border w3-margin-bottom" id="email" name="email" type="text" placeholder="Enter Username" name="usrname" required>
          <label><b>Password</b></label>
          <input class="w3-input w3-border" type="text" placeholder="Enter Password" name="pwd" required>
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Login</button>
          <input class="w3-check w3-margin-top" id="remember" name="remember" type="checkbox" > Remember me
        </div>
      </form>

    </div>

</div>
    </body>
</html>
