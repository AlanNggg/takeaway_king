

<%@page import="takeaway.bean.Restaurant"%>
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
            .image_selected_style{
                    float:left;
                    margin-right: 10px;
                    height:100px;
                    width:100px;
                }
        </style>
    </head>
    <body>
            <%
            String rid =  request.getParameter("rid");
                   CMS cms = new CMS();
            %>

             <div id="restaurant_info">
                <fieldset>
                    <legend>Restaurant Information</legend>
                         <%
                               ArrayList<Restaurant> restArray = cms.getRestListById(rid);
                               Restaurant rest = restArray.get(0);
                               
                              out.print("<p>Restaurant Id: " + rid + "</p>");
                              out.print("<p>Name: " + rest.getName() + "</p>");
                              out.print("<p>Category :" +  rest.getCategory() + "</p>");
                              out.print("<p>Telephone: " + rest.getTel() + "</p>");
                              out.print("<p>Area: " + rest.getArea() + " "+ rest.getDistrict() + " " +rest.getSubdistrict() + "</p>");
                              out.print("<p>Address: " +  rest.getAddress() + "</p>");
                              out.print("<p>Total Visitor " +  rest.getVisitors()+ "</p>");
                           
                          %>
                </fieldset>
             </div>

           <div id="had_menus">
              <fieldset>
                    <legend>Restaurant Menus</legend>
                        <%
                            // Get the all image from DB first                   
                            ArrayList<Menus> menus = cms.getMenus(rid);
                            for(int i = 0 ; i < menus.size();i++){
                                Menus menu  = menus.get(i);
                                out.print("<img class='image_selected_style' src='data:image/png;base64,"+menu.getMenu()+"'/>");
                            }
                        %>
            </fieldset>
            </div>

             <div >
                <fieldset>
                    <legend>Upload Menus</legend>
                        <form action="upLoadMenuImage" method="post" enctype="multipart/form-data"> 
                            <input id="upload_Image"name="upload_Image" type="file" accept="image/png" multiple /><br>
                            Upload Image To Rid :<input id="upload_rest_id" name="upload_rest_id" type="text"><br>
                            <input id="submit_menu_selected" type="submit" value="Upload"/>
                         </form> 
                    
                    <div id="image_selected">
                       
                        
                    </div>
                </fieldset>
             </div>
       
           <div id="result_Imgas"></div>
          <script>
            var filelist = []; //save the image which is selected.
                var x= document.getElementById("upload_rest_id").value = <%=rid%>;
                console.log("Restaurant ID: " + x);
              var hadMenus = document.getElementById("had_menus").getElementsByTagName("img"); //count total of image which alreadly had.
               console.log("Restaurant Menus have image:  "+hadMenus.length);
                 (function(){
                     
                //                             var rid = document.getElementById('rid');
                //                             var xhttp = new XMLHttpRequest();
                //                             xhttp.onreadystatechange = function() {
                //                             if (this.readyState === 4 && this.status === 200) {
                                               
                //                                var json = JSON.parse(this.responseText);
                //                                 console.log(json);
                //                                 var menus = json.menus;
                //                                 // console.log("Update Scuess");
                //                                 // window.location = "./uploadMenu.jsp";
                //                             //     var json = JSON.parse(this.responseText)
                //                             //     console.log(json[0].menu);
                //                             //     var menu = json[0].menu + "";
                //                             menus.forEach( m => {
                //                                 document.getElementById("result_Imgas").innerHTML 
                //                                                        += '<img class="image_selected_style" src="data:image/png;base64,'+ m.menu +'"></img>';
                                                
                //                             });
                                                 

                //                             // }
                                        
                //                             };
                //                             }
                                            
                //                             xhttp.open("POST", "cmsController", true);
                //                             xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                           
                //                             xhttp.send("action=getMenuByRid&rid="+S);
                 })()
              

                 function getBase64(file, onLoadCallback) {
                                return new Promise(function(resolve, reject) {
                                    var reader = new FileReader();
                                    reader.onload = function() { resolve(reader.result); };
                                    reader.onerror = reject;
                                    reader.readAsDataURL(file);
                                });
                            }
   
                document.getElementById("upload_Image").addEventListener('change',function(event){
                                    
                                    if(hadMenus.length == 4){
                                                console.log("Allow Restaurant have 5 menus");
                                                console.log(event);
                                                return;
                                    }
                                           
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
          </script>
    </body>
</html>
