<%-- 
    Document   : doctor-appointment
    Created on : 14-Oct-2021, 17:01:09
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/appointments.html  30 Nov 2019 04:12:09 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Doccure</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <!-- Datetimepicker CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

        <!-- Fancybox CSS -->
        <link rel="stylesheet" href="assets/plugins/fancybox/jquery.fancybox.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

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
            <jsp:include page="index-header.jsp"/>
            <!-- /Header -->

            <!-- Breadcrumb -->
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-8 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="doctor_profile?id=${sessionScope.user.accountID}">Home</a></li>

                                    <li class="breadcrumb-item active" aria-current="page">Doctor</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Appointments</h2>
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
                            <div class="appointments">
                                <div class="card card-table mb-0">
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
                                                            <td class="text-right">
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
                                <br>
                                <div class="load-more text-center">
                                    <ul class="pagination align-content-center" >
                                        <li class="page-item ">
                                            <a class="page-link" href="doctorAppointmentControl?doctorID=${sessionScope.user.doctorID}&page=${page-1}">Previous</a>
                                        </li>
                                        <c:set var="page" value="${indexPage}"/>
                                        <c:forEach begin="1" end="${numberOfPage}" var="i">
                                            <li class="page-item ${page==i?"active":""}"><a class="page-link"  href="doctorAppointmentControl?doctorID=${sessionScope.user.doctorID}&page=${i}">${i}</a></li>
                                            </c:forEach>

                                        <li class="page-item">
                                            <a class="page-link" href="doctorAppointmentControl?doctorID=${sessionScope.user.doctorID}&page=${page+1}">Next</a>
                                        </li>
                                    </ul>	
                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>

        </div>		
        <!-- /Page Content -->

        <!-- Footer -->
        <jsp:include page="index-footer.jsp"/>
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

    <!-- Datetimepicker JS -->
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

    <!-- Fancybox JS -->
    <script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>

    <!-- Custom JS -->
    <script src="assets/js/script.js"></script>

</body>

<!-- doccure/appointments.html  30 Nov 2019 04:12:09 GMT -->
</html>
