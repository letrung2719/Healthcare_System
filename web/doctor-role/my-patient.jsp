<%-- 
    Document   : my-patient
    Created on : Oct 31, 2021, 8:55:47 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- doccure/reviews.html  30 Nov 2019 04:12:15 GMT -->
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
        <!-- Select2 CSS -->
        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">
        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css" />

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
                        <div class="col-md-8 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Feedbacks</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Feedbacks</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">

                        <!-- Profile Sidebar -->
                        <%@include file="doctor-sidebar.jsp" %>
                        <!-- /Profile Sidebar -->

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="appointments">
                                <c:forEach items="${patientlist}" var="p">
                                    <!-- Appointment List -->
                                    <div class="appointment-list">
                                        <div class="profile-info-widget">
                                            <a href="patient-profile.html" class="booking-doc-img">
                                                <img src="${p.image}" alt="User Image">
                                            </a>
                                            <div class="profile-det-info">
                                                <h3><a href="patient-profile.html"> ${p.name}</a></h3>
                                                <div class="patient-details">
                                                    <h5><i class="far fa-clock"></i> ${p.gender == 0 ? 'Female' : 'Male'}</h5>
                                                    <h5><i class="fas fa-map-marker-alt"></i> ${p.dob}</h5>
                                                    <h5><i class="fas fa-envelope"></i> ${p.email}</h5>
                                                    <h5 class="mb-0"><i class="fas fa-phone"></i> ${p.phone}</h5>
                                                </div>
                                            </div>
                                        </div>
<!--                                        <div class="appointment-action">
                                            <a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#appt_details">
                                                <i class="far fa-eye"></i> View
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-sm bg-success-light">
                                                <i class="fas fa-check"></i> Accept
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
                                                <i class="fas fa-times"></i> Cancel
                                            </a>
                                        </div>-->
                                    </div>
                                    <!-- /Appointment List -->
                                </c:forEach>
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


        <!-- Select2 JS -->
        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>
    </body>

    <!-- doccure/reviews.html  30 Nov 2019 04:12:15 GMT -->
</html>
