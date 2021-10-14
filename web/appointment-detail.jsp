<%-- 
    Document   : appointment-detail
    Created on : 14-Oct-2021, 20:02:44
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/blank-page.html  30 Nov 2019 04:12:20 GMT -->
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
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Appointment Details</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Appointment Details</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div style="display: flex">
                                <div class="col-md-6 col-lg-4 col-xl-3 theiaStickySidebar">

                                    <!-- Profile Sidebar -->
                                    <div class="profile-sidebar">
                                        <div class="widget-profile pro-widget-content">
                                            <div class="profile-info-widget">
                                                <a href="#" class="booking-doc-img">
                                                    <img src="assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
                                                </a>
                                                <div class="profile-det-info">
                                                    <h3>Dr. Darren Elder</h3>

                                                    <div class="patient-details">
                                                        <h5 class="mb-0">BDS, MDS - Oral & Maxillofacial Surgery</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-widget">
                                            <nav class="dashboard-menu">
                                                <ul>

                                                    <li class="active">
                                                        <a href="appointments.html">
                                                            <i class="fas fa-calendar-check"></i>
                                                            <span>Appointments</span>
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="reviews.html">
                                                            <i class="fas fa-star"></i>
                                                            <span>Reviews</span>
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="doctor-profile-settings.html">
                                                            <i class="fas fa-user-cog"></i>
                                                            <span>Profile Settings</span>
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="doctor-change-password.html">
                                                            <i class="fas fa-lock"></i>
                                                            <span>Change Password</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="index-2.html">
                                                            <i class="fas fa-sign-out-alt"></i>
                                                            <span>Logout</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                    <!-- /Profile Sidebar -->

                                </div>
                                <div class="col-md-7 col-lg-8 col-xl-9">
                                    <div class="card">

                                        <div class="card-body">
                                            <h5 class=" d-flex justify-content-between">
                                                <span class="card-title">Appointment Details</span> 
                                            </h5>
                                            <div class="row">
                                                <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Appointment ID</p>
                                                <p class="col-sm-10">John Doe</p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Patient Name</p>
                                                <p class="col-sm-10">John Doe</p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Patient Email</p>
                                                <p class="col-sm-10">24 Jul 1983</p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Patient Phone number</p>
                                                <p class="col-sm-10">johndoe@example.com</p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Date</p>
                                                <p class="col-sm-10">305-310-5857</p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-2 text-muted text-sm-right mb-0">Description</p>
                                                <p> gfhasjhdgasdhbgqwihcb asndvhjwavdbkasjbfjashb k hdasg fhjqwgf tuy dgjfq eu csqfudyqwvdjsgaudhas</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

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

    <!-- doccure/blank-page.html  30 Nov 2019 04:12:20 GMT -->
</html>