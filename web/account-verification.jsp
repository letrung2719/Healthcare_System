<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/forgot-password.html  30 Nov 2019 04:12:20 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Doccure</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.min.js"></script>
                <script src="assets/js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body class="account-page">

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <%@include file="index-header.jsp" %>
            <!-- /Header -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-8 offset-md-2">

                            <!-- Account Content -->
                            <div class="account-content">
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-md-7 col-lg-6 login-left">
                                        <img src="assets/img/login-banner.png" class="img-fluid" alt="Login Banner">	
                                    </div>
                                    <div class="col-md-12 col-lg-6 login-right">
                                        <p class="text-danger">${mess}</p>
                                        <div class="login-header">
                                            <h3>Account Verification</h3>
                                            <p class="small text-muted">Check your email and enter verification code</p>
                                        </div>

                                        <!-- Account Verification Form -->
                                        <form action="account_verification" method="get">
                                            <div class="form-group form-focus">
                                                <input type="text" class="form-control floating" id="code" name="send">
                                                <label class="focus-label">Code</label>
                                            </div>
                                            <button class="btn btn-primary btn-block btn-lg login-btn" type="submit">Confirm</button>
                                            <input type="hidden" name="name" value="${name}">
                                            <input type="hidden" name="gender" value="${gender}">
                                            <input type="hidden" name="phone" value="${phone}">
                                            <input type="hidden" name="email" value="${email}">
                                            <input type="hidden" name="user" value="${user}">
                                            <input type="hidden" name="pass" value="${pass}">
                                        </form>
                                        <!-- /Account Verification Form -->

                                    </div>
                                </div>
                            </div>
                            <!-- /Account Content -->

                        </div>
                    </div>

                </div>

            </div>		
            <!-- /Page Content -->

            <!-- Footer -->
            <%@include file="index-footer.jsp" %>
            <!-- /Footer -->

        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/forgot-password.html  30 Nov 2019 04:12:20 GMT -->
</html>