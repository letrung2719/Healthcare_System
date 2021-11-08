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
                                <h3 class="page-title">Reviews</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="">Appointments</a></li>
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
                                                    <th style="padding-right: 30px">Appointment ID</th>
                                                    <th style="margin-right: 30px; padding-right: 130px">Patient Name</th>
                                                    <th style="margin-right: 30px; padding-right: 140px">Doctor Name</th>
                                                    <th >Appointment Time</th>
                                                    <th style="margin-right: 40px; padding-right: 140px">Description</th>
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
                                                                    <button type="button" class="btn btn-danger">Canceled</button>

                                                                </c:if>
                                                                <c:if test="${o.status == '1'}">
                                                                    <button type="button" class="btn btn-warning">Processing</button>

                                                                </c:if>
                                                                <c:if test="${o.status == '2'}">
                                                                    <button type="button" class="btn btn-success">Success</button>
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
