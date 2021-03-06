<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/doctor-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->

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
            <!-- /Sidebar -->

            <!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-7 col-auto">
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
                        <div class="col-sm-12">
                            <div class="card-body">
                                <form action="doctor_filter" method="post">
                                    <div class="form-row">
                                        <div class="col-4 col-sm-3 form-group">
                                            <label>Doctor Name</label>
                                            <input type="text" class="form-control" value="${doctorName}" name="name" />
                                        </div>
                                        <div class="col-4 col-sm-3 form-group" style="margin-left: 100px">
                                            <label>Gender</label>
                                            <div style="margin-top: 10px">
                                                <input type="radio" name="gender" value="Male" />Male
                                                <input type="radio" name="gender" value="Female" style="margin-left: 20px" />Female
                                            </div>
                                        </div>
                                        <div class="col-4 col-sm-3 form-group">
                                            <label>Select Specialities</label>
                                            <select class="form-control" name="select_specialist">
                                                <option value="">Open this select menu</option>
                                                <c:forEach items="${listSpec}" var="spec">
                                                    <option value="${spec.name}">${spec.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <button style="height: 20%; align-self: center; margin: 12px 0 0 30px" class="btn btn-primary" type="submit">
                                            Search
                                        </button>
                                    </div>
                                </form>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="table-responsive ">
                                                <table class="datatable table table-hover table-center mb-0 "> 
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Doctor Name</th>
                                                            <th>Gender</th>
                                                            <th>Specialities</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listDoctors}" var="doctor">
                                                            <tr>
                                                                <!-- >Doctor ID-->
                                                                <td>${doctor.doctorID}</td>

                                                                <td> <!-- name-->
                                                                    <h2 class="table-avatar">
                                                                        <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${doctor.image}" alt="Doctor Image"></a>
                                                                        <a href="doctor_profile_admin?id=${doctor.accountID}">Dr. ${doctor.name}</a>
                                                                    </h2>
                                                                </td>
                                                                <td>
                                                                    <c:if test="${doctor.gender == 1}">Male</c:if>
                                                                    <c:if test="${doctor.gender == 0}">Female</c:if>
                                                                    </td>
                                                                    <td>${doctor.spec.name}</td>
                                                                <td>
                                                                    <div class="actions ">
                                                                        <a class="btn btn-sm bg-success-light" data-toggle="modal" href="#edit_specialities_details${doctor.doctorID}">
                                                                            <i class="fe fe-pencil"></i> Edit
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                            <!-- Edit Details Modal -->
                                                        <div class="modal fade" id="edit_specialities_details${doctor.doctorID}" aria-hidden="true" role="dialog">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title">Edit Doctors</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="update_doctor" method="post">
                                                                        <div class="modal-body">
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

                                                                            <input type="hidden"  value="${doctor.spec.name}" name="specName">   
                                                                            <div class="col-12 col-sm-12 ">
                                                                                <div class="form-group ">
                                                                                    <label>DOB</label>
                                                                                    <input type="date" class="form-control " value="${doctor.dob}" name="dob" required="" placeholder="yyyy-MM-dd">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12 col-sm-12 ">
                                                                                <div class="form-group ">
                                                                                    <label>Phone</label>
                                                                                    <input type="text " class="form-control " value="${doctor.phone}" name="phone" required="" pattern="\d{8,10}$">
                                                                                    <span class="form-text text-muted">Phone number must from 8 to 10 digits</span>

                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12 col-sm-12 ">
                                                                                <div class="form-group ">
                                                                                    <label>Email</label>
                                                                                    <input type="text " class="form-control " value="${doctor.email}" name="email" readonly="">
                                                                                </div>
                                                                            </div>
                                                                            <button type="submit" class="btn btn-primary btn-block">Save Changes</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
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
        <script src="assets/js/jquery-3.2.1.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Slimscroll JS -->
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <!-- Datatables JS -->
        <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/datatables.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>
    </body>

</html>