<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/doctor-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Doctor List Page</title>
        
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
                                <h3 class="page-title">List of Doctors</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="javascript:(0);">Users</a></li>
                                    <li class="breadcrumb-item active">Doctors</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div style="display: flex">
                        <div class= "table-responsive"style="width: 20%">
                            <div class="modal-dialog modal-dialog-centered" style="margin: 0 !important" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Search Filter</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form action="doctor_filter" method="post">
                                            <div class="row form-row">
                                                <div class="row form-row">
                                                    <div class="col-6 col-sm-6">
                                                        <div class="form-group">
                                                            <label class="text-primary">Name</label>
                                                            <input
                                                                type="text"
                                                                class="form-control"
                                                                value=""
                                                                name="name"
                                                                />
                                                        </div>
                                                    </div>
                                                    <div class="col-6 col-sm-6">
                                                        <div class="form-group">
                                                            <label class="text-primary">Gender</label><br />
                                                            <input
                                                                type="radio"
                                                                name="gender"
                                                                value="Male"
                                                                />Male
                                                            <input
                                                                type="radio"
                                                                name="gender"
                                                                value="Female"
                                                                style="margin-left: 20px"
                                                                />Female
                                                        </div>
                                                    </div>
                                                    <div class="col-6 col-sm-6">
                                                        <div class="form-group">
                                                            <label class="text-primary">DOB</label>
                                                            <input
                                                                type="text "
                                                                class="form-control"
                                                                value=""
                                                                name="dob"
                                                                />
                                                        </div>
                                                    </div>
                                                    <div class="col-6 col-sm-6">
                                                        <div class="form-group">
                                                            <label class="text-primary">Phone</label>
                                                            <input
                                                                type="text "
                                                                class="form-control"
                                                                value=""
                                                                name="phone"
                                                                />
                                                        </div>
                                                    </div>
                                                    <div class="col-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="text-primary">Email</label>
                                                            <input
                                                                type="text "
                                                                class="form-control"
                                                                value=""
                                                                name="email"
                                                                />
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-12">

                                                        <label class="text-primary">Select Specialist</label>
                                                        <c:forEach items="${listSpec}" var="spec">
                                                            <div>
                                                                <label class="custom_check">
                                                                    <input
                                                                        type="checkbox"
                                                                        name="select_specialist"
                                                                        value="${spec.name}"
                                                                        />
                                                                    <span class="checkmark"></span> ${spec.name}
                                                                </label>
                                                            </div>
                                                        </c:forEach>

                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary btn-block">
                                                Search
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Page Header -->
                        <div class="row" style="width: 80%">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body modal-content"> 
                                        <div class="table-responsive ">
                                            <table class="datatable table table-hover table-center mb-0 "> 
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Doctor Name</th>
                                                        <th>Gender</th>
                                                        <th>Specialities</th>
                                                        <th>Email</th>
                                                        <th>Phone number</th>
                                                        <th>Actions</th>
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
                                                                    <a>Dr. ${doctor.name}</a>
                                                                </h2>
                                                            </td>
                                                            <!-- >Gender-->
                                                            <td>
                                                                <c:if test="${doctor.gender == 1}">Male</c:if>
                                                                <c:if test="${doctor.gender == 0}">Female</c:if>
                                                                </td>
                                                                <!-- >Specialities-->
                                                                <td>${doctor.spec.name}</td>
                                                            <!-- >Email-->
                                                            <td>${doctor.email}</td>
                                                            <!-- >Phone -->
                                                            <td> ${doctor.phone}</td>
                                                            <td class="text-right">
                                                                <div class="actions">
                                                                    <a class="btn btn-sm bg-success-light" data-toggle="modal" href="#edit_specialities_details${doctor.doctorID}">
                                                                        <i class="fe fe-pencil"></i> Edit
                                                                    </a>
                                                                    <a data-toggle="modal" href="#delete_modal${doctor.doctorID}" class="btn btn-sm bg-danger-light">
                                                                        <i class="fe fe-trash"></i> Delete
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
                                                                <div class="modal-body">
                                                                    <form action="update_doctor" method="post">
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
                                                                                    <label>Specialities</label>
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
                                                                        <button type="submit" class="btn btn-primary btn-block">Save Changes</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /Edit Details Modal -->

                                                    <!-- Delete Modal -->
                                                    <div class="modal fade" id="delete_modal${doctor.doctorID}" aria-hidden="true" role="dialog">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content">

                                                                <div class="modal-body" style="text-align: center">
                                                                    <div class="form-content p-2">
                                                                        <h4 class="modal-title">Delete</h4>
                                                                        <p class="mb-4">Are you sure want to delete?</p>
                                                                        <a href="delete_doctor?id=${doctor.accountID}"><button type="button" class="btn btn-primary">Save</button></a>
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

                <!-- /ADD Modal -->


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

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/doctor-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->
</html>