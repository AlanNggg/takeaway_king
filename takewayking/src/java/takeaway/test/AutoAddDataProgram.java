
package takeaway.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import org.apache.commons.codec.binary.Base64;
import takeaway.bean.Restaurant;
import takeaway.bean.RestaurantOwner;
import takeaway.db.CMS;
import takeaway.db.FakeDB;



/**
 *
 * @author TerryFungPC
 */
public class AutoAddDataProgram {
        public static void main(String[] age){
            try{
                   FakeDB db = new FakeDB();
                   String random =  RandomString();
              
                   //AddUser();
                  //AddOnwerToRest();
               //  AddRestaurant(200);
                // AddMenu();
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
        }
        public static void AddLog(){
             CMS cmd  = new CMS();
               FakeDB db = new FakeDB();
                Random ron = new Random();
                    String rest = "";
                    String nonRest = "";
                    String owner = "";
                    String date = "";
                    for(int j = 0 ; j < 12; j++){
                        rest = ron.nextInt(2000)+"";
                        nonRest = ron.nextInt(1000)+"";
                        owner = ron.nextInt(200)+"";
                        date = "2018-"+(j+1)+"-25";
                        cmd.saveLogToDB(rest, nonRest, owner, date);
          }
               
        }
        public static void AddMenu(){
             CMS cmd  = new CMS();
             FakeDB db = new FakeDB();
            String base64 =null;
             String base642 =null;
            File storeFile = new File("./web/images/bg1.jpg");
             File storeFile2 = new File("./web/images/bg2.jpg");
            base64 = encodeFileToBase64Binary(storeFile);
            base642 = encodeFileToBase64Binary(storeFile2);
          ArrayList<String> ids = cmd.getAllRestaurantID();
          
            for(int i = 0 ; i < ids.size() ; i++){
                      cmd.saveMenuToDB(ids.get(i), base64);
                      cmd.saveMenuToDB(ids.get(i), base642);
            }
         }
         public static void AddOnwerToRest(){
             CMS cmd  = new CMS();
             FakeDB db = new FakeDB();
           
          ArrayList<String> ids = cmd.getAllRestaurantID();
          ArrayList<RestaurantOwner> o = cmd.getAllOwner();
            for(int i = 0 ; i < ids.size() ; i++){
                     cmd.saveOwnerRectToDB(o.get((i % o.size())).getEmail(), ids.get(i));
            }
         }
         public static void AddUser(){
            ArrayList<String>emails = new ArrayList<String>();
            for(int i = 0 ; i < 1000 ; i++){
                boolean isRepeat = false;
                do{
                    isRepeat = false;
                    String r = RandomString(5) + "@gmail.com";
                    if(emails.contains(r)){
                        isRepeat = true;
                        System.out.println("Email is repeat");
                    }else{
                        emails.add(r);
                    }
                    
                }while(isRepeat);
            }
            System.out.println(emails.toString());
            
             ArrayList<String>names = new ArrayList<String>();
            for(int i = 0 ; i < 1000 ; i++){
                boolean isRepeat = false;
                do{
                    isRepeat = false;
                    String r = RandomString(3) + " " + RandomString(4);
                    if(emails.contains(r)){
                        isRepeat = true;
                        System.out.println("Name is repeat");
                    }else{
                        names.add(r);
                    }
                    
                }while(isRepeat);
            }
             System.out.println(names.toString());
            String name=null,password="123456";
            
             FakeDB db = new FakeDB();
              for(int i = 0 ; i < 1000 ; i++){
                  db.saveUserToDB(emails.get(i),names.get(i) , password);
              }
            
        }
          public static void AddOwner(int num){
            ArrayList<String>emails = new ArrayList<String>();
            for(int i = 0 ; i < num ; i++){
                boolean isRepeat = false;
                do{
                    isRepeat = false;
                    String r = RandomString(4) + "@gmail.com";
                    if(emails.contains(r)){
                        isRepeat = true;
                        System.out.println("Email is repeat");
                    }else{
                        emails.add(r);
                    }
                    
                }while(isRepeat);
            }
            System.out.println(emails.toString());
            
             ArrayList<String>names = new ArrayList<String>();
            for(int i = 0 ; i < num ; i++){
                boolean isRepeat = false;
                do{
                    isRepeat = false;
                    String r = RandomString(4) + " " + RandomString(4);
                    if(emails.contains(r)){
                        isRepeat = true;
                        System.out.println("Name is repeat");
                    }else{
                        names.add(r);
                    }
                    
                }while(isRepeat);
            }
             System.out.println(names.toString());
            String name=null,password="123456";
            
             FakeDB db = new FakeDB();
              for(int i = 0 ; i < num ; i++){
                  db.saveOwnerToDB(emails.get(i),names.get(i) , password);
              }
            
        }
        public static void AddAdmin(){
            ArrayList<String>emails = new ArrayList<String>();
            for(int i = 0 ; i < 20 ; i++){
                boolean isRepeat = false;
                do{
                    isRepeat = false;
                    String r = RandomString(4) + "@gmail.com";
                    if(emails.contains(r)){
                        isRepeat = true;
                        System.out.println("Email is repeat");
                    }else{
                        emails.add(r);
                    }
                    
                }while(isRepeat);
            }
            System.out.println(emails.toString());
            
             ArrayList<String>names = new ArrayList<String>();
            for(int i = 0 ; i < 20 ; i++){
                boolean isRepeat = false;
                do{
                    isRepeat = false;
                    String r = RandomString(4) + " " + RandomString(4);
                    if(emails.contains(r)){
                        isRepeat = true;
                        System.out.println("Name is repeat");
                    }else{
                        names.add(r);
                    }
                    
                }while(isRepeat);
            }
             System.out.println(names.toString());
            String name=null,password="123456";
            
             FakeDB db = new FakeDB();
              for(int i = 0 ; i < 20 ; i++){
                  db.saveAdminToDB(emails.get(i),names.get(i) , password);
              }
            
        }
         public static void AddRestaurant(int numOfRestaurnat)throws Exception{
        ArrayList<Restaurant>restaurant = new ArrayList<Restaurant>();
             ArrayList<String>categorys = new ArrayList<String>();
             categorys.add("beverage");
            categorys.add("chinese");
            categorys.add("dessert");
            categorys.add("fast food");
            categorys.add("japanese");
            categorys.add("tea restaurant");
            categorys.add("western");
             ArrayList<String>names = new ArrayList<String>();
             ArrayList<String>phones = new ArrayList<String>();
             ArrayList<String>location = new ArrayList<String>();
            ArrayList<String>address = new ArrayList<String>();
               InputStream fis = new FileInputStream("location.json");
              JsonReader reader = Json.createReader(fis);
              JsonArray array = reader.readArray();
              reader.close();
           
             
             for(int t=0;t<numOfRestaurnat;t++){
                Restaurant rest = new Restaurant();

              //1.Engender the name of restaurant use default value length  engendering the name;  
                if(t % 2 == 0){
                      boolean isRepeat = false;
                      do{
                          isRepeat = false;
                          String r = RandomString(4) + " " + RandomString(4) + " Restaurant";
                          if(names.contains(r)){
                              isRepeat = true;
                              System.out.println("Name is repeat");
                          }else{
                              names.add(r);
                              rest.setName(r);
                          }

                      }while(isRepeat);
                }else{

                      boolean isRepeat = false;
                      do{
                          isRepeat = false;
                          String r = RandomString(5) + " " + RandomString(5)+ " Restaurant";
                          if(names.contains(r)){
                              isRepeat = true;
                              System.out.println("Name is repeat");
                          }else{
                              names.add(r);
                              rest.setName(r);
                          }

                      }while(isRepeat);
                        
                }
             System.out.println("Name"+ rest.getName());
             
           //2.Engender the phone number
        
                boolean isRepeat = false;
                do{
                    isRepeat = false;
                     Random ron = new Random();
                    String phone = "";
                    for(int j = 0 ; j < 8; j++){
                    int r = ron.nextInt(10);
                       phone += r;
                    }
                    if(phones.contains(phone)){
                        isRepeat = true;
                        System.out.println("Name is repeat");
                    }else{
                        phones.add(phone);
                        rest.setTel(phone);
                    }
                    
                }while(isRepeat);
         
             System.out.println("Phone Number is"+rest.getTel());
             
             //3.Set area , district , subdistrict and Address   

       
//             System.out.println("Number of item:" + array.size());
//                  for(int i = 0 ; i < array.size(); i++){
//                 //System.out.println(array.getJsonObject(i).getString("area"));
//             }
                     Random ron = new Random();
                    String area = "",district="",subdistrict="";
                    String addr ="";
                   
                    int r = ron.nextInt(array.size());
                    area = array.getJsonObject(r).getString("area");
                    district = array.getJsonObject(r).getString("district");
                    subdistrict = array.getJsonObject(r).getString("subdistrict").replace("'", "\\'");
                    if(t % 4 == 0){
                            addr =RandomString(3)+" "+RandomString(4);
                    }else if(t % 5 == 1){
                           addr = RandomString(3)+" "+RandomString(7)+" street "+RandomString(3);
                   }else if(t % 5 == 2){
                           addr =RandomString(4)+" "+RandomString(6)+" House "+RandomString(4);
                   }else{
                           addr =RandomString(5)+" "+RandomString(7);
                   }
                    rest.setArea(area);
                    rest.setDistrict(district);
                    rest.setSubdistrict(subdistrict);
                   rest.setAddress(addr);
         
             System.out.println("Address :"+rest.getAddress());
             
             //4.Engender categorys
                
                 ron = new Random();                
                 r = ron.nextInt(categorys.size());
                 rest.setCategory(categorys.get(r));
                System.out.println("categorys is:"+ rest.getCategory());
                
              //5.Add Restaurant into DB
               FakeDB db = new FakeDB();
               db.saveRestaurantToDB(rest);
                 
                    
           
             
//          Path currentRelativePath = Paths.get("");
//           String s = currentRelativePath.toAbsolutePath().toString();
//           System.out.println("Current relative path is: " + s);
          
               
             }
            
            
//             FakeDB db = new FakeDB();
//              for(int i = 0 ; i < 100 ; i++){
//                  db.saveAdminToDB(names.get(i),names.get(i) , password);
//              }
         }
        
          public static String RandomString() {
                   return RandomString(5);
          }
        public static String RandomString(int Length) {
  
                int leftLimit = 97; // letter 'a'
                int rightLimit = 122; // letter 'z'
                int targetStringLength = Length;
                Random random = new Random();
                StringBuilder buffer = new StringBuilder(targetStringLength);
                for (int i = 0; i < targetStringLength; i++) {
                    int randomLimitedInt = leftLimit + (int) 
                      (random.nextFloat() * (rightLimit - leftLimit + 1));
                    buffer.append((char) randomLimitedInt);
                }
                String generatedString = buffer.toString();

                return generatedString;
}
       private static String encodeFileToBase64Binary(File file){
            String encodedfile = null;
            try {
                FileInputStream fileInputStreamReader = new FileInputStream(file);
                byte[] bytes = new byte[(int)file.length()];
                fileInputStreamReader.read(bytes);
                encodedfile = new String(Base64.encodeBase64(bytes), "UTF-8");
            } catch (FileNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            return encodedfile;
        }
}
