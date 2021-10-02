<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/patient-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Patient List Page</title>

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
                                                    <img class="avatar-img rounded-circle" alt="User Image"
                                                         src="assets/img/doctors/doctor-thumb-01.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Dr. Ruby Perrin</span> Schedule <span class="noti-title">her appointment</span></p>
                                                    <p class="noti-time"><span class="notification-time">4 mins ago</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image"
                                                         src="assets/img/patients/patient1.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Charlene Reed</span> has booked her appointment to <span class="noti-title">Dr. Ruby
                                                            Perrin</span></p>
                                                    <p class="noti-time"><span class="notification-time">6 mins ago</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image"
                                                         src="assets/img/patients/patient2.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Travis Trimble</span> sent a amount of $210 for his <span class="noti-title">appointment</span></p>
                                                    <p class="noti-time"><span class="notification-time">8 mins ago</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media">
                                                <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image"
                                                         src="assets/img/patients/patient3.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Carl Kelly</span> send a message <span class="noti-title"> to his doctor</span></p>
                                                    <p class="noti-time"><span class="notification-time">12 mins ago</span>
                                                    </p>
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
                            <span class="user-img"><img class="rounded-circle" src="assets/img/profiles/avatar-01.jpg"
                                                        width="31" alt="Ryan Taylor"></span>
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
            <jsp:include page="sidebar.jsp"/>
            <!-- /Sidebar -->

            <!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-7 col-auto">
                                <h3 class="page-title">List of Patients</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="javascript:(0);">Users</a></li>
                                    <li class="breadcrumb-item active">Patients</li>
                                </ul>
                            </div>
                            <div class="col-sm-5 col">
                                <a href="#Add_Specialities_details" data-toggle="modal" class="btn btn-primary float-right mt-2">Add</a>
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
                                                        <th>Phone</th>
                                                        <th>Email</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listPatients}" var="user">
                                                        <tr>
                                                            <td>${user.patientID}</td>
                                                            <td>${user.name}</td>
                                                            <td><c:if test="${user.gender == 1}">Male</c:if>
                                                                <c:if test="${user.gender == 0}">Female</c:if>
                                                                </td>
                                                                <td>${user.dob}</td>
                                                            <td>${user.phone}</td>
                                                            <td>${user.email}</td>
                                                            <td>
                                                                <div class="actions">
                                                                    <a class="btn btn-sm bg-success-light" data-toggle="modal" href="#edit_specialities_details_update${user.patientID}">
                                                                        <i class="fe fe-pencil"></i> Edit
                                                                    </a>
                                                                    <a class="btn btn-sm bg-danger-light" data-toggle="modal" href="#delete_modal${user.patientID}">
                                                                        <i class="fe fe-trash"></i> Delete
                                                                    </a>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <!-- Edit Details Modal -->
                                                    <div class="modal fade" id="edit_specialities_details_update${user.patientID}" aria-hidden="true" role="dialog">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title">Edit Patients</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="update" method="post">
                                                                        <div class="row form-row">
                                                                            <input name="id" type="hidden" value="${user.patientID}">
                                                                            <input name="accountID" type="hidden" value="${user.accountID}">
                                                                            <div class="col-12 col-sm-12">
                                                                                <div class="form-group">
                                                                                    <label>Name</label>
                                                                                    <input type="text" class="form-control" value="${user.name}" name="name" required="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12 col-sm-6">
                                                                                <div class="form-group">    
                                                                                    <label>Gender</label><br>
                                                                                    <c:if test="${user.gender == 1}">
                                                                                        <input type="radio" name="gender" value="1" checked="" >Male
                                                                                        <input type="radio" name="gender" value="0" style=" margin-left: 20px">Female
                                                                                    </c:if>
                                                                                    <c:if test="${user.gender == 0}">
                                                                                        <input type="radio" name="gender" value="1"  >Male
                                                                                        <input type="radio" name="gender" value="0" checked="" style=" margin-left: 20px">Female
                                                                                    </c:if>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12 col-sm-12 ">
                                                                                <div class="form-group ">
                                                                                    <label>DOB</label>
                                                                                    <input type="text " class="form-control " value="${user.dob} " name="dob" required="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12 col-sm-12 ">
                                                                                <div class="form-group ">
                                                                                    <label>Phone</label>
                                                                                    <input type="text " class="form-control " value="${user.phone} " name="phone" required="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12 col-sm-12 ">
                                                                                <div class="form-group ">
                                                                                    <label>Email</label>
                                                                                    <input type="text " class="form-control " value="${user.email}" name="email" required="">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <button type="submit " class="btn btn-primary btn-block ">Save Changes</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /Edit Details Modal -->

                                                    <!-- Delete Modal -->
                                                    <div class="modal fade" id="delete_modal${user.patientID}" aria-hidden="true" role="dialog">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content">

                                                                <div class="modal-body" style="text-align: center">
                                                                    <div class="form-content p-2">
                                                                        <h4 class="modal-title">Delete</h4>
                                                                        <p class="mb-4">Are you sure want to delete?</p>
                                                                        <a href="delete?id=${user.accountID}"><button type="button" class="btn btn-primary">Save</button></a>
                                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /Delete Modal -->
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

                <!-- Add Modal -->
                <div class="modal fade" id="Add_Specialities_details" aria-hidden="true" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Patients</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="add" method="post">
                                    <div class="row form-row">
                                        <div class="row form-row">
                                            <div class="col-12 col-sm-12">
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input type="text" class="form-control" value="" name="name">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="form-group">
                                                    <label>Gender</label><br>
                                                    <input type="radio" name="gender" value="Male">Male
                                                    <input type="radio" name="gender" value="Female" style=" margin-left: 20px">Female
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 ">
                                                <div class="form-group ">
                                                    <label>DOB</label>
                                                    <input type="text " class="form-control " value="" name="dob">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 ">
                                                <div class="form-group ">
                                                    <label>Phone</label>
                                                    <input type="text " class="form-control " value="" name="phone">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 ">
                                                <div class="form-group ">
                                                    <label>Email</label>
                                                    <input type="text " class="form-control " value=" " name="email">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block">Save Changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /ADD Modal -->
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