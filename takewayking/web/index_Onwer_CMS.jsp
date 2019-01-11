<%@page import="takeaway.bean.RestaurantOwner"%>
<%@page import="takeaway.bean.User"%>
<%@page import="takeaway.db.UserDB"%>
<%@page import="takeaway.bean.log"%>
<%@page import="java.util.ArrayList"%>
<%@page import="takeaway.db.CMS"%>
<!DOCTYPE html>
<html>
<title>CMS for Restaurant Own</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-teal.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/jquery.dataTables.css"/>
 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.js"></script>


<style>
    
body {font-family: "Roboto", sans-serif}
.w3-bar-block .w3-bar-item {
  padding: 16px;
  font-weight: bold;

}
.w3-theme {
    color:black;
    background-color: #f44336 !important;
}
#home_page{
    
}
#add_user{
    display: none;
}
#add_rest_page{
     display: none;
}
#show_rest_list_page{
    display: none;
}
#show_user{
    display: none;
}

</style>
<body>

<nav class="w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card" style="z-index:3;width:250px;" id="mySidebar">
  <a class="w3-bar-item w3-button w3-border-bottom w3-large" href="#"></a>
  <a class="w3-bar-item w3-button w3-hide-large w3-large" href="javascript:void(0)" onclick="w3_close()">Close <i class="fa fa-remove"></i></a>
  <a class="w3-bar-item w3-button w3-dark-grey" href="#" onclick="show_home_page()"><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-white"></i>Home</a>
  <div>
    <a class="w3-bar-item w3-button" onclick="myAccordion('mang_rest')" href="javascript:void(0)"><i class="fa fa-coffee fa-fw w3-margin-right w3-large w3-text-teal"></i>Restaurant Management <i class="fa fa-caret-down"></i></a>
    <div id="mang_rest" class="w3-hide">
      <a id="btn_rest_list" class="w3-bar-item w3-button" onclick="show_rest_list_page()" href="#">Restaurant List</a>

    </div>
  </div>
  <div>
    <a class="w3-bar-item w3-button" onclick="myAccordion('mang_user')" href="javascript:void(0)"><i class="fa fa-address-card-o fa-fw w3-margin-right w3-large w3-text-teal"></i>User Management <i class="fa fa-caret-down"></i></a>
    <div id="mang_user" class="w3-hide">
      <a id="btn_add_user" class="w3-bar-item w3-button" href="#" onclick="show_add_user_page()">Add User</a>
      <a id="btn_user_list" class="w3-bar-item w3-button" href="#"onclick="show_user_list_page()">User List</a>
    </div>
  </div>
</nav>

<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

<div  class="w3-main" style="margin-left:250px;">

<header class="w3-container w3-theme " style="padding:2px 10px">
  <h1 class="w3-xlarge">TakeAway King CMS</h1>
  <div class="w3-right">
      <button class="w3-button w3-white w3-border w3-border-red w3-round-large"><a href="logout_CMS.jsp">Logout</a></button>
  </div>
</header>

<div id="home_page" class="w3-container" style="padding:32px">
<div class="w3-row">
    
  <div class="w3-half w3-container ">
      
        <div class="w3-card-4">
        <div class="w3-display-container w3-text-white">
          <div id="chart_Vistor" style="width: 500; height: 800;"></div>
       
        </div>
        <div class="w3-row">
          <div class="w3-center">
            <h4>Web Vistor</h4>
          </div>
        </div>
      </div>
    
  </div>
    
  <div class="w3-half w3-container">
      
 <div class="w3-card-4">
        <div class="w3-display-container w3-text-white">
          <div id="piechart_userType" style="width: 500; height: 800;"></div>
      
        </div>
        <div class="w3-row">
          <div class="w3-center">
            <h4>User Type</h4>
          </div>
        </div>
      </div>
    
  </div>
