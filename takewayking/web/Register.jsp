<%-- 
    Document   : Register
    Created on : Jan 11, 2019, 4:49:11 AM
    Author     : user
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
        <style>
            .message-box{
                display: none;
                margin: 0px 0px 30px 0px;
                padding: 10px;
                border: none;
                border-radius: 5px;
                background: white;
            }

            .message-box-error{
                background: #dd4848;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    </head>
    <body>

        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth">

                    <div class="row w-100">
                        <div class="col-lg-4 mx-auto">
                            <div class="auth-form-light text-left p-5">
                                <div class="message-box"></div>
                                <h4>Please sign up</h4>
                                <%
                                    if (request.getAttribute("isSuccess") != null) {
                                        boolean isSuccess = ((Boolean) request.getAttribute("isSuccess")).booleanValue();
                                        if (!isSuccess) {%>
                                <script>
                                    $(".message-box").addClass("message-box-error")
                                            .removeClass("message-box-alert")
                                            .text("Your email has been already sign up!")
                                            .show(300)
                                            .delay(2000)
                                            .hide(300);
                                </script>
                                <% }
                                    };
                                %>
                                <form id="login" class="pt-3" method="post" action="login">
                                    <input type="hidden" name="action" value="register"/>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-lg" id="exampleInputName1" name="name" placeholder="Your Name" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-lg" id="exampleInputEmail1" name="email" placeholder="Your Email" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" name="password" placeholder="Your Password" required>
                                    </div>
                                    <div class="mt-3">
                                        <input class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="SIGN UP"/>
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
