<%-- 
    Document   : index
    Created on : Jan 6, 2019, 10:34:20 PM
    Author     : user
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="takeaway.db.LocationDB"%>
<%@page import="takeaway.bean.Location"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Takeaway King</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css">
            html, body {
                margin: 0px;
                padding: 0px;
            }
            nav, form {
                height: 70px;
            }
            #district, #subdistrict {
                text-align: center;
                display: none;
            }
            #search {
                padding: 0px 16px;
            }
            #area, #district, #subdistrict {
                background-color: black;
            }
            #search {
                background-color: grey;
            }
            ul {
                margin: 0px;
                font-size: 25px;
                list-style-type: none;
                padding: 0px;
                color: white;
            }
            ul li {
                float: left;
                padding: 20px 30px 20px 30px;
            }
            #district ul {
                font-size: 23px;
            }
            #district ul li {
                padding: 15px 30px 15px 30px;
            }
            #subdistrict ul {
                font-size: 20px;
            }
            #subdistrict ul li {
                padding: 10px 30px 10px 30px;
            }
            #searchForm {
                display: flex;
                align-items: center;
            }
            #container {
                position: relative;
                padding: 2px 6px;
                background-color: white;
                width: 40%;
                float: left;
            }
            #container input {
                font-size: 16px;
                font-weight: 400;
                line-height: 24px;
                border: none;
                outline: none;
                display: flex;
                width: 100%;
            }
            #submitBtn {
                padding: 1px 6px;
                font-size: 20px;
                padding: 4px 0px;
                font-weight: 400;
                width: 100px;
                border: none;
                outline: none;
            }
            a {
                text-decoration: none;
                color: white;
            }
        </style>
        <script>
            function getDistrict(DOM) {
                let districtList = document.getElementById("districtList");
                let districts = districtList.getElementsByTagName("a");
                document.getElementById("district").style.display = "block";
                document.getElementById("subdistrict").style.display = "none";
                for (var i = 0; i < districts.length; i++) {
                    if (districts[i].getAttribute("class") == DOM.textContent) {
                        districts[i].style.display = "block";
                    } else {
                        districts[i].style.display = "none";
                    }
                }
            }
            function getSubdistrict(DOM) {
                let subdistrictList = document.getElementById("subdistrictList");
                let subdistricts = subdistrictList.getElementsByTagName("a");
                document.getElementById("subdistrict").style.display = "block";
                for (var i = 0; i < subdistricts.length; i++) {
                    if (subdistricts[i].getAttribute("class") == DOM.textContent) {
                        subdistricts[i].style.display = "block";
                    } else {
                        subdistricts[i].style.display = "none";
                    }
                }
            }
            function closeMenu() {
                document.getElementById("district").style.display = "none";
                document.getElementById("subdistrict").style.display = "none";
            }
        </script>
    </head>
    <body>
        <%!
            private ArrayList<Location> locations = null;

            private String getArea(String district) {
                String area = "";
                for (Location location : locations) {
                    if (location.getDistrict() == district) {
                        area = location.getArea();
                    }
                }
                return area;
            }

            private String getDistrict(String subdistrict) {
                String district = "";
                for (Location location : locations) {
                    if (location.getSubdistrict() == subdistrict) {
                        district = location.getDistrict();
                    }
                }
                return district;
            }
        %>
        <%
            String dbUser = this.getServletContext().getInitParameter("dbUser");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");
            LocationDB locationDb = new LocationDB(dbUrl, dbUser, dbPassword);
            locations = locationDb.queryLocation();
            ArrayList<String> areaList = new ArrayList<String>();
            ArrayList<String> districtList = new ArrayList<String>();
            ArrayList<String> subdistrictList = new ArrayList<String>();
            for (Location location : locations) {
                areaList.add(location.getArea());
                districtList.add(location.getDistrict());
                subdistrictList.add(location.getSubdistrict());
            }
            Set<String> areas = new HashSet<String>(areaList);
            Set<String> districts = new HashSet<String>(districtList);
            Set<String> subdistricts = new HashSet<String>(subdistrictList);
        %>
        <nav id="area">
            <ul id="areaList">
                <%
                    for (String area : areas) {%>
                <a href="" onmouseover="getDistrict(this)"><li><%=area%></li></a>
                    <%}
                    %>
            </ul>
        </nav>
        <nav id="district">
            <ul id="districtList">
                <%
                    for (String district : districts) {%>
                    <a href="" class="<%=getArea(district)%>" onmouseover="getSubdistrict(this)"><li><%=district%></li></a>
                    <%}
                    %>
            </ul>
        </nav>
        <nav id="subdistrict">
            <ul id="subdistrictList">
                <%
                    for (String subdistrict : subdistricts) {%>
                <a href="" class="<%=getDistrict(subdistrict)%>"><li><%=subdistrict%></li></a>
                    <%}
                    %>
            </ul>
        </nav>
        <nav id="search">
            <form id="searchForm">
                <div id="container">
                    <input type="text" name="search">   
                </div>
                <input id="submitBtn" type="submit" value="Submit">
            </form>
        </nav>
    </body>
</html>