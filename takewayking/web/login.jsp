<%-- 
    Document   : login
    Created on : Nov 28, 2018, 4:09:26 PM
    Author     : stit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Takeaway King Login</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="./CMS/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="./CMS/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="./CMS/css/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="./CMS/images/favicon.png" />
    </head>
    <body>
        <%
            if (request.getAttribute("isValid") != null) {
                boolean isValid = ((Boolean) request.getAttribute("isValid")).booleanValue();
                if (!isValid) {
                    out.println("NO");
                    out.println(request.getAttribute("url").toString());
                    out.println(request.getAttribute("user").toString());
                    out.println(request.getAttribute("password").toString());
                } else {
                    out.println("yes");
                }
            };
        %>
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth">
                    <div class="row w-100">
                        <div class="col-lg-4 mx-auto">
                            <div class="auth-form-light text-left p-5">

                                <h4>Hello! let's get started</h4>

                                <form id="login" class="pt-3" method="post" action="login">
                                    <input type="hidden" name="action" value="login"/>
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-lg" id="exampleInputEmail1" name="email" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" name="password" placeholder="Password">
                                    </div>
                                    <div class="mt-3">
                                        <a class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" onclick="document.getElementById('login').submit()">SIGN IN</a>
                                    </div>
                                    <div class="my-2 d-flex justify-content-between align-items-center">
                                        <div class="form-check">
                                            <label class="form-check-label text-muted">
                                                <input type="checkbox" class="form-check-input">
                                                Keep me signed in
                                            </label>
                                        </div>
                                        <a href="#" class="auth-link text-black">Forgot password?</a>
                                    </div>

                                    <div class="text-center mt-4 font-weight-light">
                                        Don't have an account? <a href="register.html" class="text-primary">Create</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>

        <script src="./CMS/vendors/js/vendor.bundle.base.js"></script>
        <script src="./CMS/vendors/js/vendor.bundle.addons.js"></script>

        <script src="./CMS/js/off-canvas.js"></script>
        <script src="./CMS/js/misc.js"></script>
    </body>
</html>
