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
        <!--Star icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .checked {
                color: orange;
            }
        </style>
        <!--Star icon -->
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
                        <div class="row" style="display: flex;">
                            <div class="col-sm-12">
                                <h3 class="page-title">Services Management</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-home">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="">Services</a></li>
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
                                        <img style="width: 100%; height: 100%;" alt="User Image" src="${s.image}">
                                    </div>
                                    <div class="col ml-md-n2 profile-user-info">
                                        <h4 class="user-name mb-0">${s.title}</h4>
                                        <div class="about-text">${s.description}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-menu">
                                <ul class="nav nav-tabs nav-tabs-solid">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#per_details_tab">About</a>
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
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Title</p>
                                                        <p class="col-sm-10">${s.title}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Specialities</p>
                                                        <p class="col-sm-10">${s.type_id}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Price</p>
                                                        <p class="col-sm-10">${s.price}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Total Feedbacks</p>
                                                        <p class="col-sm-10">${totalfeedback}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3" style="margin-right:15px">Average Rate</p>
                                                        <i class="fe fe-star ${avrate > 0 ? "text-warning" : "text-secondary"}"></i>
                                                        <i class="fe fe-star ${avrate > 1 ? "text-warning" : "text-secondary"}"></i>
                                                        <i class="fe fe-star ${avrate > 2 ? "text-warning" : "text-secondary"}"></i>
                                                        <i class="fe fe-star ${avrate > 3 ? "text-warning" : "text-secondary"}"></i>
                                                        <i class="fe fe-star ${avrate > 4 ? "text-warning" : "text-secondary"}"></i>
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
                                                                        <a class="avatar avatar-sm mr-2">
                                                                            <img class="avatar-img rounded-circle" src="${fb.patient.image}" alt="">
                                                                        </a>
                                                                        <a href="">${fb.patient.name}<span></span></a>
                                                                    </h2>
                                                                </td> 
                                                                <td><span class="comment-date">${fb.patient.email}</span></td>
                                                                <td>
                                                                    <i class="fe fe-star ${fb.rate > 0 ? "text-warning" : "text-secondary"}"></i>
                                                                    <i class="fe fe-star ${fb.rate > 1 ? "text-warning" : "text-secondary"}"></i>
                                                                    <i class="fe fe-star ${fb.rate > 2 ? "text-warning" : "text-secondary"}"></i>
                                                                    <i class="fe fe-star ${fb.rate > 3 ? "text-warning" : "text-secondary"}"></i>
                                                                    <i class="fe fe-star ${fb.rate > 4 ? "text-warning" : "text-secondary"}"></i>
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
