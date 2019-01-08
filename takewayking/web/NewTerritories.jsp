<%-- 
    Document   : NewTerritories
    Created on : Jan 9, 2019, 3:21:22 AM
    Author     : user
--%>

<%@taglib uri="/WEB-INF/tlds/tk-taglib" prefix="tk"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="takeaway.db.LocationDB"%>
<%@page import="takeaway.bean.Location"%>
<%@page import="takeaway.bean.Restaurant"%>
<%@page import="takeaway.db.RestaurantDB"%>

<%!
    private ArrayList<Location> locations = null;

    private String[] getArea(String[] districts) {
        String[] areas = null;
        for (int i = 0; i < districts.length; i++) {
            for (Location location : locations) {
                if (location.getDistrict() == districts[i]) {
                    areas[i] = location.getArea();
                }
            }
        }
        return areas;
    }

    private String[] getDistrict(String[] subdistricts) {
        String[] districts = null;
        for (int i = 0; i < subdistricts.length; i++) {
            for (Location location : locations) {
                if (location.getSubdistrict() == subdistricts[i]) {
                    districts[i] = location.getDistrict();
                }
            }
        }
        return districts;    
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
    Set<String> areasSet = new HashSet<String>(areaList);
    Set<String> districtsSet = new HashSet<String>(districtList);
    Set<String> subdistrictsSet = new HashSet<String>(subdistrictList);
    String[] areas = areasSet.toArray(new String[areasSet.size()]);
    String[] districts = districtsSet.toArray(new String[districtsSet.size()]);
    String[] subdistricts = subdistrictsSet.toArray(new String[subdistrictsSet.size()]);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <style>
            .contentbox {  
                width: 225px;
                height: 145px;
                margin: 10px;
                float: left;
                overflow: hidden;
                text-align: left;
                border-radius: 15px;
            }
            .contentbox img {
                width: 100%;
                height: auto;
            }
            .area {
                position: relative;
                top: 100px;
            }
            .select-wrapper {
                margin: 0px 15px;
                text-overflow: ellipsis;
            }
            option {
                color: black;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <%
                    System.out.println(districts.length);
                %>
        <nav style="position: relative; top: 80px; background-color: rgba(90, 90, 90, 0.7);  padding: 0 1.5em; display: flex; align-items: center; height: 80px;">
            <form method="post" action="#" style="position: relative; display: flex; align-items: center; float: right; width: 100%; height: 100%; margin: 0px;">
                <tk:selector options="<%=areas%>" name="area"/>
                <tk:selector options="<%=districts%>" name="district" />
                <tk:selector options="<%=subdistricts%>" name="subdistrict"/>
                
                <!--                <div class="select-wrapper">
                                    <select name="area">
                                        <option value="">- Area -</option>
                                        <option value="1">Manufacturing</option>
                                        <option value="1">Shipping</option>
                                        <option value="1">Administration</option>
                                        <option value="1">Human Resources</option>
                                    </select>
                                </div>
                                <i class="fas fa-angle-right" style="font-size: 30px;"></i>
                                <div class="select-wrapper">
                                    <select name="district">
                                        <option value="">- District -</option>
                                        <option value="1" >Manufacturing</option>
                                        <option value="1">Shipping</option>
                                        <option value="1">Administration</option>
                                        <option value="1">Human Resources</option>
                                    </select>
                                </div>
                                <i class="fas fa-angle-right" style="font-size: 30px;"></i>
                                <div class="select-wrapper">
                                    <select name="subdistrict">
                                        <option value="">- Sub-district -</option>
                                        <option value="1">Manufacturing</option>
                                        <option value="1">Shipping</option>
                                        <option value="1">Administration</option>
                                        <option value="1">Human Resources</option>
                                    </select>
                                </div>
                                <div class="select-wrapper">
                                    <select name="category">
                                        <option value="">- Category -</option>
                                        <option value="1">Manufacturing</option>
                                        <option value="1">Shipping</option>
                                        <option value="1">Administration</option>
                                        <option value="1">Human Resources</option>
                                    </select>
                                </div>-->
                <tk:search />
            </form>
        </nav>
        <div class="area">
            <div class="contentbox">
                <a href="#" title="合記粥店" rel="bookmark" class="thumb-post">
                    <img src="./Menu/3.jpg" alt="omk" height="80" width="80">
                </a>
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
