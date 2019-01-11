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
      <jsp:useBean id="rest" class="takeaway.bean.Restaurant" scope="page" /> 
  <%
                    String rid =  request.getParameter("rid");
                   CMS cms = new CMS();
                   ArrayList<Restaurant> al= cms.getRestListById(rid);
                  // Restaurant rest = al.get(0).getSubdistrict();

                   // Get the all image from DB first                   
                   ArrayList<Menus> menus = cms.getMenus(rid);
                    Menus menu  = menus.get(0);
 %>
   <jsp:setProperty name="rest" property="category" value="<%=al.get(0).getCategory()%>"/> 
   <jsp:setProperty name="rest" property="name" value="<%=al.get(0).getName()%>"/>   
   <jsp:setProperty name="rest" property="tel" value="<%=al.get(0).getTel()%>"/>
   <jsp:setProperty name="rest" property="area" value="<%=al.get(0).getArea()%>"/>
   <jsp:setProperty name="rest" property="district" value="<%=al.get(0).getDistrict()%>"/> 
   <jsp:setProperty name="rest" property="subdistrict" value="<%=al.get(0).getSubdistrict()%>"/> 
   <jsp:setProperty name="rest" property="address" value="<%=al.get(0).getAddress()%>"/> 
   <jsp:setProperty name="rest" property="monday" value="<%=al.get(0).getMonday()%>"/> 
   <jsp:setProperty name="rest" property="tuesday" value="<%=al.get(0).getTuesday()%>"/> 
   <jsp:setProperty name="rest" property="wednesday" value="<%=al.get(0).getWednesday()%>"/> 
   <jsp:setProperty name="rest" property="thursday" value="<%=al.get(0).getThursday()%>"/>
   <jsp:setProperty name="rest" property="friday" value="<%=al.get(0).getFriday()%>"/> 
   <jsp:setProperty name="rest" property="saturday" value="<%=al.get(0).getSaturday()%>"/> 
   <jsp:setProperty name="rest" property="sunday" value="<%=al.get(0).getSunday()%>"/> 
   <jsp:setProperty name="rest" property="rate" value="<%=al.get(0).getRate()%>"/> 
   <jsp:setProperty name="rest" property="visitors" value="<%=al.get(0).getVisitors()%>"/> 
   <jsp:setProperty name="rest" property="id" value="<%=al.get(0).getId()%>"/> 
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
              <h2 style='color:white'><jsp:getProperty name="rest"property="name" /></h2>
          </div>
        </div>
        <div class="w3-container">
            <p><i class="fa fa-coffee fa-fw w3-margin-right w3-large w3-text-teal"></i><jsp:getProperty name="rest"property="category" /></p>
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><jsp:getProperty name="rest"property="address" /></p>
          <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><jsp:getProperty name="rest"property="tel" /></p>
          <hr>

        </div>
        <button class="w3-button w3-teal w3-right" onclick="document.getElementById('modal_upload_info').style.display='block'">Modify Detail</button>
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
<!--<button class="w3-button w3-blue w3-right" onclick="document.getElementById('modal_upload_image').style.display='block'">Upload Menus</button>-->
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
        <button class="w3-button w3-teal w3-right" onclick="document.getElementById('modal_add_user').style.display='block'">Add Owner</button>
  <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-address-book-o fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Owner</h2>
  <!-- Responsive Grid. Four columns on tablets, laptops and desktops. Will stack on mobile devices/small screens (100% width) -->
     <div class="w3-row-padding w3-center">
     <table class="w3-table-all" id="table_owner">
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

