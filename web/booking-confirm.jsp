<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

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

            <%@include file="index-header.jsp"%>

            <!-- Breadcrumb -->
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Checkout</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container">

                    <div class="row">
                        <div class="col-md-7 col-lg-8">
                            <div class="card">
                                <div class="card-body">

                                    <!-- Checkout Form -->
                                    <form action="booking_success" method="get">

                                        <!-- Personal Information -->
                                        <div class="info-widget">
                                            <h4 class="card-title">Personal Information</h4>
                                            <div class="row">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Full name</label>
                                                        <input class="form-control" type="text" readonly="" value="${sessionScope.user.name}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Gender</label>
                                                        <input class="form-control" type="text" readonly="" value="${sessionScope.user.gender == 1 ? "Male" : "Female"}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>DOB</label>
                                                        <input class="form-control" type="date" readonly="" value="${sessionScope.user.dob}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Email</label>
                                                        <input class="form-control" type="email" readonly="" value="${sessionScope.user.email}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group card-label">
                                                        <label>Phone</label>
                                                        <input class="form-control" type="text" readonly="" value="${sessionScope.user.phone}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="exist-customer">Change information? <a href="patient_profile?id=${sessionScope.acc.id}">Click here</a></div>
                                        </div>
                                        <!-- /Personal Information -->
                                        <input type="hidden" value="${appointment.patient.patientID}" name="patient_id">                                        
                                        <input type="hidden" value="${appointment.doctor.doctorID}" name="doctor_id">
                                        <input type="hidden" value="${appointment.date}" name="date">
                                        <input type="hidden" value="${appointment.slot.slotID}" name="slot_id">
                                        <input type="hidden" value="${appointment.description}" name="description">

                                        <!-- Submit Section -->
                                        <div class="submit-section mt-4">
                                            <button type="submit" class="btn btn-primary submit-btn">Confirm and Book</button>
                                        </div>
                                        <!-- /Submit Section -->

                                    </form>
                                    <!-- /Checkout Form -->

                                </div>
                            </div>

                        </div>

                        <div class="col-md-5 col-lg-4 theiaStickySidebar">

                            <!-- Booking Summary -->
                            <div class="card booking-card">
                                <div class="card-header">
                                    <h4 class="card-title">Booking Summary</h4>
                                </div>
                                <div class="card-body">

                                    <!-- Booking Doctor Info -->
                                    <div class="booking-doc-info">
                                        <a href="doctor-profile.html" class="booking-doc-img">
                                            <img src="assets/img/doctors/doctor-thumb-02.jpg" alt="User Image">
                                        </a>
                                        <div class="booking-info">
                                            <h4 class="doc-name">Dr. ${appointment.doctor.name}</h4>
                                            <p class="doc-speciality">${appointment.doctor.role}</p>
                                            <p class="doc-department"><img src="assets/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">${appointment.doctor.spec.name}</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">35</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Booking Doctor Info -->

                                    <div class="booking-summary">
                                        <div class="booking-item-wrap">
                                            <ul class="booking-date">
                                                <li>Date <span>${appointment.date}</span></li>
                                                <li>Time <span>${appointment.slot.time}</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Booking Summary -->
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

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/checkout.html  30 Nov 2019 04:12:16 GMT -->

</html>
