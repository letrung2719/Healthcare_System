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
        <!--Star icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .checked {
                color: orange;
            }
        </style>
        <!--Star icon -->    
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
                            <div class="col">
                                <h3 class="page-title">Doctors Management</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-home">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Doctors</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="profile-header">
                                <div class="row align-items-center">
                                    <div class="col-auto profile-image">
                                        <img class="rounded-circle" alt="User Image" src="${doctor.image}">
                                    </div>
                                    <div class="col ml-md-n2 profile-user-info">
                                        <h4 class="user-name mb-0">${doctor.name}</h4>
                                        <h6 class="text-muted">${doctor.email}</h6>							
                                        <div class="about-text">${doctor.description}</div>
                                    </div>
                                    <div class="col-3 status-toggle">
                                        <form action="doctor_profile" method="post">
                                            <input type="hidden" value="${account.id}" name="account_id">
                                            <h5 class="card-title d-flex justify-content-between">Change Status</h5>
                                            <c:if test="${account.status == true}">
                                                <input type="checkbox" id="status" class="check" checked onchange="this.form.submit()">
                                            </c:if>
                                            <c:if test="${account.status == false}">
                                                <input type="checkbox" id="status" class="check" unchecked onchange="this.form.submit()">
                                            </c:if>
                                            <label for="status" class="checktoggle" style="margin-left: 71px"></label>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-menu">
                                <ul class="nav nav-tabs nav-tabs-solid">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#per_details_tab">About</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#password_tab">Appointments</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#feedback_tab">Feedbacks</a>
                                    </li>
                                </ul>
                            </div>	
                            <div class="tab-content profile-tab-cont">

                                <!-- Personal Details Tab -->
                                <div class="tab-pane fade show active" id="per_details_tab">

                                    <!-- Personal Details -->
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-body">		
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Name</p>
                                                        <p class="col-sm-10">${doctor.name}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Gender</p>
                                                        <c:if test="${doctor.gender == 1}">
                                                            <p class="col-sm-10">Male</p>
                                                        </c:if>
                                                        <c:if test="${doctor.gender == 0}">
                                                            <p class="col-sm-10">Female</p>
                                                        </c:if>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Date of Birth</p>
                                                        <fmt:parseDate var="p_date" value="${doctor.dob}" pattern="yyyy-MM-dd"/>
                                                        <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                        <p class="col-sm-10">${date}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Phone</p>
                                                        <p class="col-sm-10">${doctor.phone}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Email</p>
                                                        <p class="col-sm-10">${doctor.email}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Status</p>
                                                        <c:if test="${account.status == true}">
                                                            <span class="badge badge-pill bg-success inv-badge" id="status">Active</span>
                                                        </c:if>
                                                        <c:if test="${account.status == false}">
                                                            <span class="badge badge-pill bg-danger inv-badge" id="status">Deactive</span>
                                                        </c:if>
                                                    </div>
                                                    <style>
                                                        #status{
                                                            margin-left: 15px;
                                                            height: 20px;
                                                            text-align: center;
                                                        }
                                                    </style>
                                                </div>
                                            </div>																					
                                        </div>									
                                    </div>
                                    <!-- /Personal Details -->
                                </div>
                                <!-- /Personal Details Tab -->

                                <!-- Change Password Tab -->
                                <div id="password_tab" class="tab-pane fade">

                                    <div class="card">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-center mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th>Apt.ID</th>
                                                            <th>Patient</th>
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
                                                                        <a href="">${app.patient.name}<span>#APT ${app.patient.patientID}</span></a>
                                                                    </h2>
                                                                </td>
                                                                <fmt:parseDate var="p_date" value="${app.date}" pattern="yyyy-MM-dd"/>
                                                                <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                                <td>${date}<span class="d-block text-info">${app.slot.time}</span></td>

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

                                                                </td>

                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Change Password Tab -->

                                </div>
                                <div id="feedback_tab" class="tab-pane fade">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-center mb-0">
                                                    <thead>
                                                        <tr>

                                                            <th>Patient</th>
                                                            <th>Email</th>
                                                            <th>Rate</th>
                                                            <th>Feedback</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listFb}" var="fb">
                                                            <tr>

                                                                <td>
                                                                    <h2 class="table-avatar">
                                                                        <a href="javascript:void(0)" class="avatar avatar-sm mr-2">
                                                                            <img class="avatar-img rounded-circle" src="${fb.patient.image}" alt="">
                                                                        </a>
                                                                        <a href="">${fb.patient.name}<span></span></a>
                                                                    </h2>
                                                                </td> 
                                                                <td><span class="comment-date">${fb.patient.email}</span></td>
                                                                <td>
                                                                    ${fb.rate} <span class="fa fa-star checked"></span>
                                                                </td>
                                                                <td>
                                                                    ${fb.content}
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


    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:46 GMT -->
</html>