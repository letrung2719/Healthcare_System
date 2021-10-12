<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:46 GMT -->

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Profile</title>

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">

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
            <div class="header">

                <!-- Logo -->
                <div class="header-left">
                    <a href="index.html" class="logo">
                        <img src="assets/img/logo.png" alt="Logo">
                    </a>
                    <a href="index.html" class="logo logo-small">
                        <img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
                    </a>
                </div>
                <!-- /Logo -->

                <a href="javascript:void(0);" id="toggle_btn">
                    <i class="fe fe-text-align-left"></i>
                </a>

                <div class="top-nav-search">
                    <form>
                        <input type="text" class="form-control" placeholder="Search here">
                        <button class="btn" type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>

                <!-- Mobile Menu Toggle -->
                <a class="mobile_btn" id="mobile_btn">
                    <i class="fa fa-bars"></i>
                </a>
                <!-- /Mobile Menu Toggle -->

                <!-- Header Right Menu -->
                <ul class="nav user-menu">

                    <!-- Notifications -->
                    <li class="nav-item dropdown noti-dropdown">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            <i class="fe fe-bell"></i> <span class="badge badge-pill">3</span>
                        </a>
                        <div class="dropdown-menu notifications">
                            <div class="topnav-dropdown-header">
                                <span class="notification-title">Notifications</span>
                                <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                            </div>
                            <div class="noti-content">
                                <ul class="notification-list">
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/doctors/doctor-thumb-01.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Dr. Ruby Perrin</span> Schedule <span class="noti-title">her appointment</span></p>
                                                    <p class="noti-time"><span class="notification-time">4 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/patients/patient1.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Charlene Reed</span> has booked her appointment to <span class="noti-title">Dr. Ruby Perrin</span></p>
                                                    <p class="noti-time"><span class="notification-time">6 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/patients/patient2.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Travis Trimble</span> sent a amount of $210 for his <span class="noti-title">appointment</span></p>
                                                    <p class="noti-time"><span class="notification-time">8 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/patients/patient3.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Carl Kelly</span> send a message <span class="noti-title"> to his doctor</span></p>
                                                    <p class="noti-time"><span class="notification-time">12 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="topnav-dropdown-footer">
                                <a href="#">View all Notifications</a>
                            </div>
                        </div>
                    </li>
                    <!-- /Notifications -->

                    <!-- User Menu -->
                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            <span class="user-img"><img class="rounded-circle" src="assets/img/profiles/avatar-01.jpg" width="31" alt="Ryan Taylor"></span>
                        </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm">
                                    <img src="assets/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle">
                                </div>
                                <div class="user-text">
                                    <h6>Ryan Taylor</h6>
                                    <p class="text-muted mb-0">Administrator</p>
                                </div>
                            </div>
                            <a class="dropdown-item" href="profile.html">My Profile</a>
                            <a class="dropdown-item" href="settings.html">Settings</a>
                            <a class="dropdown-item" href="login.html">Logout</a>
                        </div>
                    </li>
                    <!-- /User Menu -->

                </ul>
                <!-- /Header Right Menu -->

            </div>
            <!-- /Header -->

            <!-- Sidebar -->
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">
                                <span>Main</span>
                            </li>
                            <li>
                                <a href="index.html"><i class="fe fe-home"></i> <span>Dashboard</span></a>
                            </li>
                            <li class="active">
                                <a href="profile.html"><i class="fe fe-user-plus"></i> <span>Profile</span></a>
                            </li>
                            <li>
                                <a href="appointment-list.html"><i class="fe fe-layout"></i> <span>Appointments</span></a>
                            </li>
                            <li>
                                <a href="specialities.html"><i class="fe fe-users"></i> <span>Specialities</span></a>
                            </li>
                            <li>
                                <a href="doctor-list.html"><i class="fe fe-user-plus"></i> <span>Doctors</span></a>
                            </li>
                            <li>
                                <a href="patient-list.html"><i class="fe fe-user"></i> <span>Patients</span></a>
                            </li>
                            <li>
                                <a href="reviews.html"><i class="fe fe-star-o"></i> <span>Reviews</span></a>
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
            <!-- /Sidebar -->

            <!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col">
                                <h3 class="page-title">Profile</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Profile</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->
                    <c:forEach items="${doctor}" var="doctor">  
                        <div class="row">
                            <div class="col-md-12">
                                <div class="profile-header">
                                    <div class="row align-items-center">
                                        <div class="col-auto profile-image">
                                            <a href="#">
                                                <img class="rounded-circle" alt="Doctor Image" src="assets/img/doctors/doctor-thumb-01.jpg">
                                            </a>
                                        </div>
                                        <div class="col ml-md-n2 profile-user-info">
                                            <h4 class="user-name mb-0">${doctor.name}</h4>
                                            <h6 class="text-muted">${doctor.email}}</h6>
                                            <div class="about-text">${doctor.description}</div>
                                        </div>
                                        <div class="col-auto profile-btn">

                                            <a href="edit_personal_details${doctor.doctorID}" class="btn btn-primary">Edit</a>


                                        </div>
                                    </div>
                                </div>
                                <div class="profile-menu">
                                    <ul class="nav nav-tabs nav-tabs-solid">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#per_details_tab">About</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#password_tab">Password</a>
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
                                                        <h5 class="card-title d-flex justify-content-between">
                                                            <span>Personal Details</span>
                                                            <a class="edit-link" data-toggle="modal" href="#edit_personal_details${doctor.doctorID}"><i class="fa fa-edit mr-1"></i>Edit</a>
                                                        </h5>

                                                        <div class="row">
                                                            <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Name</p>
                                                            <p class="col-sm-10">{doctor.name}</p>
                                                        </div>
                                                        <div class="row">
                                                            <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Date of Birth</p>
                                                            <p class="col-sm-10">{doctor.dob}</p>
                                                        </div>
                                                        <div class="row">
                                                            <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">DOB</p>
                                                            <p class="col-sm-10"><c:if test="${doctor.gender == 1}">Male</c:if>
                                                                <c:if test="${doctor.gender == 0}">Female</c:if></p>
                                                            </div>
                                                            <div class="row">
                                                                <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Role</p>
                                                                <p class="col-sm-10">{doctor.role}</p>
                                                            </div>
                                                            <div class="row">
                                                                <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Email ID</p>
                                                                <p class="col-sm-10">{doctor.email}</p>
                                                            </div>
                                                            <div class="row">
                                                                <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Mobile</p>
                                                                <p class="col-sm-10">{doctor.phone}</p>
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <!-- Edit Details Modal -->
                                                    <div class="modal fade" id="edit_personal_details${doctor.doctorID}" aria-hidden="true" role="dialog">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Personal Details</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form>
                                                                    <div class="row form-row">
                                                                        <div class="col-12 col-sm-6">
                                                                            <div class="form-group">
                                                                                <label>Name</label>
                                                                                <input type="text" class="form-control" value="${doctor.name}">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-6">
                                                                            <div class="form-group">    
                                                                                <label>Gender</label><br>
                                                                                <c:if test="${doctor.gender == 1}">
                                                                                    <input type="radio" name="gender" value="1" checked="" >Male
                                                                                    <input type="radio" name="gender" value="0" style=" margin-left: 20px">Female
                                                                                </c:if>
                                                                                <c:if test="${doctor.gender == 0}">
                                                                                    <input type="radio" name="gender" value="1"  >Male
                                                                                    <input type="radio" name="gender" value="0" checked="" style=" margin-left: 20px">Female
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-6">
                                                                            <div class="form-group">
                                                                                <label>Date of Birth</label>
                                                                                <div class="cal-icon">
                                                                                    <input type="text" class="form-control" value="${doctor.dob}">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-6">
                                                                            <div class="form-group">
                                                                                <label>Role</label>
                                                                                <div class="cal-icon">
                                                                                    <input type="text" class="form-control" value="${doctor.role}">
                                                                                </div>
                                                                            </div>
                                                                        </div>        
                                                                        <div class="col-12 col-sm-6">
                                                                            <div class="form-group">
                                                                                <label>Email ID</label>
                                                                                <input type="email" class="form-control" value="${doctor.email}">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-6">
                                                                            <div class="form-group">
                                                                                <label>Mobile</label>
                                                                                <input type="text" value="${doctor.phone}" class="form-control">
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <button type="submit" class="btn btn-primary btn-block">Save Changes</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Edit Details Modal -->

                                            </div>


                                        </div>
                                        <!-- /Personal Details -->

                                    </div>
                                    <!-- /Personal Details Tab -->

                                    <!-- Change Password Tab -->
                                    <div id="password_tab" class="tab-pane fade">

                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Change Password</h5>
                                                <div class="row">
                                                    <div class="col-md-10 col-lg-6">
                                                        <form>
                                                            <div class="form-group">
                                                                <label>Old Password</label>
                                                                <input type="password" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>New Password</label>
                                                                <input type="password" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Confirm Password</label>
                                                                <input type="password" class="form-control">
                                                            </div>
                                                            <button class="btn btn-primary" type="submit">Save Changes</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Change Password Tab -->

                                </div>
                            </div>
                        </div>
                    </c:forEach> 
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

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:46 GMT -->

</html>