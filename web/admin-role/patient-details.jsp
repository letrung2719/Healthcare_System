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
                                    <li class="breadcrumb-item"><a href="admin-home">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Patients</li>
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
                                        <img class="rounded-circle" alt="User Image" src="${patient.image}">
                                    </div>
                                    <div class="col ml-md-n2 profile-user-info">
                                        <h4 class="user-name mb-0">${patient.name}</h4>
                                        <h6 class="text-muted">${patient.email}</h6>
                                    </div>
                                    <div class="col-3 status-toggle">
                                        <form action="patient_details" method="post">
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
                                                        <a class="edit-link" data-toggle="modal" href="#edit_personal_details"><i class="fa fa-edit mr-1"></i>Edit</a>
                                                    </h5>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Name</p>
                                                        <p class="col-sm-10">${patient.name}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Gender</p>
                                                        <c:if test="${patient.gender == 1}">
                                                            <p class="col-sm-10">Male</p>
                                                        </c:if>
                                                        <c:if test="${patient.gender == 0}">
                                                            <p class="col-sm-10">Female</p>
                                                        </c:if>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Date of Birth</p>
                                                        <fmt:parseDate var="p_date" value="${patient.dob}" pattern="yyyy-MM-dd"/>
                                                        <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                        <p class="col-sm-10">${date}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Phone</p>
                                                        <p class="col-sm-10">${patient.phone}</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-2 text-muted text-sm-right mb-0 mb-sm-3">Email</p>
                                                        <p class="col-sm-10">${patient.email}</p>
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

                                            <!-- Edit Details Modal -->
                                            <div class="modal fade" id="edit_personal_details" aria-hidden="true" role="dialog">
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
                                                                    <input name="id" type="hidden" value="${patient.patientID}">
                                                                    <input name="accountID" type="hidden" value="${patient.accountID}">
                                                                    <div class="col-12 col-sm-12">
                                                                        <div class="form-group">
                                                                            <label>Name</label>
                                                                            <input type="text" class="form-control" value="${patient.name}" name="name" required="">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">    
                                                                            <label>Gender</label><br>
                                                                            <c:if test="${patient.gender == 1}">
                                                                                <input type="radio" name="gender" value="1" checked="">Male
                                                                                <input type="radio" name="gender" value="0" style=" margin-left: 20px">Female
                                                                            </c:if>
                                                                            <c:if test="${patient.gender == 0}">
                                                                                <input type="radio" name="gender" value="1">Male
                                                                                <input type="radio" name="gender" value="0" checked="" style=" margin-left: 20px">Female
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-12 ">
                                                                        <div class="form-group ">
                                                                            <label>DOB</label>
                                                                            <input type="text " class="form-control " value="${patient.dob} " name="dob" required="">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-12 ">
                                                                        <div class="form-group ">
                                                                            <label>Phone</label>
                                                                            <input type="text " class="form-control " value="${patient.phone} " name="phone" required="">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-12 ">
                                                                        <div class="form-group ">
                                                                            <label>Email</label>
                                                                            <input type="text " class="form-control " value="${patient.email}" name="email" required="">
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