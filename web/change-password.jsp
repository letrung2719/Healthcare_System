
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/change-password.html  30 Nov 2019 04:12:18 GMT -->
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
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Change Password</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Change Password</h2>
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
                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                            <div class="profile-sidebar">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="patient_profile?id=${sessionScope.user.accountID}" class="booking-doc-img">
                                            <img src="${sessionScope.user.image}" alt="User Image"/>
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>${sessionScope.user.name}</h3>
                                            <fmt:parseDate var="p_date" value="${sessionScope.user.dob}" pattern="yyyy-MM-dd"/>
                                            <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                            <div class="patient-details">
                                                <h5><i class="fas fa-birthday-cake"></i> ${date}</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li>
                                                <a href="patient_profile?id=${sessionScope.user.accountID}">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="appointment-history?id=${sessionScope.user.patientID}">
                                                    <i class="fas fa-calendar-check"></i>
                                                    <span>Appointment History</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="reservationHistory?id=${sessionScope.user.patientID}">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Reservation History</span>
                                                </a>
                                            </li>
                                            <li class="active">
                                                <a href="change-password.jsp">
                                                    <i class="fas fa-lock"></i>
                                                    <span>Change Password</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="logout">
                                                    <i class="fas fa-sign-out-alt"></i>
                                                    <span>Logout</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <!-- /Profile Sidebar -->

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-6">
                                            <p class="text-danger">${mess}</p>
                                            <p class="text-success">${success}</p>
                                            <!-- Change Password Form -->
                                            <form action="change_password" method="post">
                                                <div class="form-group">
                                                    <label>Old Password <span class="text-danger">*</span></label>
                                                    <input type="password" class="form-control" name="oldPassword" value="${oldPassword}" required="">
                                                </div>
                                                <div class="form-group">
                                                    <label>New Password <span class="text-danger">*</span></label>
                                                    <input type="password" class="form-control" name="newPassword" value="${newPassword}" required="">
                                                </div>
                                                <div class="form-group">
                                                    <label>Confirm Password <span class="text-danger">*</span></label>
                                                    <input type="password" class="form-control" name="confirmPassword"  value="${confirmPassword}" required="">
                                                </div>
                                                <div class="submit-section">
                                                    <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                                                </div>
                                            </form>
                                            <!-- /Change Password Form -->
                                        </div>
                                        <div class="col-md-12 col-lg-6" style="margin-top: 20px">
                                            <p class="mb-2">Password requirements</p>
                                            <p class="small text-muted mb-2">To create a new password, you have to meet all of the following requirements:</p>
                                            <ul class="small text-muted pl-4 mb-0">
                                                <li>At least 6 characters</li>
                                                <li>At least upper-case letter</li>
                                                <li>At least one number</li>
                                            </ul>
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

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/change-password.html  30 Nov 2019 04:12:18 GMT -->
</html>