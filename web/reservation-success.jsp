<%-- 
    Document   : reservation-success
    Created on : 16-Oct-2021, 15:45:00
    Author     : Admin
--%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/booking-success.html  30 Nov 2019 04:12:16 GMT -->
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
    <body>

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <jsp:include page="index-header.jsp"/>
            <!-- /Header -->

            <!-- Breadcrumb -->
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">Service</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Reservation
                                    </li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Booking</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

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
                                        <h3>Reservation booked Successfully!</h3>
                                        <p>Reservation booked with <strong>${reservation.service.title} Service</strong><br> on <strong>${reservation.date} ${reservation.slot.time}</strong></p>
                                        <a href="#" class="btn btn-primary view-inv-btn">View Invoice</a>
                                        <a href="#" class="btn btn-primary view-inv-btn">Continue booking</a>
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
            <jsp:include page="index-footer.jsp"/>
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

    <!-- doccure/booking-success.html  30 Nov 2019 04:12:16 GMT -->
</html>