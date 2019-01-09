/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.tag;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author user
 */
public class SearchTag extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        try {
            PageContext pageContext = (PageContext) getJspContext();
            JspWriter out = pageContext.getOut();
            out.print("<div style=\"float: right; width: 40%;\">\n"
                    + "                    <div class=\"select-wrapper\" style=\"margin: 0px 0px 0px 20px; float: left; \">\n"
                    + "                        <select name=\"keyword\" id=\"keyword\" style=\" width: inherit; border-radius: 4px 0px 0px 4px;\">\n"
                    + "                            <option value=\"0\">- Search By -</option>\n"
                    + "                            <option value=\"name\">Restaurant Name</option>\n"
                    + "                            <option value=\"address\">Restaurant Address</option>\n"
                    + "                        </select>\n"
                    + "                    </div>\n"
                    + "                    <input type=\"text\" name=\"query\" id=\"query\" value=\"\" placeholder=\"Query\" style=\"width: 300px; float: left; border-radius: 0px;\">\n"
                    + "                    <input type=\"submit\" value=\"Search\" style=\"border-radius: 0px 4px 4px 0px; height: 2.75em;\">\n"
                    + "                </div>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
