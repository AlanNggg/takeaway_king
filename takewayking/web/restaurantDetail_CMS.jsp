<%@page import="takeaway.bean.RestaurantOwner"%>
<!DOCTYPE html>
<%@page import="takeaway.bean.Restaurant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="takeaway.db.CMS" %>
<%@page import="takeaway.bean.Menus" %>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
</style>
<body class="w3-light-grey">
  <%
                    String rid =  request.getParameter("rid");
                   CMS cms = new CMS();
                   ArrayList<Restaurant> restArray = cms.getRestListById(rid);
                   Restaurant rest = restArray.get(0);

                   // Get the all image from DB first                   
                   ArrayList<Menus> menus = cms.getMenus(rid);
                    Menus menu  = menus.get(0);
 %>
                            
<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-third">
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
            <img src="data:image/png;base64,<%=menu.getMenu()%>" style="width:100%" alt="Avatar">
          <div class="w3-display-bottomleft w3-container w3-text-black">
              <h2 style='color:white'><%=rest.getName()%></h2>
          </div>
        </div>
        <div class="w3-container">
            <p><i class="fa fa-coffee fa-fw w3-margin-right w3-large w3-text-teal"></i><%= rest.getCategory()%></p>
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><%  out.print( rest.getAddress());%></p>
          <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>1224435534</p>
          <hr>

        </div>
        <button class="w3-button w3-teal w3-right">Modify Detail</button>
      </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">
    
  <div class="w3-container w3-card w3-white w3-margin-bottom">
  
       <!-- Container (Portfolio Section) -->
<div class="w3-content w3-container w3-padding-32" id="portfolio">
   <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-bar-chart fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Vistors</h2>
  <!-- Responsive Grid. Four columns on tablets, laptops and desktops. Will stack on mobile devices/small screens (100% width) -->
     <div class="w3-row-padding w3-center">
           <div id="chart_div" style="width: 500; height: 300;"></div>

  </div>
</div>



<!-- Modal for full size images on click-->
    <div id="modal01" class="w3-modal w3-black" onclick="this.style.display='none'">
      <span class="w3-button w3-large w3-black w3-display-topright" title="Close Modal Image"><i class="fa fa-remove"></i></span>
        <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
          <img id="img01" class="w3-image">
          <p id="caption" class="w3-opacity w3-large"></p>
        </div>
      </div>
 </div>
        
 <div class="w3-container w3-card w3-white w3-margin-bottom">
  
       <!-- Container (Portfolio Section) -->
<div class="w3-content w3-container w3-padding-32" id="portfolio">
<button class="w3-button w3-blue w3-right">Manage Menus</button>
  <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-cutlery fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Menus</h2>
  <!-- Responsive Grid. Four columns on tablets, laptops and desktops. Will stack on mobile devices/small screens (100% width) -->
     <div class="w3-row-padding w3-center">
           <%
                                    // Get the all image from DB first                   
                                     menus = cms.getMenus(rid);
                                    for(int i = 0 ; i < menus.size();i++){
                                        menu  = menus.get(i);
                                         out.print("<div class=\"w3-col m3\">");
                                         
                                            out.print("<img style=\"width:100%\" onclick=\"onClick(this)\" class=\"w3-hover-opacity\" src='data:image/png;base64,"+menu.getMenu()+"'/>");
                                    
                                        out.print("</div>");
                                    }
                                    
                                %>
<!--    <div class="w3-col m3">
      <img src="/w3images/p1.jpg" style="width:100%" onclick="onClick(this)" class="w3-hover-opacity" alt="The mist over the mountains">
    </div>-->

  </div>
  
</div>
</div>
<div class="w3-container w3-card w3-white w3-margin-bottom">
  
       <!-- Container (Portfolio Section) -->
<div class="w3-content w3-container w3-padding-32" id="portfolio">
<button class="w3-button w3-blue w3-right">Add Owner</button>
  <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-address-book-o fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Owner</h2>
  <!-- Responsive Grid. Four columns on tablets, laptops and desktops. Will stack on mobile devices/small screens (100% width) -->
     <div class="w3-row-padding w3-center">
          <table class="w3-table-all">
    <thead>
      <tr class="w3-red">
        <th>Name</th>
        <th>Email</th>
        <th></th>
      </tr>
    </thead>
    

          <%
                            ArrayList<RestaurantOwner> roList = cms.getRestOwnerByRid(rid);
                                    for(int i = 0 ; i < roList.size();i++){
                                        RestaurantOwner ro  = roList.get(i);
                                         out.print("<tr>");
                                                     out.print("<td>"+ro.getName()+"</td>");
                                                     out.print("<td>"+ro.getEmail()+"</td>");
                                                    out.print("<td><button onclick=\"remove_owner('"+ ro.getEmail() +"')\">Delete</button></td>");
                                        out.print("</tr>");

                                    }
            %>
        </table>
<!--    <div class="w3-col m3">
      <img src="/w3images/p1.jpg" style="width:100%" onclick="onClick(this)" class="w3-hover-opacity" alt="The mist over the mountains">
    </div>-->

  </div>
  
</div>
</div>
     
<!--            <div class="w3-half">
              <div class="w3-card-4 test" style="width:92%;max-width:300px;">
                <img src="img_avatar3.png" alt="Avatar" style="width:100%;opacity:0.85">
                  <div class="w3-container">
                  <h4><b>John</b></h4>    
                  <p>Architect and engineer</p>    
                  </div>
              </div>
             <br>
            </div>-->
        
        <%-- <div class="w3-container">
          <h5 class="w3-opacity"><b>W3Schools.com</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Forever</h6>
          <p>Web Development! All I need to know in one place</p>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>London Business School</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>2013 - 2015</h6>
          <p>Master Degree</p>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>School of Coding</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>2010 - 2013</h6>
          <p>Bachelor Degree</p><br>
        </div> --%>
      
      
        
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  </div>
  <!-- End Page Container -->
</div>

<script>
         function onClick(element) {
            document.getElementById("img01").src = element.src;
            document.getElementById("modal01").style.display = "block";
            var captionText = document.getElementById("caption");
            captionText.innerHTML = element.alt;
          }

</script>

<%-- Chart for google --%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month',  'Average'],
          ['Feb',         614.6],
          ['Apil',         682],
          ['Jun',          623],
          ['Aug',        609.4],
          ['Oct',        569.6],
          ['Dec',          569.6]
        ]);

        var options = {
          title : 'Monthly Vistor veiw <%=rest.getName()%>',
          vAxis: {title: 'Vistors'},
          hAxis: {title: 'Month'},
          series: {1: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</body>
</html>
