<%-- 
    Document   : content
    Created on : Jan 7, 2019, 3:59:23 PM
    Author     : user
--%>
<%@taglib uri="/WEB-INF/tlds/tk-taglib" prefix="tk"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="takeaway.db.LocationDB"%>
<%@page import="takeaway.bean.Location"%>
<%@page import="takeaway.bean.Restaurant"%>
<%@page import="takeaway.db.RestaurantDB"%>

<%!
    private ArrayList<Location> locations = null;

    private String getArea(String district) {
        String area = "";
        for (Location location : locations) {
            if (location.getDistrict() == district) {
                area = location.getArea();
            }
        }
        return area;
    }

    private String getDistrict(String subdistrict) {
        String district = "";
        for (Location location : locations) {
            if (location.getSubdistrict() == subdistrict) {
                district = location.getDistrict();
            }
        }
        return district;
    }
%>
<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    LocationDB locationDb = new LocationDB(dbUrl, dbUser, dbPassword);
    locations = locationDb.queryLocation();
    ArrayList<String> areaList = new ArrayList<String>();
    ArrayList<String> districtList = new ArrayList<String>();
    ArrayList<String> subdistrictList = new ArrayList<String>();
    for (Location location : locations) {
        areaList.add(location.getArea());
        districtList.add(location.getDistrict());
        subdistrictList.add(location.getSubdistrict());
    }
    Set<String> areasSet = new HashSet<String>(areaList);
    Set<String> districtsSet = new HashSet<String>(districtList);
    Set<String> subdistrictsSet = new HashSet<String>(subdistrictList);
    String[] areas = areasSet.toArray(new String[areasSet.size()]);
    String[] districts = districtsSet.toArray(new String[districtsSet.size()]);
    String[] subdistricts = subdistrictsSet.toArray(new String[subdistrictsSet.size()]);
%>
<section id="banner" class="bg-img" data-bg="bg.jpg">
    <div class="inner">
        <header>
            <h1>Welcome to Takeaway King!</h1>
        </header>
    </div>
    <a href="#one" class="more">Learn More</a>
</section>

<%
    for (int i = 0; i < areas.length; i++) {%>
    <tk:content area="<%=areas[i]%>" numOfContent="<%=i%>"/>
<%}
%>

<!-- One 
<section id="one" class="wrapper post bg-img" data-bg="banner2.jpg">
    <div class="inner">
        <article class="box">
            <header>
                <h2 style="color: #fa5d1e;"><sup style="font-size: 30px;"><i class="fas fa-star" style="color: #fffa86;"></i></sup>The Best Restaurant in Hong Kong</h2><hr>
                <h2>Nibh non lobortis mus nibh</h2>
            </header>
            <div class="content">
                <p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>
            </div>
            <footer>
                <a href="generic.html" class="button alt">Learn More</a>
            </footer>
        </article>
    </div>
    <a href="#two" class="more">Learn More</a>
</section>

 Two 
<section id="two" class="wrapper post bg-img" data-bg="banner5.jpg">
    <div class="inner">
        <article class="box">
            <header style="text-align: left;">
                <div style="display: table; width: 100%; height: 100%;">
                    <sup style="font-size: 30px; display: table-cell; vertical-align: middle;"><i class="fas fa-star" style="color: #fffa86;"></i></sup>
                    <h2 style="color: #fc583f; display: table-cell; vertical-align: middle;">New Territories</h2>
                    <a href="generic.html" class="button alt fit" style="float: right; display: table-cell; vertical-align: middle;">Find More</a>
                </div>
            </header>
            <hr style="margin: 1.4rem 0;">
            <div class="content">
                <h2>Mus elit a ultricies at</h2>
                <p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>
            </div>
            <footer>
                <a href="generic.html" class="button alt">More Detail</a>
            </footer>
        </article>
    </div>
    <a href="#three" class="more">Learn More</a>
</section>

 Three 
<section id="three" class="wrapper post bg-img" data-bg="banner4.jpg">
    <div class="inner">
        <article class="box">
            <header style="text-align: left;">
                <h2 style="color: #fc583f;"><sup style="font-size: 30px;"><i class="fas fa-star" style="color: #fffa86;"></i></sup>Kowloon</h2><hr>
                <h2>Mus elit a ultricies at</h2>
            </header>
            <div class="content">
                <p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>
            </div>
            <footer>
                <a href="generic.html" class="button alt">Learn More</a>
            </footer>
        </article>
    </div>
    <a href="#four" class="more">Learn More</a>
</section>

 Four 
<section id="four" class="wrapper post bg-img" data-bg="banner3.jpg">
    <div class="inner">
        <article class="box">
            <header style="text-align: left;">
                <h2 style="color: #fc583f;"><sup style="float: left; font-size: 30px;"><i class="fas fa-star" style="color: #fffa86;"></i></sup>Hong Kong</h2><hr>
                <h2>Mus elit a ultricies at</h2>
            </header>
            <div class="content">
                <p>Scelerisque enim mi curae erat ultricies lobortis donec velit in per cum consectetur purus a enim platea vestibulum lacinia et elit ante scelerisque vestibulum. At urna condimentum sed vulputate a duis in senectus ullamcorper lacus cubilia consectetur odio proin sociosqu a parturient nam ac blandit praesent aptent. Eros dignissim mus mauris a natoque ad suspendisse nulla a urna in tincidunt tristique enim arcu litora scelerisque eros suspendisse.</p>
            </div>
            <footer>
                <a href="generic.html" class="button alt">Learn More</a>
            </footer>
        </article>
    </div>
</section>-->

