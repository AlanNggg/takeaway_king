/*
        Upload image to database.
        Frist , 
 */
package takeaway.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.codec.binary.Base64;
import takeaway.db.CMS;

 

/**
 *
 * @author TerryFungPC
 */
@WebServlet(name = "upLoadMenuImage", urlPatterns = {"/upLoadMenuImage"})
public class upLoadMenuImage extends HttpServlet {
   private static final long serialVersionUID = 1L;
    private String defaultPath = "C:";
    private String name = "default";

    public void init() {

        defaultPath = "C:";
    }

    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "tmp";

    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    /**
     * Upon receiving file upload submission, parses the request to read upload
     * data and saves the file on disk.
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }
           
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = //getServletContext().getRealPath("")
                defaultPath
                + File.separator + UPLOAD_DIRECTORY;
        System.out.println(uploadPath);
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            String base64 =null;
             String  name =null;
              String value = null;
            if (formItems != null && formItems.size() > 0) {

                  for (FileItem field : formItems) {    //1.find the restaurant id first
                        if (field.isFormField()) {

                              name = field.getFieldName();

                             value = field.getString();

                            request.setAttribute("rid", value);
                            System.out.println("You are insert menu to Restaurant ID: "+value);

                         }
                 }
                  
                  //2.find the file of image
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        
                        //3. saves the file on disk
                        item.write(storeFile);

                        request.setAttribute("message",
                                "Upload has been done successfully!");
                        request.setAttribute("fileName",
                                fileName);
                        //4.make file turn to base 64
                        base64 = encodeFileToBase64Binary(storeFile);
                        
                        //System.out.println(base64);
                        
                        //5.Save image to DB
                         CMS msc = new CMS();
                        msc.saveMenuToDB(value, base64);

                    //java.nio.file.Files.delete(Paths.get(filePath));
                   

                    }
                }
                    
                 
                     
                 //6. Delete  all the image from disk
                File dir = new File("C:"+File.separator+"tmp");
		
		if(dir.isDirectory() == false) {
			System.out.println("Not a directory. Do nothing");
			return;
		}
		File[] listFiles = dir.listFiles();
		for(File file : listFiles){
			System.out.println("Deleting "+file.getName());
			file.delete();
		}
		//now directory is empty, so we can delete it
		System.out.println("Deleting Directory. Success = "+dir.delete());
                    //  PrintWriter out = response.getWriter();
                      // response.setContentType("text/html");
                    //  out.print("<img src='data:image/png;base64, " + msc.getMenusByRid(value)+"'/>");
               getServletContext().getRequestDispatcher("/restaurant_detail_Config.jsp?rid="+value).forward(
               request, response);
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }
        // redirects client to message page
      
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
