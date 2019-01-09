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
public class ContentTag extends SimpleTagSupport {

    private String area;
    private String name = "abc restaurant", address;
    private String[] numOfContents = {"one", "two", "three"};
    private int numOfContent;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getNumOfContent() {
        return numOfContent;
    }

    public void setNumOfContent(int numOfContent) {
        this.numOfContent = numOfContent;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    @Override
    public void doTag() throws JspException, IOException {
        try {
            PageContext pageContext = (PageContext) getJspContext();
            JspWriter out = pageContext.getOut();
            int nextNumOfContent = numOfContent + 1;
            out.println("<section id=\"" + numOfContents[numOfContent] + "\" class=\"wrapper post bg-img\" data-bg=\"bg" + (numOfContent + 1) + ".jpg\">\n"
                    + "    <div class=\"inner\">\n"
                    + "        <article class=\"box\">\n"
                    + "            <header style=\"text-align: left;\">\n"
                    + "                <div style=\"display: table; width: 100%; height: 100%;\">\n"
                    + "                    <sup style=\"font-size: 30px; display: table-cell; vertical-align: middle;\"><i class=\"fas fa-star\" style=\"color: #fffa86;\"></i></sup>\n"
                    + "                    <h2 style=\"color: #fc583f; display: table-cell; vertical-align: middle;\">" + area + "</h2>\n"
                    + "                    <a href=\"Detail.jsp\" class=\"button alt fit\" style=\"float: right; display: table-cell; vertical-align: middle;\">Find More</a>\n"
                    + "                </div>\n"
                    + "            </header>\n"
                    + "            <hr style=\"margin: 1.4rem 0;\">\n"
                    + "            <div class=\"content\">\n"
                    + "                <h2>" + name + "</h2>\n"
                    + "                <p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>\n"
                    + "            </div>\n"
                    + "            <footer>\n"
                    + "                <a href=\"generic.html\" class=\"button alt\">More Detail</a>\n"
                    + "            </footer>\n"
                    + "        </article>\n"
                    + "    </div>\n");
            if (nextNumOfContent < numOfContents.length) {
                out.println("<a href=\"#"  + numOfContents[nextNumOfContent] + "\" class=\"more\">Learn More</a>\n");
            }
            out.println("</section>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
