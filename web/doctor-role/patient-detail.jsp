<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <!-- doccure/doctor-profile-settings.html  30 Nov 2019 04:12:14 GMT -->
    <head>
        <meta charset="utf-8" />
        <title>Doccure</title>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=0"
            />

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

        <!-- Fontawesome CSS -->
        <link
            rel="stylesheet"
            href="assets/plugins/fontawesome/css/fontawesome.min.css"
            />
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css" />

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css" />

        <!-- Bootstrap CSS -->
        <link
            rel="stylesheet"
            href="assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css"
            />

        <link rel="stylesheet" href="assets/plugins/dropzone/dropzone.min.css" />

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="assets/js/html5shiv.min.js"></script>
          <script src="assets/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="index-header.jsp" />
            <!-- /Header -->

            <!-- Breadcrumb -->
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="doctor_profile?id=${sessionScope.user.accountID}">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Profile Settings
                                    </li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Profile Settings</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">

                        <!-- Profile Sidebar -->
                        <%@include file="doctor-sidebar.jsp" %>
                        <!-- /Profile Sidebar -->

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <h3 class="text-success">${thongbao}</h3>

                            <!-- Basic Information -->
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Patient Information</h4>
                                    <div class="row form-row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="change-avatar">
                                                    <div class="profile-img">
                                                        <img src="${patient.image}" alt="User Image" />
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <input name="id" type="hidden" value="${patient.patientID}" />
                                        <input name="accountID" type="hidden" value="${patient.accountID}" />
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Name Patient <span class="text-danger">*</span></label>
                                                <input name="username" type="text" class="form-control" readonly value="${patient.name}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Email <span class="text-danger">*</span></label>
                                                <input name="email" type="email" class="form-control" readonly value="${patient.email}"/>
                                            </div>
                                        </div>


                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Mobile Phone <span class="text-danger">*</span></label>
                                                <input name="phone" type="text" class="form-control" readonly value="${patient.phone}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-0">
                                                <label>Gender <span class="text-danger">*</span></label><br />
                                                <div style="display: flex;font-size: 16px">
                                                     <c:if test="${patient.gender == 1}">
                                                        <input name="gender" type="text" class="form-control" readonly value="Male"/>
                                                    </c:if>
                                                    <c:if test="${patient.gender == 0}">
                                                        <input name="gender" type="text" class="form-control" readonly value="Female"/>
                                                    </c:if>                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-0">
                                                <label>Date of Birth <span class="text-danger">*</span></label>
                                                <input name="dob" type="date" readonly="" class="form-control" value="${patient.dob}" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Basic Information -->

                            <!-- About Me -->
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Appointment ID</th>
                                                    <th>Date</th>
                                                    <th>Description</th>
                                                    <th>Status</th>
                                                    <th>View</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listApp}" var="app">
                                                    <tr>
                                                        <td>#APT${app.appointmentID}</td>
                                                        <fmt:parseDate var="p_date" value="${app.date}" pattern="yyyy-MM-dd"/>
                                                        <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                        <td>${date}<span class="d-block text-info">${app.slot.time}</span></td>
                                                        <td>${app.description}</td>
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
                                                        <td>
                                                            <div class="table-action">
                                                                <a href="appointmentDetailControl?id=${app.appointmentID}" class="btn btn-sm bg-primary-light">
                                                                    <i class="fas fa-eye"></i> View
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /About Me -->

                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="index-footer.jsp" />
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Select2 JS -->
        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <!-- Dropzone JS -->
        <script src="assets/plugins/dropzone/dropzone.min.js"></script>

        <!-- Bootstrap Tagsinput JS -->
        <script src="assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.js"></script>

        <!-- Profile Settings JS -->
        <script src="assets/js/profile-settings.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>
    </body>

    <!-- doccure/doctor-profile-settings.html  30 Nov 2019 04:12:15 GMT -->
</html>