</div>
    <%
            CMS cm = new CMS();
            ArrayList aaa = cm.getAllUser();
            int total = 0;
                    total += aaa.size();
                   aaa =  cm.getAllRestaurantID();
                  total += aaa.size();
    %>
    <div class="w3-row-padding" style="margin:16px -16px">

        <div class="w3-quarter">
            <div class="w3-card-4">
                <div class="w3-bar w3-yellow">
                <span class="w3-bar-item ">Total Vsitor</span>
              </div>
                          <div class="w3-center" style="padding:16px 20px">
                                  <i class="fa fa-globe w3-jumbo" aria-hidden="true"></i>
                                    <h2>45879</h2>
                          </div>
            </div>
        </div>
        
        <div class="w3-quarter">
            <div class="w3-card-4">
                <div class="w3-bar w3-green">
                <span class="w3-bar-item ">Total Register</span>
              </div>
                          <div class="w3-center" style="padding:16px 20px">
                                  <i class="fa fa-users w3-jumbo" aria-hidden="true"></i>
                                  <h2><%=total%></h2>
                          </div>
            </div>
        </div>
        
         <div class="w3-quarter">
            <div class="w3-card-4">
                <div class="w3-bar w3-red">
                <span class="w3-bar-item ">Total Restaurant</span>
              </div>
                          <div class="w3-center" style="padding:16px 20px">
                                  <i class="fa fa-registered w3-jumbo" aria-hidden="true"></i>
                                  <h2><%=aaa.size()%></h2>
                          </div>
            </div>
        </div>
        
         <div class="w3-quarter">
            <div class="w3-card-4">
                <div class="w3-bar w3-orange">
                <span class="w3-bar-item ">Total Menu</span>
              </div>
                          <div class="w3-center" style="padding:16px 20px">
                                  <i class="fa fa-list-alt w3-jumbo" aria-hidden="true"></i>
                                    <h2>100,5432</h2>
                          </div>
            </div>
        </div>
      

</div>
   
<div class="w3-panel w3-padding-16 w3-card">
 <h2>News</h2>
  <p>Show the new register,restaurant,menu here</p>

  <table class="w3-table w3-striped w3-border">
    <tr>
      <th>Event</th>
      <th>User</th>
    </tr>
    <tr>
      <td>Add the New Restaurant</td>
       <td>Tiny yup</td>
    </tr>
    
  </table>
</div>
</div>
    <!--Add Restaurant Page Start-->
<!--    <div id="add_rest_page" class="w3-container" style="padding:32px">
        <div class="w3-panel w3-padding-16 w3-card">
        <div class="w3-container w3-teal">
            <h2>Create Restaurant</h2>
          </div>

             <form action="upLoadMenuImage" method="post" enctype="multipart/form-data"> 
               <br>
            <label class="w3-text-teal"><b>Restaurant Name</b></label>
            <input id="form_rest_name" name="form_rest_name"class="w3-input w3-border" type="text">
             <br>
            <label class="w3-text-teal"><b>Category Name</b></label>
            <select id="form_category_name" name="form_category_name" class="w3-select w3-border" name="cate_type">
                <option value="" disabled selected>Choose Location of Area</option>
                <%
//                    CMS cms = new CMS();
//                    ArrayList<String> gLS = cms.getCategory();
//                    for(String cate : gLS){
//                        out.print(" <option value=\""+ cate+"\">"+cate+"</option>");
//                    }
                %>
            </select>
             <br> <br>
            <label class="w3-text-teal"><b>Telephone:</b></label>
            <input id="form_rest_tel" name="form_rest_tel"class="w3-input w3-border " type="text">
            <br>
            <label class="w3-text-teal"><b>Area</b></label>
          <div class="w3-row-padding">
          <div class="w3-third">
            <select class="w3-select" id="areas"  name="areas">
                <option value="" disabled selected>Choose Restaurant Food Type</option>
                 <%
