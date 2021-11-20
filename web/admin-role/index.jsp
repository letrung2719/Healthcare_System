<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.DoctorFeedbacks"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dal.DoctorFeedbacksDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure Admin</title>

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">

        <link rel="stylesheet" href="assets/plugins/morris/morris.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

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
            <!-- Sidebar -->
            <%@include file="index-sidebar.jsp" %>
            <!-- /Sidebar -->


            <!-- Page Wrapper -->
            <div class="page-wrapper">

                <div class="content container-fluid">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="page-title">Welcome Admin!</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->

                    <div class="row">
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <span class="dash-widget-icon text-primary border-primary">
                                            <i class="fe fe-users"></i>
                                        </span>
                                        <div class="dash-count">
                                            <h3>${doctorNumber}</h3>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">
                                        <h6 class="text-muted">Doctors</h6>
                                        <div class="progress progress-sm">
                                            <div class="progress-bar bg-primary w-50"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <span class="dash-widget-icon text-success">
                                            <i class="fe fe-credit-card"></i>
                                        </span>
                                        <div class="dash-count">
                                            <h3>${patientNumber}</h3>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">

                                        <h6 class="text-muted">Patients</h6>
                                        <div class="progress progress-sm">
                                            <div class="progress-bar bg-success w-50"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <span class="dash-widget-icon text-danger border-danger">
                                            <i class="fe fe-money"></i>
                                        </span>
                                        <div class="dash-count">
                                            <h3>${appointmentNumber}</h3>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">

                                        <h6 class="text-muted">Appointment</h6>
                                        <div class="progress progress-sm">
                                            <div class="progress-bar bg-danger w-50"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="dash-widget-header">
                                        <span class="dash-widget-icon text-warning border-warning">
                                            <i class="fe fe-folder"></i>
                                        </span>
                                        <div class="dash-count">
                                            <h3>${moneyNumber}</h3>
                                        </div>
                                    </div>
                                    <div class="dash-widget-info">

                                        <h6 class="text-muted">Revenue</h6>
                                        <div class="progress progress-sm">
                                            <div class="progress-bar bg-warning w-50"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 d-flex">

                            <!-- Recent Orders -->
                            <div class="card card-table flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Doctors List</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Doctor Name</th>
                                                    <th>Specialities</th>
                                                    <th>Reviews</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${doctorHomeAdmin}" var="o">
                                                    <c:set var="feedbackDB" value="<%=new DoctorFeedbacksDAO()%>"></c:set>
                                                    <c:set var="avgrate" value="${feedbackDB.getAverageRating(o.doctorID)}"></c:set>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${o.image}" alt="User Image"></a>
                                                                <a>${o.name}</a>
                                                            </h2>
                                                        </td>
                                                        <td>${o.spec.name}</td>
                                                        <td>
                                                            <i class="fe ${avgrate > 0 ? "fe-star text-warning" : "fe-star-o text-secondary"}"></i>
                                                            <i class="fe ${avgrate > 1 ? "fe-star text-warning" : "fe-star-o text-secondary"}"></i>
                                                            <i class="fe ${avgrate > 2 ? "fe-star text-warning" : "fe-star-o text-secondary"}"></i>
                                                            <i class="fe ${avgrate > 3 ? "fe-star text-warning" : "fe-star-o text-secondary"}"></i>
                                                            <i class="fe ${avgrate > 4 ? "fe-star text-warning" : "fe-star-o text-secondary"}"></i>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div style="text-align: center">
                                        <b><a style="color: aqua;" href="/Healthcare_System/admin-role/doctor_list">See more...</a></b>
                                    </div>
                                </div>
                            </div>
                            <!-- /Recent Orders -->

                        </div>
                        <div class="col-md-6 d-flex">

                            <!-- Feed Activity -->
                            <div class="card  card-table flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Patients List</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Patient Name</th>
                                                    <th>Phone</th>
                                                    <th>Email</th>
                                                    <th>Paid</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${patientHomeAdmin}" var="o">
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${o.image}" alt="User Image"></a>
                                                                <a>${o.name}</a>
                                                            </h2>
                                                        </td>
                                                        <td>${o.phone}</td>
                                                        <td>${o.email}</td>
                                                        <td class="text-right">${o.accountID}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div style="text-align: center">
                                        <b><a style="color: aqua;" href="/Healthcare_System/admin-role/patient_list">See more...</a></b>
                                    </div>
                                </div>
                            </div>
                            <!-- /Feed Activity -->

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                            <!-- Recent Orders -->
                            <div class="card card-table">
                                <div class="card-header">
                                    <h4 class="card-title">Appointment List</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th style="width: 180px">Appointment ID</th>
                                                    <th style="width: 230px">Doctor Name</th>
                                                    <th style="width: 190px">Patient Name</th>
                                                    <th style="width: 250px;text-align: center">Appointment Time</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listA}" var="o">
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                ${o.appointmentID}
                                                            </h2>
                                                        </td>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <div class="avatar avatar-sm mr-2">
                                                                    <img class="avatar-img rounded-circle" src="${o.patient.image}" alt="Patient Image">
                                                                    ${o.patient.name}
                                                                </div>

                                                            </h2>
                                                        </td>

                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <div class="avatar avatar-sm mr-2">
                                                                    <img class="avatar-img rounded-circle" src="${o.doctor.image}" alt="Doctor Image">
                                                                    ${o.doctor.name}
                                                                </div>
                                                            </h2>
                                                        </td>
                                                        <fmt:parseDate var="p_date" value="${o.date}" pattern="yyyy-MM-dd"/>
                                                        <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                        <td style="text-align: center">${date} <span class="text-primary d-block">${o.slot.time}</span></td>
                                                        <td>
                                                            <div class="table-avatar">
                                                                <c:if test="${o.status == '0'}">
                                                                    <span class="badge badge-pill bg-danger inv-badge">Canceled</span>
                                                                </c:if>
                                                                <c:if test="${o.status == '1'}">
                                                                    <span class="badge badge-pill bg-warning inv-badge">Pending</span>
                                                                </c:if>
                                                                <c:if test="${o.status == '2'}">
                                                                    <span class="badge badge-pill bg-success inv-badge">Completed</span>
                                                                </c:if>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div style="text-align: center">
                                            <b><a style="color: aqua;" href="/Healthcare_System/admin-role/appoint">See more...</a></b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Recent Orders -->

                        </div>
                    </div>

                </div>
            </div>
            <!-- /Page Wrapper -->

        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script src="assets/js/jquery-3.2.1.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Slimscroll JS -->
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assets/plugins/raphael/raphael.min.js"></script>
        <script src="assets/plugins/morris/morris.min.js"></script>
        <script src="assets/js/chart.morris.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:34 GMT -->

</html>