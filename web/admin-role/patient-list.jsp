<%@page import="model.Account"%>
<%@page import="dal.AccountDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/patient-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->

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
            <!-- /Sidebar -->

            <!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-7 col-auto">
                                <h3 class="page-title">Patients Management</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Patients</li>
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
                                        <div class="table-responsive">
                                            <table class="datatable table table-hover table-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>Patient ID</th>
                                                        <th>Patient Name</th>
                                                        <th>Gender</th>
                                                        <th>DOB</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listPatients}" var="user">
                                                        <c:set var="accountDb" value="<%=new AccountDAO()%>"></c:set>
                                                        <c:set var="acc" value="${accountDb.getAccountByID(user.accountID)}"></c:set>  
                                                            <tr>
                                                                <td>${user.patientID}</td>
                                                            <td> <!-- name-->
                                                                <h2 class="table-avatar">
                                                                    <a class="avatar avatar-sm mr-2" href=""><img class="avatar-img rounded-circle" src="${user.image}" alt="Patient Image"></a>
                                                                    <a href="patient_details?account_id=${user.accountID}">${user.name}</a>
                                                                </h2>
                                                            </td>
                                                            <td>
                                                                <c:if test="${user.gender == 1}">Male</c:if>
                                                                <c:if test="${user.gender == 0}">Female</c:if>
                                                                </td>
                                                            <fmt:parseDate var="p_date" value="${user.dob}" pattern="yyyy-MM-dd"/>
                                                            <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                            <td>${date}</td>
                                                            <td class="text-center">
                                                                <c:if test="${acc.status == true}">
                                                                    <span class="badge badge-pill bg-success inv-badge">Active</span>
                                                                </c:if>
                                                                <c:if test="${acc.status == false}">
                                                                    <span class="badge badge-pill bg-danger inv-badge">Deactive</span>
                                                                </c:if>
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

        </div>
        <!-- /Main Wrapper -->

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