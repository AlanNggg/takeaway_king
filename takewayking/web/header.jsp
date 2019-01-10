<%-- 
    Document   : header
    Created on : Jan 7, 2019, 3:59:50 PM
    Author     : user
--%>


<style>
    #menubar {
        display: flex;
        justify-content: flex-end;
        align-items: center; 
        height: inherit;
        width: 100%;
    }
    .menu {
        font-size: 25px; 
        margin: 0px 15px; 
        height: 2.5em; 
        width: 2.5em;                      
        text-align: center; 
        line-height: 2.5em; 
        border-radius: 100%;               
        background-color: rgba(255, 255, 255, 0.5); 
        transition: background-color 0.2s ease-out !important;
    }
    .menu:hover {
        border: 1px solid rgba(255, 255, 255, 0.5)  !important;
        background-color: rgba(255, 255, 255, 0)  !important;
    }
    #username {
        display: table-cell;
        vertical-align: text-top;
        padding-right: 10px;
        margin: 0px;
        color: white;
        font-size: 30px;
    }
    .usermenu {
        background: #f64242;
        position: absolute;
        right: 0px;
    }
</style>
<jsp:useBean id="user" class="takeaway.bean.User" scope="session"/>
<header id="header" style="top: 0px; height: 80px; background-color: rgba(255, 140, 63, 0.9);">
    <div class="logo" style="line-height: 70px;">
        <a href="main.jsp" style="font-size: 25px;">
            <image src="./images/logo.png" alt="TakeawayKing" height="80" style="float: left;"/>
            Takeaway King
        </a>
    </div>
    <div id="menubar">
        <% if (user.getName() != null) {%>
        <p id="username"><sup>Hello, <jsp:getProperty name="user" property="name"/></sup></p>
        <% }%>
        <% if (user.getEmail() != null) {%>
        <a class="menu" href="#menu">
            <i class="fas fa-user" style="color: white;"></i>
        </a>
        <% }%>
        <a class="menu" href="login.jsp">
            <i class="fas fa-sign-in-alt" style="color: white;"></i>
        </a>
    </div>
    <form method="post" action="login">
        <input type="hidden" name="action" value="logout"/>
    </form>
</header>
