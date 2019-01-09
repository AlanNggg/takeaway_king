<%-- 
    Document   : main
    Created on : Jan 7, 2019, 4:07:02 PM
    Author     : user
--%>


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
