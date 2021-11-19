<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- doccure/profile-settings.html  30 Nov 2019 04:12:18 GMT -->
    <head>
        <meta charset="utf-8" />
        <title>Profile Settings</title>
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

        <!-- Datetimepicker CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css" />

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
                                            <fmt:parseDate var="p_date" value="${sessionScope.user.dob}" pattern="yyyy-MM-dd"/>
                                            <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                            <div class="patient-details">
                                                <h5><i class="fas fa-birthday-cake"></i> ${date}</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li class="active">
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
                                            <li>
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
                                    <!-- Profile Settings Form -->
                                    <p class="text-success">${thongbao}</p>
                                    <form action="patient_profile_setting" method="post">
                                        <div class="row form-row">
                                            <input name="id" type="hidden" value="${Users.patientID}"/>
                                            <input name="accountID" type="hidden" value="${Users.accountID}"/>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Name <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" value="${Users.name}" name="name" />
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Gender <span class="text-danger">*</span></label><br />
                                                    <div style="display: flex;margin-top: 15px;font-size: 16px">
                                                        <div style="margin-right: 30px">
                                                            <input type="radio" id="male" name="gender" value="male" ${Users.gender == 1 ? 'checked' : ''}>
                                                              <label for="male">Male</label> 
                                                        </div>
                                                        <div> 
                                                            <input type="radio" id="female" name="gender" value="female" ${Users.gender == 0 ? 'checked' : ''}>
                                                              <label for="female">Female</label>
                                                        </div>                                                        
                                                    </div>                                                  
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Date of Birth <span class="text-danger">*</span></label>
                                                    <div class="cal-icon">
                                                        <input name="dob" type="date" class="form-control" value="${Users.dob}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Email <span class="text-danger">*</span></label>
                                                    <input name="email" type="email" class="form-control" value="${Users.email}" readonly=""/>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Mobile Phone <span class="text-danger">*</span></label>
                                                    <input name="phone" type="text" value="${Users.phone}" class="form-control" pattern="\d{8,10}$"/>
                                                    <span class="form-text text-muted">Phone number must from 8 to 10 digits</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button type="submit" class="btn btn-primary submit-btn">
                                                Save changes
                                            </button>                                            
                                        </div>
                                    </form>
                                    <!-- Tab Content -->
                                </div>
                            </div>                         
                        </div>

                    </div>
                </div>
            </div>
            <!-- /Main Wrapper -->

            <!-- Footer -->
            <jsp:include page="index-footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Page Content -->

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Select2 JS -->
        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <!-- Datetimepicker JS -->
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>
    </body>

    <!-- doccure/profile-settings.html  30 Nov 2019 04:12:18 GMT -->
</html>