//                        cms = new CMS();
//                       ArrayList<String> result = cms.getAllAreas();
//                       for(int i = 0 ; i <result.size() ; i++){
//                           out.print(result.size());
                  %>

                  <option value=""></option>  
                  <%                              
                    // }
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
            <input id="form_rest_location" class="w3-input w3-border " type="text">
            <br>
            
             <label class="w3-text-teal"><b>Open Day</b></label>
              
             <div class="w3-row-padding">
                    <div  class="w3-col" style="width:20%" >
                         <input id="form_rest_monday" class="w3-check"type="checkbox"/>
                         <label>Monday</label>
                    </div>
                     <div class="w3-col" style="width:20%">
                         <input id="form_rest_tuesday" class="w3-check" type="checkbox"/>
                         <label>Tuesday</label>
                    </div>
                     <div class="w3-col" style="width:20%">
                         <input id="form_rest_wednesday" class="w3-check" type="checkbox"/>
                         <label>Wednesday</label>
                    </div>
                     <div class="w3-col" style="width:20%">
                         <input id="form_rest_tursday" class="w3-check" type="checkbox"/>
                         <label>Thursday</label>
                    </div>
                   <div class="w3-col" style="width:20%">
                         <input id="form_rest_friday" class="w3-check"type="checkbox"/>
                         <label> Friday</label>
                    </div>
                     <div class="w3-col" style="width:20%">
                         <input id="form_rest_saturday" class="w3-check" type="checkbox"/>
                         <label>Saturday</label>
                    </div>
                   <div class="w3-col" style="width:20%">
                         <input id="form_rest_sunday" class="w3-check" type="checkbox"/>
                         <label>Sunday</label>
                    </div>
               </div>
            <br>
             <label class="w3-text-teal"><b>Upload Menu</b></label>
             <input id="form_upload_Image"name="form_upload_Image"class="w3-input w3-border" type="file" accept="image/png" multiple />

             <br>
             <fieldset class="w3-text-teal">
                 <legend> Selected Image</legend>
             <div id="image_selected"class="w3-row-padding w3-center">
                 
             </div>
                 <button class="w3-button w3-red">Delete All Selected Image</button>
             </fieldset>
             <br>
            <input class="w3-btn w3-blue-grey" type="submit" value="Submit" >
          </form>
      </div>
      </div>-->
       <!--Add Restaurant Page End-->
       
       <!-- Modal for full size images on click-->
    <div id="modal01" class="w3-modal w3-black" onclick="this.style.display='none'">
      <span class="w3-button w3-large w3-black w3-display-topright" title="Close Modal Image"><i class="fa fa-remove"></i></span>
        <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
          <img id="img01" class="w3-image">
          <p id="caption" class="w3-opacity w3-large"></p>
        </div>
      </div>

            
       <!--Show Restaurant List Page Start-->
    <div id="show_rest_list_page" class="w3-container" style="padding:32px">
        <div class="w3-panel w3-padding-16 w3-card">
        <div class="w3-container w3-teal">
            <h2>Restaurant List</h2>
          </div>
          <div class="w3-row-padding">
          <div class="w3-third">
              <table id="show_owner_list" class="w3-table w3-striped w3-border">
                <tr>
                  <th>Name</th>
                  <th>Catory</th>
                </tr>
                <tr>
                  <td>Add the New Restaurant</td>
                   <td>Tiny yup</td>
                </tr>

              </table>
           
                 <%
                        CMS cms = new CMS();
                      ArrayList<RestaurantOwner> result = cms.getAllRestOwn((String)session.getAttribute("admin"));
                       for(int i = 0 ; i <result.size() ; i++){
                            out.print("<tr>");
                          out.print("<td>"+result.size() + "</td>");
                           out.print("</tr>");
                  %>

                  <option value="<%=result.get(i)%>"><%=result.get(i)%></option>  
                  <%                              
                     }
                  %>
            
        
          </div>
            <br>
        </div>
                  
            <div class="w3-row-padding">
            <table id="shoplist" class="w3-table-all w3-hoverable"></table>
             </div>
      </div>
      </div>
       <!--Show Restaurant List Page End-->
       
    <!--Add User Page Start-->
    <div id="add_user" class="w3-container" style="padding:32px">
        <div class="w3-panel w3-padding-16 w3-card">
       <label class="w3-text-teal"><b>Add User</b></label>
       <form target="_blank" action="add_user_CMS" method="post">
           
           <input type="email" id="add_user_email" name="add_user_email" placeholder="email" required><br><br>
                   <input type="text" id="add_user_name" name="add_user_name"  placeholder="name" required><br><br>
                  <input type="password" id="add_user_pwd" name="add_user_pwd"  placeholder="pwd" required><br><br>
                  <input type="submit"/>
              </form> 
      </div>
      </div>
          <!--Add User Page End-->
          
            <!--Show User List Start-->
    <div id="show_user" class="w3-container" style="padding:32px">
        <div class="w3-panel w3-padding-16 w3-card">
           <div class="w3-section">
          <label><b>Add Username</b></label>
          <br>
          <input class="w3-input w3-border w3-margin-bottom" id="search_user_" type="text" placeholder="Enter Username" name="search_user_" required>
         <br>
         <br>
          <table class="w3-table-all" id="modal_search_answer">
          </table>
            </div>
      </div>
      </div>
          <!--Show User List End-->
      </div>
