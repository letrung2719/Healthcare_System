<%-- 
    Document   : admin-ServiceDashboard
    Created on : 08-10-2021, 17:05:04
    Author     : ASUS
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/patient-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Reservations Management</title>

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
        <style>
            tr:hover{
                cursor: pointer;
            } 
        </style>
    </head>

    <body>

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <%@include file="index-header.jsp" %>
            <!-- /Header -->

            <!-- Sidebar -->
            <%@include file="index-sidebar.jsp" %>
            <!-- Sidebar -->


            <!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="page-title">Reservation</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-home">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Reservations</li>
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
                                                    <th>ID</th>
                                                    <th>Patient Name</th>
                                                    <th>Service Name</th>
                                                    <th>Time</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${ListR}" var="o">
                                                    <tr onclick="location.href = 'reservation-detail?id=${o.reservationID}'">
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                ${o.reservationID}
                                                            </h2>
                                                        </td>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <div class="avatar avatar-sm mr-2">
                                                                    <img class="avatar-img rounded-circle" src="${o.patient.image}" alt="Patient Image">
                                                                    <a>${o.patient.name}</a>
                                                                </div>

                                                            </h2>
                                                        </td>

                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <div class="avatar avatar-sm mr-2">
                                                                    <img class="avatar-img rounded-circle" src="${o.service.image}" alt="Doctor Image">${o.service.title}
                                                                </div>
                                                            </h2>
                                                        </td>
                                                        <fmt:parseDate var="p_date" value="${o.date}" pattern="yyyy-MM-dd"/>
                                                        <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                        <td>${date} <span class="text-primary d-block">${o.slot.time}</span></td>
                                                        <td>
                                                            <div class="table-avatar">
                                                                <c:if test="${o.status == '0'}">
                                                                    <span class="badge badge-pill bg-danger inv-badge">Cancel</span>
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
</html>
