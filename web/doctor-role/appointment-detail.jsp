<%-- 
    Document   : appointment-detail
    Created on : 14-Oct-2021, 20:02:44
    Author     : Admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <style>
            .row{
                margin-bottom: 10px;
            }
        </style>
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
                                    <li class="breadcrumb-item"><a href="doctor_profile?id=${sessionScope.user.accountID}">Home</a></li>
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
                                <!-- Profile Sidebar -->
                                <%@include file="doctor-sidebar.jsp" %>
                                <!-- /Profile Sidebar -->

                                <div class="col-md-7 col-lg-8 col-xl-9">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="d-flex justify-content-between">
                                                <span class="card-title">Appointment Details</span> 
                                                <div class="dropdown" id="change-status">
                                                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false"> Change Status </a>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item text-warning" href="appointmentDetailControl?id=${app.appointmentID}&status=pending">Pending</a>
                                                        <a class="dropdown-item text-success" href="appointmentDetailControl?id=${app.appointmentID}&status=complete">Completed</a>
                                                        <a class="dropdown-item text-danger" href="appointmentDetailControl?id=${app.appointmentID}&status=cancel">Cancel</a>
                                                    </div>
                                                </div>
                                                <style>
                                                    #change-status:hover{
                                                        cursor: pointer;
                                                    }
                                                </style>
                                            </h5>
                                            <div class="row">
                                                <h5 class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3 "> Appointment ID</h5>
                                                <p class="col-sm-10">#APT${app.appointmentID}</p>
                                            </div>
                                            <div class="row">
                                                <h5 class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Patient Name</h5>
                                                <p class="col-sm-10">${app.patient.name}</p>
                                            </div>
                                            <div class="row">
                                                <h5 class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Patient Email</h5>
                                                <p class="col-sm-10">${app.patient.email}</p>
                                            </div>
                                            <div class="row">
                                                <h5 class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Patient Phone</h5>
                                                <p class="col-sm-10">${app.patient.phone}</p>
                                            </div>
                                            <fmt:parseDate var="p_date" value="${app.date}" pattern="yyyy-MM-dd"/>
                                            <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                            <div class="row">
                                                <h5 class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Date</h5>
                                                <p class="col-sm-10">${date}</p>
                                            </div>
                                            <div class="row">
                                                <h5 class="col-sm-2 text-muted text-sm-right mb-0">Time</h5>
                                                <p class="col-sm-10 text-info">${app.slot.time}</p>
                                            </div>
                                            <div class="row">
                                                <h5 class="col-sm-2 text-muted text-sm-right mb-0">Description</h5>
                                                <textarea class="col-sm-9" readonly="" style="margin-left: 15px">${app.description}</textarea>
                                            </div>
                                            <div class="row" style="margin-top: 20px">
                                                <h5 class="col-sm-2 text-muted text-sm-right mb-0">Status</h5>
                                                <c:if test="${app.status == 1}">
                                                    <span class="badge badge-pill bg-warning-light">
                                                        Pending
                                                    </span>
                                                </c:if>
                                                <c:if test="${app.status == 2}">
                                                    <span class="badge badge-pill bg-success-light">
                                                        Completed
                                                    </span>
                                                </c:if>
                                                <c:if test="${app.status == 0}">
                                                    <span class="badge badge-pill bg-danger-light">
                                                        Cancel
                                                    </span>
                                                </c:if>
                                                <style>
                                                    .badge{
                                                        margin-left: 15px;
                                                    }
                                                </style>
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