<div id="modal_upload_info" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('modal_upload_info').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
      
      </div>

      <form class="w3-container" action="upLoadMenuImage" method="post" enctype="multipart/form-data"> 
          <div  style="display:none;">
          <input id="form_rest_id" name="form_rest_id" type="text"  value="<jsp:getProperty name="rest"property="id"/>">
          </div>
         <label class="w3-text-teal"><b>Restaurant Name</b></label>
         <input id="form_rest_name" name="form_rest_name"class="w3-input w3-border" type="text"  value="<jsp:getProperty name="rest"property="name"/>">
             <br>
            <label class="w3-text-teal"><b>Category Name</b></label>
            <select id="form_category_name" name="form_category_name" class="w3-select w3-border" name="cate_type" value="<jsp:getProperty name="rest"property="category"/>">
                <option value="" disabled selected>Choose Restaurant Food Type</option>
                <%
                    cms = new CMS();
                    ArrayList<String> gLS = cms.getCategory();
                    for(String cate : gLS){
                        out.print(" <option value=\""+ cate+"\">"+cate+"</option>");
                    }
                %>
            </select>
             <br> <br>
            <label class="w3-text-teal"><b>Telephone:</b></label>
            <input id="form_rest_tel" name="form_rest_tel"class="w3-input w3-border " type="text" value="<jsp:getProperty name="rest"property="tel"/>">
            <br>
            
            <label class="w3-text-teal"><b>Area</b></label>
          <div class="w3-row-padding">
          <div class="w3-third">
            <select class="w3-select" id="areas"  name="areas">
                <option value="" disabled selected>Choose Restaurant Food Type</option>
                 <%
                       cms = new CMS();
                       ArrayList<String> result = cms.getAllAreas();
                       for(int i = 0 ; i <result.size() ; i++){
                           out.print(result.size());
                  %>

                  <option value="<%=result.get(i)%>"><%=result.get(i)%></option>  
                  <%                              
                     }
                  %>
            </select>
            

          </div>   
            
          <div class="w3-third">
             <select class="w3-select" id="districts" name='districts'>  
                <option value="" disabled selected>-Districts-</option>
               </select>
          </div>
          <div class="w3-third">
              <select class="w3-select" id="subdistricts" name='subdistricts'> 
                  <option value="" disabled selected>-Subdistricts-</option>
              </select>
          </div>
            
        </div>
            <br>
            <label  class="w3-text-teal"><b>Location Detail</b></label>
            <input id="form_rest_location" name="form_rest_location" class="w3-input w3-border " type="text" value="<jsp:getProperty name="rest"property="address"/>">
            <br>        
            <br>
             <label class="w3-text-teal"><b>Upload Menu</b></label>
             <input id="form_upload_Image"name="form_upload_Image"class="w3-input w3-border" type="file" accept="image/png" multiple />

             <br>
             <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                    <input class="w3-btn w3-blue-grey w3-right" type="submit" value="Submit" >
        
               </div>
      </form>
    </div>
  </div>

  <div id="modal_add_user" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('modal_add_user').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>
        <div class="w3-section">
          <label><b>Add Username</b></label>
          <br>
          <input class="w3-input w3-border w3-margin-bottom" id="modal_search_user" type="text" placeholder="Enter Username" name="usrname" required>
         <br>
         <br>
          <table class="w3-table-all" id="modal_search_answer">
          </table>
            </div>

    </div>
  </div>

