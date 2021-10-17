<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- doccure/register.html  30 Nov 2019 04:12:20 GMT -->
    <head>
        <meta charset="utf-8" />
        <title>Doccure</title>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=0"
            />

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

        <!-- Fontawesome CSS -->
        <link
            rel="stylesheet"
            href="assets/plugins/fontawesome/css/fontawesome.min.css"
            />
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css" />

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css" />

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
            <jsp:include page="index-header.jsp"/>
            <!-- /Header -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8 offset-md-2">
                            <!-- Register Content -->
                            <div class="account-content">
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-md-7 col-lg-6 login-left">
                                        <img
                                            src="assets/img/login-banner.png"
                                            class="img-fluid"
                                            alt="Doccure Register"
                                            />
                                    </div>
                                    <div class="col-md-12 col-lg-6 login-right">
                                        <div class="login-header">
                                            <h3>
                                                Register a new account
                                            </h3>
                                        </div>

                                        <!-- Register Form -->
                                        <form action="signup" method="post">
                                            <p class="text-danger">${mess}</p>
                                            <div class="form-group form-focus">
                                                <input name="name" type="text" class="form-control floating" value="${name}" required=""/>
                                                <label class="focus-label">Your Name</label>
                                            </div>
                                            <div class="form-group ">
                                                <input type="radio" name="gender" value="1" ${gender == 1 ? "checked" : ""}> Male
                                                <input type="radio" name="gender" value="0" ${gender == 0 ? "checked" : ""} style="margin-left: 50px"> Female
                                            </div>
                                            <div class="form-group form-focus">
                                                <input name="email" type="text" class="form-control floating" value="${email}" required=""/>
                                                <label class="focus-label">Email</label>
                                            </div>
                                            <div class="form-group form-focus">
                                                <input name="phone" type="text" class="form-control floating" value="${phone}" required=""/>
                                                <label class="focus-label">Mobile Number</label>
                                            </div>
                                            <div class="form-group form-focus">
                                                <input name="user" type="text" class="form-control floating" value="${user}" required="" />
                                                <label class="focus-label">Username</label>
                                            </div>
                                            <div class="form-group form-focus">
                                                <input name="pass" type="password" class="form-control floating" required=""/>
                                                <label class="focus-label">Create Password</label>
                                            </div>
                                            <div class="form-group form-focus">
                                                <input name="repass" type="password" class="form-control floating" required=""/>
                                                <label class="focus-label">Confirm Password</label>
                                            </div>
                                            <div class="text-right">
                                                <a class="forgot-link" href="login" >Already have an account?</a>
                                            </div>
                                            <button class="btn btn-primary btn-block btn-lg login-btn" type="submit">
                                                Signup
                                            </button>
                                            <div class="login-or">
                                                <span class="or-line"></span>
                                                <span class="span-or">or</span>
                                            </div>
                                            <div class="row form-row social-login">
                                                <div class="col-6">
                                                    <a href="#" class="btn btn-facebook btn-block"
                                                       ><i class="fab fa-facebook-f mr-1"></i> Login</a
                                                    >
                                                </div>
                                                <div class="col-6">
                                                    <a href="#" class="btn btn-google btn-block"
                                                       ><i class="fab fa-google mr-1"></i> Login</a
                                                    >
                                                </div>
                                            </div>
                                        </form>
                                        <!-- /Register Form -->
                                    </div>
                                </div>
                            </div>
                            <!-- /Register Content -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="index-footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <!-- Custom JS -->
        <script src="js/script.js"></script>
    </body>

    <!-- doccure/register.html  30 Nov 2019 04:12:20 GMT -->
</html>

