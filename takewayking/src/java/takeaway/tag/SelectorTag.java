/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.tag;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author user
 */
public class SelectorTag extends SimpleTagSupport {

    private String[] options, belongTo = null;
    private String name;

    public String[] getBelongTo() {
        return belongTo;
    }

    public void setBelongTo(String[] belongTo) {
        this.belongTo = belongTo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String[] getOptions() {
        return options;
    }

    public void setOptions(String[] options) {
        this.options = options;
    }

    @Override
    public void doTag() throws JspException, IOException {
        try {
            PageContext pageContext = (PageContext) getJspContext();
            JspWriter out = pageContext.getOut();

            String allOptions = "";
            for (int i = 0; i < options.length; i++) {
                allOptions += "<option value=\"" + options[i] + "\"";
                if (belongTo != null) {
                    allOptions += "class=\"" + belongTo[i] + "\"";
                } 
                allOptions +=">" +  ToUpperFirstLetter(options[i]) + "</option>\n";
            }

            out.println("<div class=\"select-wrapper\">\n"
                    + "     <select name=\"" + name + "\">\n"
                    + "<option value=\"0\">- " + ToUpperFirstLetter(name) + " -</option>\n"
                    + allOptions
                    + "     </select>\n"
                    + " </div>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String ToUpperFirstLetter(String string) {
        if (string == null || string.length() == 0) {
            return string;
        }
        return string.substring(0, 1).toUpperCase() + string.substring(1);
    }

}
