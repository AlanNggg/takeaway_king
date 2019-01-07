<%-- 
    Document   : main
    Created on : Jan 7, 2019, 4:07:02 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Takeaway King</title>
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
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
        
        <jsp:include page="header.jsp"/>
        <jsp:include page="menu.jsp"/>
        <jsp:include page="content.jsp"/>
        <jsp:include page="footer.jsp"/>        

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
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
    </body>
</html>
