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
                        <div class="row" style="display: flex;">
                            <div class="col-sm-12">
                                <h3 class="page-title">Appointments</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="">Appointments</a></li>
                                </ul>
                            </div>

                        </div>


                    </div>
                    <!-- /Page Header -->

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Patient Information</h4>
                                    <div class="row form-row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="change-avatar">
                                                    <div class="profile-img" style="width: 100px; height: 100px">
                                                        <img style="width: 100%; height: 100%;" src="${appoint.patient.image}" alt="User Image" />
                                                    </div>

                                                </div>
                                            </div>

                                        </div>

                                        <input name="id" type="hidden" value="${appoint.patient.patientID}" />
                                        <input name="accountID" type="hidden" value="${appoint.patient.accountID}" />
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Name Patient <span class="text-danger">*</span></label>
                                                <input name="username" type="text" class="form-control" readonly value="${appoint.patient.name}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Email <span class="text-danger">*</span></label>
                                                <input name="email" type="email" class="form-control" readonly value="${appoint.patient.email}"/>
                                            </div>
                                        </div>


                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Mobile Phone <span class="text-danger">*</span></label>
                                                <input name="phone" type="text" class="form-control" readonly value="${appoint.patient.phone}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-0">
                                                <label>Gender <span class="text-danger">*</span></label><br />
                                                <div style="display: flex;font-size: 16px">




                                                     <c:if test="${appoint.patient.gender == 1}">
                                                        <input name="gender" type="text" class="form-control" readonly value="Male"/>
                                                    </c:if>
                                                    <c:if test="${appoint.patient.gender == 0}">
                                                        <input name="gender" type="text" class="form-control" readonly value="Female"/>
                                                    </c:if>                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-0">
                                                <label>Date of Birth <span class="text-danger">*</span></label>
                                                <input
                                                    name="dob"
                                                    type="date" readonly=""
                                                    class="form-control"
                                                    value="${appoint.patient.dob}" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>			
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Doctor Information</h4>
                                    <div class="row form-row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="change-avatar">
                                                    <div class="profile-img" style="width: 100px; height: 100px">
                                                        <img style="width: 100%; height: 100%;" src="${appoint.doctor.image}" alt="User Image" />
                                                    </div>

                                                </div>
                                            </div>

                                        </div>

                                        <input name="id" type="hidden" value="${appoint.doctor.doctorID}" />
                                        <input name="accountID" type="hidden" value="${appoint.doctor.accountID}" />
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Name Doctor <span class="text-danger">*</span></label>
                                                <input name="username" type="text" class="form-control" readonly value="${appoint.doctor.name}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Email <span class="text-danger">*</span></label>
                                                <input name="email" type="email" class="form-control" readonly value="${appoint.doctor.email}"/>
                                            </div>
                                        </div>


                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Mobile Phone <span class="text-danger">*</span></label>
                                                <input name="phone" type="text" class="form-control" readonly value="${appoint.doctor.phone}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Speciality <span class="text-danger">*</span></label>
                                                <input name="phone" type="text" class="form-control" readonly value="${appoint.doctor.spec.name}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-0">
                                                <label>Gender <span class="text-danger">*</span></label><br />
                                                <div style="display: flex;font-size: 16px">




                                                     <c:if test="${appoint.doctor.gender == 1}">
                                                        <input name="gender" type="text" class="form-control" readonly value="Male"/>
                                                    </c:if>
                                                    <c:if test="${appoint.doctor.gender == 0}">
                                                        <input name="gender" type="text" class="form-control" readonly value="Female"/>
                                                    </c:if>                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-0">
                                                <label>Date of Birth <span class="text-danger">*</span></label>
                                                <input
                                                    name="dob"
                                                    type="date" readonly=""
                                                    class="form-control"
                                                    value="${appoint.doctor.dob}" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>	
                        <div class="col-sm-6">
                            <label style="margin-left: 20px;">Description <span class="text-danger">*</span></label>
                            <textarea style="width: 100%;" cols="" rows="10" readonly="">${appoint.description}</textarea>
                        </div>
                        <div class="col-sm-6">
                            <label style="margin-left: 20px;">Date appointment <span class="text-danger">*</span></label>
                            <div style="display: flex;">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">

                                        <input
                                            name="dob"
                                            type="date" readonly=""
                                            class="form-control"
                                            value="${appoint.date}" />

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <input
                                            name="dob"
                                            type="text" readonly=""
                                            class="form-control"
                                            value="${appoint.slot.time}" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6" >
                                <div class="form-group mb-0">
                                    <label style="margin-top: 10px;">Status <span class="text-danger">*</span></label><br />
                                    <div style="display: flex;font-size: 16px">

                                        <c:if test="${appoint.status == '0'}">
                                            <button type="button" class="btn btn-danger">Rejected</button>
                                        </c:if>
                                        <c:if test="${appoint.status == '1'}">
                                            <button type="button" class="btn btn-warning">Processing</button>
                                        </c:if>
                                        <c:if test="${appoint.status == '2'}">
                                            <button type="button" class="btn btn-success">Success</button>
                                        </c:if>                                                   
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
