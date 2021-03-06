<%-- 
    Document   : reservation-history
    Created on : 30-Oct-2021, 18:05:12
    Author     : Admin
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- doccure/patient-dashboard.html  30 Nov 2019 04:12:16 GMT -->
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

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css" />
        <!-- Datatable CSS -->

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
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="home">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Reservation History
                                    </li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Reservation History</h2>
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
                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                            <div class="profile-sidebar">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="patient_profile?id=${sessionScope.user.accountID}" class="booking-doc-img">
                                            <img
                                                src="${sessionScope.user.image}"
                                                alt="User Image"
                                                />
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>${sessionScope.user.name}</h3>
                                            <div class="patient-details">
                                                <fmt:parseDate var="p_date" value="${sessionScope.user.dob}" pattern="yyyy-MM-dd"/>
                                                <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                <h5><i class="fas fa-birthday-cake"></i> ${date}</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li>
                                                <a href="patient_profile?id=${sessionScope.user.accountID}">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="appointment-history?id=${sessionScope.user.patientID}">
                                                    <i class="fas fa-calendar-check"></i>
                                                    <span>Appointment History</span>
                                                </a>
                                            </li>
                                            <li class="active">
                                                <a href="reservationHistory?id=${sessionScope.user.patientID}">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Reservation History</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="change-password.jsp">
                                                    <i class="fas fa-lock"></i>
                                                    <span>Change Password</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="logout">
                                                    <i class="fas fa-sign-out-alt"></i>
                                                    <span>Logout</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <!-- /Profile Sidebar -->

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <!-- Tab Content -->
                                    <div class="tab-content pt-0">
                                        <!-- Appointment Tab -->
                                        <div id="pat_appointments" class="tab-pane fade show active">
                                            <div class="card card-table mb-0">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-center mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th>Reservation ID</th>                                                                
                                                                    <th>Service</th>
                                                                    <th>Date</th>
                                                                    <th>Price</th>
                                                                    <th>Status</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${history}" var="res">
                                                                    <tr>
                                                                        <td>#RES${res.reservationID}</td>

                                                                        <td>${res.service.title}</td>
                                                                        <fmt:parseDate var="p_date" value="${res.date}" pattern="yyyy-MM-dd"/>
                                                                        <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                                        <td>
                                                                            ${date}
                                                                            <span class="d-block text-info"
                                                                                  >${res.slot.time}</span
                                                                            >
                                                                        </td>
                                                                        <td><fmt:formatNumber value = "${res.price}" type = "number"/> VND</td>
                                                                        <td>
                                                                            <c:if test="${res.status == 1}">
                                                                                <span class="badge badge-pill bg-warning-light">
                                                                                    Pending
                                                                                </span>
                                                                            </c:if>
                                                                            <c:if test="${res.status == 2}">
                                                                                <span class="badge badge-pill bg-success-light">
                                                                                    Complete
                                                                                </span>
                                                                            </c:if>
                                                                            <c:if test="${res.status == 0}">
                                                                                <span class="badge badge-pill bg-danger-light">
                                                                                    Cancel
                                                                                </span>
                                                                            </c:if>

                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="load-more text-center">
                                            <ul class="pagination align-content-center" >
                                                <c:set var="page" value="${indexPage}"/>
                                                <li class="page-item ">
                                                    <c:if test="${page==1}">
                                                        <c:set var="url" value="reservationHistory?id=${sessionScope.user.patientID}&page=1"/>
                                                    </c:if>
                                                    <c:if test="${page>1}">
                                                        <c:set var="url" value="reservationHistory?id=${sessionScope.user.patientID}&page=${page-1}"/>
                                                    </c:if>
                                                    <a class="page-link" href="${url}">Previous</a>

                                                </li>
                                                <c:forEach begin="1" end="${numberOfPage}" var="i">
                                                    <li class="page-item ${page==i?"active":""}"><a class="page-link"  href="reservationHistory?id=${sessionScope.user.patientID}&page=${i}">${i}</a></li>
                                                    </c:forEach>

                                                <li class="page-item">
                                                    <c:if test="${page==numberOfPage}">
                                                        <a class="page-link" href="reservationHistory?id=${sessionScope.user.patientID}&page=${numberOfPage}">Next</a>
                                                    </c:if>
                                                    <c:if test="${page<numberOfPage}">
                                                        <a class="page-link" href="reservationHistory?id=${sessionScope.user.patientID}&page=${page+1}">Next</a>

                                                    </c:if>
                                                </li>
                                            </ul>	
                                        </div>
                                        <!-- /Appointment Tab -->
                                    </div>
                                    <!-- Tab Content -->
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


        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>
    </body>

    <!-- doccure/patient-dashboard.html  30 Nov 2019 04:12:16 GMT -->
</html>