<!--         <div style="display:hidden;">
             <form target="_blank" action="restaurantDetail_CMS.jsp" method="get">
                  <input id="rest_id_selected" type="text" id="rid" name="rid">
                  <input id="jump_restaurant_detail"type="submit"/>
              </form> 
         </div>-->
<script>
    
    var filelist =[];
            $(document).ready(function() {
            $('#show_owner_list').DataTable();
        } );
//                                   document.getElementById("form_upload_Image").addEventListener('change',function(event){
//
//                                    for(let i = 0 ; i < this.files.length;i++){
//                                        var promise = getBase64(this.files[i]);
//                                            promise.then(function(result) {
//                                    
//                                                filelist.push(result);
//                                                document.getElementById("image_selected").innerHTML 
//                                                                  += "<div class=\"w3-col m3\">"
//                                                                     + "<img style=\"width:100%;margin-bottom:5px;\" onclick=\"onClick_Image(this)\" class=\"w3-hover-opacity\" src='"+result+"'/>";
//                                                                     +"</div>";
//                                         });
//                                      
//                                       
//                                    }
//                                   
//                                ;
//                            });
    
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
                                xhttp.send("action=getDistrict&areas="+areas );
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
                             //handle the full selection
                             document.getElementById("subdistricts").onchange = function(){
                                var area = document.getElementById("areas").value;
                                var dist = document.getElementById("districts").value;
                                var subdist = this.value;
                                
                                var xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function() {
                                  if (this.readyState === 4 && this.status === 200) {
                                    var data = JSON.parse(this.responseText);
                                   console.log(data);
                                    var x = document.getElementById("shoplist");
                                   x.innerHTML = "<td>ID</td><td>Name</td><td>Category</td><td>Address</td><td>Rate</td><td>Visitor</td><td></td>";
                                    for(let i = 0 ; i < data.length ; i++){

                                        var row = x.insertRow(i+1);
                                        var cell1 = row.insertCell(0);
                                        var cell2 = row.insertCell(1);
                                        var cell3 = row.insertCell(2);
                                        var cell4 = row.insertCell(3);
                                        var cell5 = row.insertCell(4);
                                        var cell6 = row.insertCell(5);
                                        var cell7 = row.insertCell(6);
                                        row.value = data[i]["id"];
                                        cell1.innerHTML = data[i]["id"];
                                        cell2.innerHTML = data[i]["name"];
                                        cell3.innerHTML = data[i].category;
                                        cell4.innerHTML = data[i].address;
                                        cell5.innerHTML = "<span class=\"w3-badge w3-green\">"+data[i].rate+"</span>";
                                        cell6.innerHTML = "<span class=\"w3-badge w3-blue\">"+data[i].visitor+"</span>";
                                        cell7.innerHTML = "<button onclick=display_upload_image_page('"+ data[i].id +"')>upload</button>";
                                    }
                                 
                                  }
                              
                                };
                                xhttp.open("POST", "cmsController", true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send("action=getRestList&dist="+ dist + "&areas="+ area + "&subdist="+subdist);
                            };
                            
                            document.getElementById("search_user_").onkeydown = function(){
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
                            
//                            document.getElementById("shadow").onclick = function(){
//                                this.style.display = "none";
//                                document.getElementById("uploadBox").style.display = "none";
//                            };
</script>
<!--function List-->
<script>
    function getBase64(file, onLoadCallback) {
                                return new Promise(function(resolve, reject) {
                                    var reader = new FileReader();
                                    reader.onload = function() { resolve(reader.result); };
                                    reader.onerror = reject;
                                    reader.readAsDataURL(file);
                                });
                            }
     function show_add_rest_page(){
         
         console.log("sdadsdsa");
         //document.getElementById("add_rest_page").style.display = "block";
         document.getElementById("home_page").style.display = "none";
         document.getElementById("show_rest_list_page").style.display = "none";
         document.getElementById("add_user").style.display = "none";
         document.getElementById("show_user").style.display = "none";
     }
     function show_rest_list_page(){
         
         console.log("sdadsdsa");
         //document.getElementById("add_rest_page").style.display = "none";
         document.getElementById("home_page").style.display = "none";
         document.getElementById("show_rest_list_page").style.display = "block";
         document.getElementById("add_user").style.display = "none";
         document.getElementById("show_user").style.display = "none";
     }
     function show_add_user_page(){
         
         console.log("sdadsdsa");
         //document.getElementById("add_rest_page").style.display = "none";
         document.getElementById("home_page").style.display = "none";
         document.getElementById("show_rest_list_page").style.display = "none";
         document.getElementById("add_user").style.display = "block";
         document.getElementById("show_user").style.display = "none";
     }
     function show_user_list_page(){
         
         console.log("sdadsdsa");
         //document.getElementById("add_rest_page").style.display = "none";
         document.getElementById("home_page").style.display = "none";
         document.getElementById("show_rest_list_page").style.display = "none";
         document.getElementById("add_user").style.display = "none";
         document.getElementById("show_user").style.display = "block";
     }
     function show_home_page(){
         //document.getElementById("add_rest_page").style.display = "none";
         document.getElementById("home_page").style.display = "block";
         document.getElementById("show_rest_list_page").style.display = "none";
         document.getElementById("add_user").style.display = "none";
         document.getElementById("show_user").style.display
     }


function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 function display_upload_image_page(rsid){
                                document.getElementById("rest_id_selected").value = rsid;
                                document.getElementById("jump_restaurant_detail").click();
 }
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

 function onClick_Image(element) {
            document.getElementById("img01").src = element.src;
            document.getElementById("modal01").style.display = "block";
            var captionText = document.getElementById("caption");
            captionText.innerHTML = element.alt;
          }

// Accordions
function myAccordion(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme", "");
  }
}
</script>
     
<%-- Chart for google --%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
       <%
                cms = new CMS();
                ArrayList<log> log = cms.getLog();
                float m[] = new float[6];
                int n  =0;
                for(int i = 1 ; i < log.size() ; i+=2){
                    log g = log.get(i);
                    m[n] = (Float.valueOf(g.getNonRegister()) + Float.valueOf(g.getRegister()) + Float.valueOf(g.getOwner()))/3;
                    n++;
                }
                log l = log.get(log.size() - 1); 
          %>
      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month',  'Average'],
          ['Feb',         <%=m[0]%>],
          ['Apil',         <%=m[1]%>],
          ['Jun',          <%=m[2]%>],
          ['Aug',        <%=m[3]%>],
          ['Oct',        <%=m[4]%>],
          ['Dec',          <%=m[5]%>]
        ]);

        var options = {
          title : 'Last Year Monthly Vistor veiw',
          vAxis: {title: 'Vistors'},
          hAxis: {title: 'Month'},
          series: {1: {type: 'line'}}
        };

        var chart_vistor = new google.visualization.ComboChart(document.getElementById('chart_Vistor'));
        chart_vistor.draw(data, options);
      }
    </script>
    <!--Pie Chart-->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
          <%
                cms = new CMS();
                log = cms.getLog();
                l = log.get(log.size() - 1); 
          %>
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Non-Register',     <%=l.getNonRegister()%>],
          ['Register',      <%=l.getRegister()%>],
          ['Restaurant-Owner',   <%=l.getOwner()%>]
        ]);

        var options = {
          title: 'Daily Flow of User Type'
        };

        var chart_userType = new google.visualization.PieChart(document.getElementById('piechart_userType'));

        chart_userType.draw(data, options);
      }
    </script>
</body>
</html> 
