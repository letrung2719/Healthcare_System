<%-- 
    Document   : patient_dashboard
    Created on : Nov 1, 2021, 11:47:36 AM
    Author     : admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Profile Settings</title>
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

        <!-- Datetimepicker CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css" />

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
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="index.jsp">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Profile Settings
                                    </li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Profile Settings</h2>
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
                                            <img
                                                src="${sessionScope.user.image}"
                                                alt="User Image"
                                                />
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>${sessionScope.user.name}</h3>
                                            <div class="patient-details">
                                                <h5><i class="fas fa-birthday-cake"></i> ${sessionScope.user.dob}</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li class="active">
                                                <a href="patient_profile_dashboard?id=${sessionScope.user.patientID}">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Dashboard</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fas fa-bookmark"></i>
                                                    <span>Favourites</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="patient_profile?id=${sessionScope.user.accountID}">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="reservationHistory?id=${sessionScope.user.patientID}">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Services Booking History</span>
                                                </a>
                                            </li>
                                            <li>
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
                            <div class="appointments">
                                <div class="card card-table mb-0">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="datatable table table-hover table-center mb-0 "> 
                                                <thead>
                                                    <tr>
                                                        <th>Apt.ID</th>
                                                        <th>Doctor</th>
                                                        <th>Appt Date</th>
                                                        <th>Status</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listApp}" var="app">
                                                        <tr>
                                                            <td>#APT${app.appointmentID}</td>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="javascript:void(0)" class="avatar avatar-sm mr-2">
                                                                        <img class="avatar-img rounded-circle" src="${app.patient.image}" alt="">
                                                                    </a>
                                                                    <a href="">${app.doctor.name}<span>#APT ${app.doctor.doctorID}</span></a>
                                                                </h2>
                                                            </td>

                                                            <td>${app.date}<span class="d-block text-info">${app.slot.time}</span></td>

                                                            <td>
                                                                <c:if test="${app.status == 1}">
                                                                    <span class="badge badge-pill bg-warning-light">
                                                                        Pending
                                                                    </span>
                                                                </c:if>
                                                                <c:if test="${app.status == 2}">
                                                                    <span class="badge badge-pill bg-success-light">
                                                                        Complete
                                                                    </span>
                                                                </c:if>
                                                                <c:if test="${app.status == 0}">
                                                                    <span class="badge badge-pill bg-danger-light">
                                                                        Cancel
                                                                    </span>
                                                                </c:if>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <div class="load-more text-center">
                                                <ul class="pagination">
                                                    <li class="page-item ">
                                                        <a class="page-link" href="patient_profile_dashboard?id=${sessionScope.user.patientID}&page=${page-1}">Previous</a>
                                                    </li>
                                                    <c:set var="page" value="${requestScope.indexPage}"/>
                                                    <c:forEach begin="1" end="${numberOfPage}" var="i">
                                                        <li class="page-item ${page==i?"active":""}"><a class="page-link"  href="patient_profile_dashboard?id=${sessionScope.user.patientID}&page=${i}">${i}</a></li>
                                                        </c:forEach>

                                                    <li class="page-item">
                                                        <a class="page-link" href="patient_profile_dashboard?id=${sessionScope.user.patientID}&page=${page+1}">Next</a>
                                                    </li>
                                                </ul>	
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                           
                            <!-- /Profile Sidebar -->

                        </div>
                    </div>
                </div>

                <!--Footer-->
                <%@include file="index-footer.jsp" %>
                <!--Footer-->
            </div>

            <!-- jQuery -->
            <script src="assets/js/jquery.min.js"></script>

            <!-- Bootstrap Core JS -->
            <script src="assets/js/popper.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>

            <!-- Select2 JS -->
            <script src="assets/plugins/select2/js/select2.min.js"></script>

            <!-- Datetimepicker JS -->
            <script src="assets/js/moment.min.js"></script>
            <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

            <!-- Sticky Sidebar JS -->
            <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
            <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

            <!-- Custom JS -->
            <script src="assets/js/script.js"></script>
    </body>
</html>