<script>
    function remove_owner(oid){
        console.log(oid);
         var x = document.getElementById("table_owner");
         console.log(x.rows.length);
         if(x.rows.length<=2){
             alert("AtLeast one user");
             return;
         }else{
              var xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function() {
                                  if (this.readyState === 4 && this.status === 200){
                                    console.log(this.responseText);
                                    location.reload(true);
//                                     var data = JSON.parse(this.responseText);
//                                     if(data.length >0){
//
//                                      var x = document.getElementById("modal_search_answer");
//                                         x.innerHTML = "<td>Email</td><td>Name</td><td></td>";
//                                    for(let i = 0 ; i < data.length ; i++){
//                                        var row = x.insertRow(i+1);
//                                        var cell1 = row.insertCell(0);
//                                        var cell2 = row.insertCell(1);
//                                        var cell3 = row.insertCell(2);
//                                        row.value = data[i].name;
//                                        cell1.innerHTML = data[i].name;
//                                        cell2.innerHTML = data[i].id;
//                                        cell3.innerHTML = "<button onclick=upload_this_owner_('"+data[i].name +"')>add</button>";
//                                        }
//                                        }
                              
                                }
                                
                            };
                                xhttp.open("POST", "cmsController", true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send("action=deleteOwnByEmail&email="+ oid +"&rid=" +  <jsp:getProperty name="rest"property="id" /> );
         }
    }
         function onClick(element) {
            document.getElementById("img01").src = element.src;
            document.getElementById("modal01").style.display = "block";
            var captionText = document.getElementById("caption");
            captionText.innerHTML = element.alt;
          }
          document.getElementById("modal_search_user").onkeydown = function(){
                                console.log(this.value);
                             var xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function() {
                                  if (this.readyState === 4 && this.status === 200){
                                    console.log(this.responseText);
                                     var data = JSON.parse(this.responseText);
                                     if(data.length >0){

                                      var x = document.getElementById("modal_search_answer");
                                         x.innerHTML = "<td>Email</td><td>Name</td><td></td>";
                                    for(let i = 0 ; i < data.length ; i++){
                                        var row = x.insertRow(i+1);
                                        var cell1 = row.insertCell(0);
                                        var cell2 = row.insertCell(1);
                                        var cell3 = row.insertCell(2);
                                        row.value = data[i].name;
                                        cell1.innerHTML = data[i].name;
                                        cell2.innerHTML = data[i].id;
                                        cell3.innerHTML = "<button onclick=upload_this_owner_('"+data[i].name +"')>add</button>";
                                        }
                                        }
                              
                                }
                                
                            };
                                xhttp.open("POST", "cmsController", true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send("action=getUserByChar&key="+ this.value );
                            
                };
                function upload_this_owner_(v){
                       console.log(v);
                       var rid = <jsp:getProperty name="rest"property="id" />;
                             var xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function() {
                                  if (this.readyState === 4 && this.status === 200){
                                    console.log(this.responseText);
                                     var data = JSON.parse(this.responseText);
                                     if(data.length >0 && data.sid == "done"){
                                         alert("Select success!!");
                                         location.reload(true);
                                        // window.location.href = "/restaurantDetail_CMS?rid="+ <jsp:getProperty name="rest"property="id" /> +">";
                                     }
//
//                                      var x = document.getElementById("modal_search_answer");
//                                         x.innerHTML = "<td>Email</td><td>Name</td><td></td>";
//                                    for(let i = 0 ; i < data.length ; i++){
//                                        var row = x.insertRow(i+1);
//                                        var cell1 = row.insertCell(0);
//                                        var cell2 = row.insertCell(1);
//                                        var cell3 = row.insertCell(2);
//                                        row.value = data[i].email;
//                                        cell1.innerHTML = data[i].email;
//                                        cell2.innerHTML = data[i].name;
//                                        cell3.innerHTML = "<button onclick=upload_this_owner_('"+data[i].email +"')>add</button>";
//                                        }
//                                        }
                              
                                }
                                
                            };
                                xhttp.open("POST", "cmsController", true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send("action=saveOwnerByEmail&email="+ v + "&rid="+rid);
                }
          //handle district select box
                  document.getElementById("areas").onchange = function(){
                          
                                var areas = this.value;
                                 if(areas === ""){
                                            document.getElementById("districts").innerHTML = '<option value="">-Please select the area first-</option>';
                                            document.getElementById("subdistricts").innerHTML = null;
                                            document.getElementById("shoplist") = null;
                                       return;
                                        }
                                var xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function() {
                                  if (this.readyState === 4 && this.status === 200) {
                                    console.log(this.responseText);
                                    var data = JSON.parse(this.responseText);
                                    var data = data.dist;
                                    var x = document.getElementById("districts");
                                   x.innerHTML = null;
                                    for(let i = 0 ; i < data.length ; i++){
                                        var option = document.createElement("option");
                                        option.text = data[i];
                                        option.value = data[i];
                                        x.add(option);
                                    }

                                  }
                              
                                };
                            
                          
                                xhttp.open("POST", "cmsController", true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send("action=getDistrict&areas="+areas);
                            };
                         
                         //handle subdistrict select box
                         document.getElementById("districts").onchange = function(){
                             
  
                                    console.log("sadasd");
                                      var dist = this.value;
                                      var area = document.getElementById("areas").value;
                                      
                                      var xhttp = new XMLHttpRequest();
                                      xhttp.onreadystatechange = function() {
                                        if (this.readyState === 4 && this.status === 200) {
                                          console.log(this.responseText);
                                          var data = JSON.parse(this.responseText);
                                          var data = data.subdist;
                                          var x = document.getElementById("subdistricts");
                                            x.innerHTML = null;
                                          for(let i = 0 ; i < data.length ; i++){
                                              var option = document.createElement("option");
                                              option.text = data[i];
                                              option.value = data[i];
                                              x.add(option);
                                          }

                                        }

                                      };
                                  
                 
                                      xhttp.open("POST", "cmsController", true);
                                      xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                      xhttp.send("action=getSubDistrict&dist="+ dist + "&areas="+area);
                            };
                            
                      

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
