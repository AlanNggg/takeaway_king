
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="takeaway.db.CMS" %>
<%@page import="takeaway.bean.Menus" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
                #uploadBox{
                    position: absolute;
                    top:20%;
                    left:40%;
                    z-index: 10;
                    height:40%;
                    width:40%;
                    background:white;
                    display: none;
                }
                #shadow{
                    position: absolute;
                    z-index: 9;
                    height:100%;
                    width:100%;
                    background:gray;
                    opacity: 0.5;
                    display: none;
                }

                .image_selected_style{
                    float:left;
                    margin-right: 10px;
                    height:100px;
                    width:100px;
                }
        </style>
    </head>
    <body>
        <div id="shadow"></div>
       <select  id="areas" name='areas'>  
                  <option value="">-=Location=-</option>  
                  <%
                       CMS cms = new CMS();
                       ArrayList<String> result = cms.getAllAreas();
                       for(int i = 0 ; i <result.size() ; i++){
                           out.print(result.size());
                  %>

                  <option value="<%=result.get(i)%>"><%=result.get(i)%></option>  
                  <%                              
                     }
                  %>

              </select>
               <select  id="districts" name='districts'>  
                  <option value="">-Please select the area first-</option>  
                 
              </select>
                <select  id="subdistricts" name='subdistricts'>  
         
                 
              </select>
         
              <table id="shoplist" border="1"></table>

              <div id="uploadBox">

                    <form action="upLoadMenuImage" method="post" enctype="multipart/form-data"> 
                        <input id="upload_Image"name="upload_Image" type="file" accept="image/png" multiple />
                        <input id="upload_rest_id" name="upload_rest_id" type="text">
                        <input id="submit_menu_selected" type="submit" value="Upload"/>
                     </form> 
                    <div id="image_selected"></div>
              </div>

              <div id="result_Imgas"></div>

              <form action="restaurantDetail_CMS.jsp" method="get">
                  <input id="rest_id_selected" type="text" id="rid" name="rid">
                  <input id="jump_restaurant_detail"type="submit"/>
              </form> 
               
              <script>
                var filelist = [];

                function display_upload_image_page(rsid){
                                document.getElementById("rest_id_selected").value = rsid;
                                document.getElementById("jump_restaurant_detail").click();
//
//                            var xmlHttp = new XMLHttpRequest();
//                            xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
//                            xmlHttp.send( null );
//                            return xmlHttp.responseText;
//
                              //  document.getElementById("shadow").style.display = "block";
                              //  document.getElementById("uploadBox").style.display = "block";
                              //  document.getElementById("upload_rest_id").value = rsid;
                              
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
                                   x.innerHTML = "<td>ID</td><td>Name</td><td>Category</td><td>Address</td><td></td>";
                                    for(let i = 0 ; i < data.length ; i++){

                                        var row = x.insertRow(i+1);
                                        var cell1 = row.insertCell(0);
                                        var cell2 = row.insertCell(1);
                                        var cell3 = row.insertCell(2);
                                        var cell4 = row.insertCell(3);
                                        var cell5 = row.insertCell(4);
                                        row.value = data[i]["id"];
                                        cell1.innerHTML = data[i]["id"];
                                        cell2.innerHTML = data[i]["name"];
                                        cell3.innerHTML = data[i].category;
                                        cell4.innerHTML = data[i].address;
                                        cell5.innerHTML = "<button onclick=display_upload_image_page('"+ data[i].id +"')>upload</button>";
                                    }
                                 
                                  }
                              
                                };
                                xhttp.open("POST", "cmsController", true);
                                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xhttp.send("action=getRestList&dist="+ dist + "&areas="+ area + "&subdist="+subdist);
                            };
                            
                            document.getElementById("shadow").onclick = function(){
                                this.style.display = "none";
                                document.getElementById("uploadBox").style.display = "none";
                            }

                            


                            function getBase64(file, onLoadCallback) {
                                return new Promise(function(resolve, reject) {
                                    var reader = new FileReader();
                                    reader.onload = function() { resolve(reader.result); };
                                    reader.onerror = reject;
                                    reader.readAsDataURL(file);
                                });
                            }

                            document.getElementById("upload_Image").addEventListener('change',function(event){
                                    
                                    
                                    for(let i = 0 ; i < this.files.length;i++){
                                        var promise = getBase64(this.files[i]);
                                        promise.then(function(result) {
                                                console.log(result);
                                                filelist.push(result);
                                                document.getElementById("image_selected").innerHTML 
                                                                        += '<img class="image_selected_style" src=" '+ result +' "></img>';
                                         });
                                      
                                        //filelist.push(""+reader.result);
                                       // document.getElementById("image_selected").innerHTML += '<img src=" '+ reader.result +' "></img>';
                                    }
                                   
                                   console.log(filelist);
                            });
                            //  document.getElementById("submit_menu_selected").onclick = function(){
                                
                            //     if (filelist == null){
                            //         console.log("no image selected");
                            //         return;
                            //     }
                            //     var rid =  document.getElementById("upload_rest_id").value;
                            //     var xhttp = new XMLHttpRequest();
                            //                 xhttp.onreadystatechange = function() {
                            //                 if (this.readyState === 4 && this.status === 200) {
                            //                     document.getElementById("shadow").onclick();
                            //                     console.log("Update Scuess");
                            //                     window.location = "./uploadMenu.jsp";
                            //                 //     var json = JSON.parse(this.responseText)
                            //                 //     console.log(json[0].menu);
                            //                 //     var menu = json[0].menu + "";
                            //                 //      document.getElementById("result_Imgas").innerHTML 
                            //                 //                             += '<img class="image_selected_style" src="'+ menu +'"></img>';

                            //                 // }
                                        
                            //                 };
                            //                 }
                                            
                            //                 xhttp.open("POST", "cmsController", true);
                            //                 xhttp.setRequestHeader("Content-type", "application/json");
                            //                 var files = JSON.stringify({id:rid,image:filelist});
                            //                 xhttp.send(files);
                            
                            // }
                           
                  </script>
                 
    </body>
</html>
