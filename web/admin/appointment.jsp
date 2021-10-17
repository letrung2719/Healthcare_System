<%-- 
    Document   : admin-ServiceDashboard
    Created on : 08-10-2021, 17:05:04
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/patient-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Appointmnent Page</title>

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">

        <!-- Datatables CSS -->
        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

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
            <jsp:include page="index-header.jsp"/>
            <!-- /Header -->

            <!-- Sidebar -->
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">
                                <span>Main</span>
                            </li>
                            <li >
                                <a href="index.jsp"><i class="fe fe-home"></i> <span>Dashboard</span></a>
                            </li>
                            <li>
                                <a href="profile.html"><i class="fe fe-user-plus"></i> <span>Profile</span></a>
                            </li>
                            <li class="active">
                                <a href="appoint"><i class="fe fe-layout"></i> <span>Appointments</span></a>
                            </li>
                            <li>
                                <a href="doctor_list"><i class="fe fe-user-plus"></i> <span>Doctors</span></a>
                            </li>
                            <li >
                                <a href="patient_list"><i class="fe fe-user"></i> <span>Patients</span></a>
                            </li>
                            <li >
                                <a href="review"><i class="fe fe-star-o"></i> <span>Reviews</span></a>
                            </li>
                            <li>
                                <a href="transactions-list.html"><i class="fe fe-activity"></i> <span>Transactions</span></a>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fe fe-document"></i> <span> Reports</span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="invoice-report.html">Invoice Reports</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>


            <!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="page-title">Reviews</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="review">Reviews</a></li>
                                    <li class="breadcrumb-item active">Service Feedbacks</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="datatable table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th style="padding-right: 15px">Appointment ID</th>
                                                    <th style="margin-right: 30px; padding-right: 165px">Doctor Name</th>
                                                    <th style="margin-right: 30px; padding-right: 165px">Patient Name</th>
                                                    <th >Apointment Time</th>
                                                    <th style="margin-right: 40px; padding-right: 165px">Description</th>
                                                    <th>Status</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${ListA}" var="o">
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
                                                        <td>${o.date} <span class="text-primary d-block">${o.slot.time}</span></td>
                                                        <td>
                                                            <p>${o.description}</p>
                                                        </td>
                                                        <td>
                                                            <div class="table-avatar">
                                                                <c:if test="${o.status == '0'}">
                                                                    <button type="button" class="btn btn-success">Successed</button>

                                                                </c:if>
                                                                <c:if test="${o.status == '1'}">
                                                                    <button type="button" class="btn btn-danger">cancelled</button>

                                                                </c:if>
                                                                <c:if test="${o.status == '2'}">
                                                                    <button type="button" class="btn btn-warning">Processing</button>
                                                                </c:if>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>			
                    </div>

                </div>			
            </div>
            <!-- /Page Wrapper -->

            <!-- jQuery -->
            <script src="assets/js/jquery-3.2.1.min.js "></script>

            <!-- Bootstrap Core JS -->
            <script src="assets/js/popper.min.js "></script>
            <script src="assets/js/bootstrap.min.js "></script>

            <!-- Slimscroll JS -->
            <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js "></script>

            <!-- Datatables JS -->
            <script src="assets/plugins/datatables/jquery.dataTables.min.js "></script>
            <script src="assets/plugins/datatables/datatables.min.js "></script>

            <!-- Custom JS -->
            <script src="assets/js/script.js "></script>

    </body>

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/patient-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:52 GMT -->

</html>
