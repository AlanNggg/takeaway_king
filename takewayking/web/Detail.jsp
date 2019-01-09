<%-- 
    Document   : NewTerritories
    Created on : Jan 9, 2019, 3:21:22 AM
    Author     : user
--%>

<%@page import="java.awt.Menu"%>
<%@page import="takeaway.bean.Category"%>
<%@page import="takeaway.db.CategoryDB"%>
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
    private ArrayList<Category> categories = null;
    private ArrayList<Restaurant> restaurants = null;
    private ArrayList<Menu> menus = null;

    private String[] getArea(String[] districts) {
        String[] areas = new String[districts.length];
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
        String[] districts = new String[subdistricts.length];
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
    CategoryDB categoryDb = new CategoryDB(dbUrl, dbUser, dbPassword);
    categories = categoryDb.queryCategory();
    ArrayList<String> areaList = new ArrayList<String>();
    ArrayList<String> districtList = new ArrayList<String>();
    ArrayList<String> subdistrictList = new ArrayList<String>();
    ArrayList<String> categoryList = new ArrayList<String>();
    for (Category category : categories) {
        categoryList.add(category.getCategory());
    }
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
    String[] categoryArray = categoryList.toArray(new String[categoryList.size()]);
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
            .contentarea {
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
        <%
            restaurants = (ArrayList<Restaurant>) request.getAttribute("restaurants");
            String selectedArea = (String) request.getAttribute("area");
            String selectedDistrict = (String) request.getAttribute("district");
            String selectedSubdistrict = (String) request.getAttribute("subdistrict");
            String selectedCategory = (String) request.getAttribute("category");
            String selectedKeyword = (String) request.getAttribute("keyword");
            
            if (restaurants == null) {
                RestaurantDB restaurantDb = new RestaurantDB(dbUrl, dbUser, dbPassword);
                restaurants = restaurantDb.queryRestaurant();
            }
        %>
        <jsp:include page="header.jsp"/>
        <nav style="position: relative; top: 80px; background-color: rgba(90, 90, 90, 0.7);  padding: 0 1.5em; display: flex; align-items: center; height: 80px;">
            <form method="get" action="search" style="position: relative; display: flex; align-items: center; float: right; width: 100%; height: 100%; margin: 0px;">
                <tk:selector options="<%=areas%>" name="area"/>
                <i class="fas fa-angle-right" style="font-size: 30px;"></i>
                <tk:selector options="<%=districts%>" name="district" belongTo="<%=getArea(districts)%>"/>
                <i class="fas fa-angle-right" style="font-size: 30px;"></i>
                <tk:selector options="<%=subdistricts%>" name="subdistrict" belongTo="<%=getDistrict(subdistricts)%>"/>
                <tk:selector options="<%=categoryArray%>" name="category"/>
                <tk:search />
            </form>
        </nav>
        <div class="contentarea">
            <%
                for (Restaurant restaurant : restaurants) {%>
            <tk:box name="<%=restaurant.getName()%>" category="<%=restaurant.getCategory()%>" 
            address="<%=restaurant.getAddress()%>" tel="<%=restaurant.getTel()%>"/>
            <%}
            %>
        </div>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
        <script>
            function trim(str) {
                return str.replace(/[ ]/g, "");
            }

            function setSelectedValue(selectObj, valueToSet) {
                for (var i = 0; i < selectObj.options.length; i++) {
                    if (selectObj.options[i].text == valueToSet) {
                        selectObj.options[i].selected = true;
                        return;
                    }
                }
            }
            
            function checkAndSelectArea() {
                var area = document.getElementById("area");
                var areaOptions = area.getElementsByTagName("*");
                for (var i = 0; i < areaOptions.length; i++) {
                    if (areaOptions[i].value == "<%=selectedArea%>")
                        areaOptions[i].selected = "true";
                }
            }
            
            function checkAndSelectDistrict() {
                var district = document.getElementById("district");
                var districtOptions = district.getElementsByTagName("*");
                for (var i = 0; i < districtOptions.length; i++) {
                    if (districtOptions[i].value == "<%=selectedDistrict%>")
                        districtOptions[i].selected = "true";
                }
            }
            
            function checkAndSelectSubdistrict() {
                var subdistrict = document.getElementById("subdistrict");
                var subdistrictOptions = subdistrict.getElementsByTagName("*");
                for (var i = 0; i < subdistrictOptions.length; i++) {
                    if (subdistrictOptions[i].value == "<%=selectedSubdistrict%>")
                        subdistrictOptions[i].selected = "true";
                }
            }
            
            function checkAndSelectCategory() {
                var category = document.getElementById("category");
                var categoryOptions = category.getElementsByTagName("*");
                for (var i = 0; i < categoryOptions.length; i++) {
                    if (categoryOptions[i].value == "<%=selectedCategory%>")
                        categoryOptions[i].selected = "true";
                }
            }
            
            function checkAndSelectKeyword() {
                var keyword = document.getElementById("keyword");
                var keywordOptions = keyword.getElementsByTagName("*");
                for (var i = 0; i < keywordOptions.length; i++) {
                    if (keywordOptions[i].value == "<%=selectedKeyword%>")
                        keywordOptions[i].selected = "true";
                }
            }
            
            <%if (selectedArea != null && !selectedArea.equals("0"))%>
                checkAndSelectArea();
            <%if (selectedDistrict != null && !selectedDistrict.equals("0"))%>
                checkAndSelectDistrict();
            <%if (selectedSubdistrict != null && !selectedSubdistrict.equals("0"))%>
                checkAndSelectSubdistrict();
            <%if (selectedCategory != null && !selectedCategory.equals("0"))%>
                checkAndSelectCategory();
            <%if (selectedKeyword != null && !selectedKeyword.equals("0"))%>
                checkAndSelectKeyword();
                
            //handle district select box
            document.getElementById("area").onchange = function () {
                var district = document.getElementById("district");
                var districtOptions = district.getElementsByTagName("*");
                var districtArray = [];
                var subdistrict = document.getElementById("subdistrict");
                var subdistrictOptions = subdistrict.getElementsByTagName("*");
                var area = trim(this.value);

                districtOptions[0].selected = "true";
                subdistrictOptions[0].selected = "true";

                for (var i = 0, max = districtOptions.length; i < max; i++) {
                    districtOptions[i].style.display = "block";
                }
                for (var j = 0, max = subdistrictOptions.length; j < max; j++) {
                    subdistrictOptions[j].style.display = "block";
                }

                if (area != "0") {
                    for (var i = 0, max = districtOptions.length; i < max; i++) {
                        if (districtOptions[i].value != "0" && districtOptions[i].getAttribute("class") != area) {
                            districtOptions[i].style.display = "none";
                        } else {
                            districtArray.push(trim(districtOptions[i].value));
                        }
                    }
                    for (var j = 0, max = subdistrictOptions.length; j < max; j++) {
                        if (subdistrictOptions[j].value == "0" || districtArray.includes(subdistrictOptions[j].getAttribute("class"))) {
                            subdistrictOptions[j].style.display = "block";
                        } else {
                            subdistrictOptions[j].style.display = "none";
                        }
                    }
                } else {
                    for (var i = 0, max = districtOptions.length; i < max; i++) {
                        districtOptions[i].style.display = "block";
                    }
                    for (var j = 0, max = subdistrictOptions.length; j < max; j++) {
                        subdistrictOptions[j].style.display = "block";
                    }
                }
            };

            //handle subdistrict select box
            document.getElementById("district").onchange = function () {
                var area = document.getElementById("area");
                var areaOptions = area.getElementsByTagName("*");
                var district = document.getElementById("district");
                var districtOptions = district.getElementsByTagName("*");
                var districtArray = [];
                var subdistrict = document.getElementById("subdistrict");
                var subdistrictOptions = subdistrict.getElementsByTagName("*");
                var district = trim(this.value);
                var districtClass;

                subdistrictOptions[0].selected = "true";

                for (var a = 0, max = districtOptions.length; a < max; a++) {
                    if (district == trim(districtOptions[a].value)) {
                        districtClass = districtOptions[a].getAttribute("class");
                    }
                }

                for (var j = 0, max = subdistrictOptions.length; j < max; j++) {
                    subdistrictOptions[j].style.display = "block";
                }

                for (var k = 0, max = areaOptions.length; k < max; k++) {
                    if (trim(areaOptions[k].value) == districtClass) {
                        areaOptions[k].selected = "true";
                        console.log(areaOptions[k].value);
                    }
                }

                if (district != "0") {
                    for (var i = 0, max = subdistrictOptions.length; i < max; i++) {
                        if (subdistrictOptions[i].value != "0" && subdistrictOptions[i].getAttribute("class") != district) {
                            subdistrictOptions[i].style.display = "none";
                        }
                    }
                } else {
                    for (var b = 0, max = districtOptions.length; b < max; b++) {
                        if (districtOptions[b].value == "0" || districtOptions[b].getAttribute("class") == trim(area.options[area.selectedIndex].value)) {
                            districtArray.push(trim(districtOptions[b].value));
                        }
                    }
                    for (var c = 0, max = subdistrictOptions.length; c < max; c++) {
                        if (subdistrictOptions[c].value == "0" || districtArray.includes(subdistrictOptions[c].getAttribute("class"))) {
                            subdistrictOptions[c].style.display = "block";
                        } else {
                            subdistrictOptions[c].style.display = "none";
                        }
                    }
                }
            };

            //handle the full selection
            document.getElementById("subdistrict").onchange = function () {
                var area = document.getElementById("area");
                var areaOptions = area.getElementsByTagName("*");
                var district = document.getElementById("district");
                var districtOptions = district.getElementsByTagName("*");
                var subdistrict = document.getElementById("subdistrict");
                var subdistrictOptions = subdistrict.getElementsByTagName("*");
                var subdistrict = trim(this.value);
                var subdistrictClass;
                for (var a = 0, max = subdistrictOptions.length; a < max; a++) {
                    if (subdistrict == trim(subdistrictOptions[a].value)) {
                        subdistrictClass = subdistrictOptions[a].getAttribute("class");
                    }
                }

                for (var k = 0, max = districtOptions.length; k < max; k++) {
                    if (trim(districtOptions[k].value) == subdistrictClass) {
                        districtOptions[k].selected = "true";
                        for (var j = 0, max = areaOptions.length; j < max; j++) {
                            if (trim(areaOptions[j].value) == districtOptions[k].getAttribute("class")) {
                                areaOptions[j].selected = "true";
                            }
                        }
                    }
                }
            };
        </script>
    </body>
</html>
