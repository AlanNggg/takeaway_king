/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package takeaway.tag;

import java.io.IOException;
import java.io.StringWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author user
 */
public class BoxTag extends SimpleTagSupport {

    private String name, category, address, tel;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Override
    public void doTag() throws JspException, IOException {
        try {
            PageContext pageContext = (PageContext) getJspContext();
            JspWriter out = pageContext.getOut();
            out.println("<div class=\"contentbox\">\n"
                    + "<div class=\"boxTitle\">" + name + "</div>"
                    + "         <a href=\"#\" title=\"" + name + "\n\nCategory: " + category
                    + "\n\nAddress: " + address + "\n\nTel: " + tel + "\" rel=\"bookmark\" class=\"thumb-post\">\n");
            StringWriter sw = new StringWriter();
            this.getJspBody().invoke(sw);
            this.getJspContext().getOut().println(sw.toString());
            out.println("\n</a>\n"
                    + "</div>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
