<%-- 
    Document   : 404-jsp
    Created on : Oct 16, 2021, 5:50:16 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Error 404</title>

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.min.js"></script>
                <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <style>
            .error-page {
                align-items: center;
                color: #1f1f1f;
                display: flex;
            }
            .error-page .main-wrapper {
                display: flex;
                flex-wrap: wrap;
                height: auto;
                justify-content: center;
                width: 100%;
                min-height: unset;
            }
            .error-box {
                margin: 0 auto;
                max-width: 480px;
                padding: 1.875rem 0;
                text-align: center;
                width: 100%;
            }
            .error-box h1 {
                color: #00d0f1;
                font-size: 10em;
            }
            .error-box p {
                margin-bottom: 1.875rem;
            }
            .error-box .btn {
                border-radius: 50px;
                font-size: 18px;
                font-weight: 600;
                min-width: 200px;
                padding: 10px 20px;
            }
            .btn-primary {
                background-color: #00d0f1;
                border: 1px solid #00d0f1;
            }
            .btn-primary:hover,
            .btn-primary:focus,
            .btn-primary.active,
            .btn-primary:active,
            .open > .dropdown-toggle.btn-primary {
                background-color: #19c1dc;
                border: 1px solid #19c1dc;
            }
            .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
                color: #fff;
                background-color: #00d0f1;
            }
            .btn-primary.active.focus,
            .btn-primary.active:focus,
            .btn-primary.active:hover,
            .btn-primary.focus:active,
            .btn-primary:active:focus,
            .btn-primary:active:hover,
            .open > .dropdown-toggle.btn-primary.focus,
            .open > .dropdown-toggle.btn-primary:focus,
            .open > .dropdown-toggle.btn-primary:hover {
                background-color: #19c1dc;
                border: 1px solid #19c1dc;
            }
            .btn-primary.active:not(:disabled):not(.disabled),
            .btn-primary:active:not(:disabled):not(.disabled),
            .show > .btn-primary.dropdown-toggle {
                background-color: #19c1dc;
                border-color: #19c1dc;
                color: #fff;
            }
            .btn-primary.active:focus:not(:disabled):not(.disabled), 
            .btn-primary:active:focus:not(:disabled):not(.disabled), 
            .show > .btn-primary.dropdown-toggle:focus {
                box-shadow: unset;
            }
            .btn-primary.disabled, .btn-primary:disabled {
                background-color: #00d0f1;
                border-color: #00d0f1;
                color: #fff;
            }
        </style>
    </head>
    <body class="error-page">

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <div class="error-box">
                <h1>404</h1>
                <h3 class="h2 mb-3">Oops! Page not found!</h3>
                <p class="h4 font-weight-normal">The page you requested was not found.</p>
                <a href="/Healthcare_System/home" class="btn btn-primary">Back to Home</a>
            </div>

        </div>
        <!-- /Main Wrapper -->

    </body>

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/error-404.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:53 GMT -->
</html>
