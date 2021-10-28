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
                            <h3 class="page-title">Profile</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                <li class="breadcrumb-item active">Profile</li>
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
                                    <a href="#">
                                        <img class="rounded-circle" alt="Doctor Image" src="${doctor.image}">
                                    </a>
                                </div>
                                <div class="col ml-md-n2 profile-user-info">
                                    <h4 class="user-name mb-0">${doctor.name}</h4>
                                    <h6 class="text-muted">${doctor.email}</h6>
                                    <div class="about-text">${doctor.description}</div>
                                </div>
                                <div class="col-auto profile-btn">

                                    

											
                                </div>
                            </div>
                        </div>
                        <div class="profile-menu">
                            <ul class="nav nav-tabs nav-tabs-solid">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#per_details_tab">About</a>
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
<!--                                                    <a class="edit-link" data-toggle="modal" href="#edit_personal_details${doctor.doctorID}"><i class="fa fa-edit mr-1"></i>Edit</a>-->
                                                </h5>
                                              
                                                       <div class="row">
                                                            <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Name</p>
                                                            <p class="col-sm-10">${doctor.name}</p>
                                                       </div>
                                                       <div class="row">
                                                            <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Date of Birth</p>
                                                            <p class="col-sm-10">${doctor.dob}</p>
                                                       </div>
                                                        <div class="row">
                                                            <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">DOB</p>
                                                            <p class="col-sm-10"><c:if test="${doctor.gender == 1}">Male</c:if>
                                                                                 <c:if test="${doctor.gender == 0}">Female</c:if></p>
                                                       </div>
                                                       <div class="row">
                                                            <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Speciality</p>
                                                            <p class="col-sm-10">${doctor.spec.name}</p>
                                                       </div>
                                                       <div class="row">
                                                            <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Email ID</p>
                                                            <p class="col-sm-10">${doctor.email}</p>
                                                       </div>
                                                       <div class="row">
                                                            <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Mobile</p>
                                                            <p class="col-sm-10">${doctor.phone}</p>
                                                       </div>
                                                          
                                            </div>
                                        </div>

                                        <!-- Edit Details Modal -->
                                        <div class="modal fade" id="edit_personal_details${doctor.doctorID}" aria-hidden="true" role="dialog">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title">Edit Doctors</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="edit_doctor_profile_admin" method="post">
                                                                        <div class="row form-row">
                                                                            <input name="id" type="hidden" value="${doctor.doctorID}">
                                                                            <input name="accountID" type="hidden" value="${doctor.accountID}">
                                                                            <div class="col-12 col-sm-12">
                                                                                <div class="form-group">
                                                                                    <label>Name</label>
                                                                                    <input type="text" class="form-control" value="${doctor.name}" name="name" required="">
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
                                                                            <div class="col-12 col-sm-12 ">
                                                                                <div class="form-group ">
                                                                                    <label>Speciality</label>
                                                                                    <input type="text " class="form-control " value="${doctor.spec.name} " name="specName   " required="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12 col-sm-12 ">
                                                                                <div class="form-group ">
                                                                                    <label>DOB</label>
                                                                                    <input type="text " class="form-control " value="${doctor.dob} " name="dob" required="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12 col-sm-12 ">
                                                                                <div class="form-group ">
                                                                                    <label>Phone</label>
                                                                                    <input type="text " class="form-control " value="${doctor.phone} " name="phone" required="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12 col-sm-12 ">
                                                                                <div class="form-group ">
                                                                                    <label>Email</label>
                                                                                    <input type="text " class="form-control " value="${doctor.email}" name="email" required="">
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

                                    </div>


                                </div>
                                <!-- /Personal Details -->

                            </div>
                            <!-- /Personal Details Tab -->

                            

                        </div>
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

    <!-- Custom JS -->
    <script src="assets/js/script.js"></script>

</body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:46 GMT -->

</html>