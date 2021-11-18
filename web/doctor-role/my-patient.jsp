<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                                    <li class="breadcrumb-item"><a href="doctor_profile?id=${sessionScope.user.accountID}">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">My Patients</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">My Patients</h2>
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
                                <div class="appointment-list">
                                    <c:forEach items="${patientlist}" var="p">
                                        <fmt:parseDate var="p_date1" value="${p.phone}" pattern="yyyy-MM-dd"/>
                                        <fmt:formatDate var="date1" value="${p_date1}" pattern="dd-MM-yyyy"/>
                                        
                                        <fmt:parseDate var="p_date2" value="${p.dob}" pattern="yyyy-MM-dd"/>
                                        <fmt:formatDate var="date2" value="${p_date2}" pattern="dd-MM-yyyy"/>
                                        <!-- Appointment List -->
                                        <div class="profile-info-widget" style="width: 50%; margin-bottom: 20px">
                                            <a href="patient-profile.html" class="booking-doc-img">
                                                <img src="${p.image}" alt="User Image">
                                            </a>
                                            <div class="profile-det-info">
                                                <h3><a href="my-patient-detail?doctorID=${sessionScope.user.doctorID}&&patientID=${p.patientID}"> ${p.name}</a></h3>
                                                <div class="patient-details">
                                                    <h5><b><i class="far fa-clock"></i></b>Last Booking:  ${date1}</h5>
                                                    <h5><b><i class="fas fa-map-marker-alt"></i></b>Date of birth:  ${date2}</h5>
                                                    <h5><b><i class="fas fa-envelope"></i></b>Email:  ${p.email}</h5>
                                                    <h5 class="mb-0"><b><i class="fas fa-phone"></i></b>Phone:  ${p.accountID}</h5>
                                                </div>
                                            </div>
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
