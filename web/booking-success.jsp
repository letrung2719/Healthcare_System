<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/  30 Nov 2019 04:11:34 GMT -->
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure</title>

        <!-- Favicons -->
        <link type="image/x-icon" href="assets/img/favicon.png" rel="icon">

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
    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <%@include file="index-header.jsp" %>
            <!-- /Header -->

            <!-- Page Content -->
            <div class="content success-page-cont">
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <!-- Success Card -->
                            <div class="card success-card">
                                <div class="card-body">
                                    <div class="success-cont">
                                        <i class="fas fa-check"></i>
                                        <h3>Appointment booked Successfully!</h3>
                                        <p>Appointment booked with <strong>Dr. ${appointment.doctor.name}</strong><br> on <strong>${appointment.slot.time} (${appointment.date})</strong></p>
                                        <a href="index.jsp" class="btn btn-primary view-inv-btn">Home</a>
                                    </div>
                                </div>
                            </div>
                            <!-- /Success Card -->
                        </div>
                    </div>

                </div>
            </div>		
            <!-- /Page Content -->

            <!-- Footer -->
            <%@include file="index-footer.jsp"%>
            <!-- /Footer -->

        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Slick JS -->
        <script src="assets/js/slick.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/  30 Nov 2019 04:11:53 GMT -->
</html>
