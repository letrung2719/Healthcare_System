
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                        <a href="index-2.html">Home</a>
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
                                        <a href="#" class="booking-doc-img">
                                            <img
                                                src="assets/img/patients/patient.jpg"
                                                alt="User Image"
                                                />
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>${Users.name} </h3>
                                            <div class="patient-details">
                                                <h5>
                                                    <i class="fas fa-birthday-cake"></i> ${Users.dob}
                                                </h5>
                                                <h5 class="mb-0">
                                                    <i class="fas fa-map-marker-alt"></i> Newyork, USA
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            <li>
                                                <a href="#">
                                                    <i class="fas fa-columns"></i>
                                                    <span>Dashboard</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="favourites.html">
                                                    <i class="fas fa-bookmark"></i>
                                                    <span>Favourites</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="profile-settings.html">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="change-password.html">
                                                    <i class="fas fa-lock"></i>
                                                    <span>Change Password</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="index-2.html">
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
                                    <form>
                                        <div class="row form-row">
                                            <div class="col-12 col-md-12">
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        value="${Users.name}"
                                                        
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Date of Birth</label>
                                                    <div class="cal-icon">
                                                        <input
                                                            type="date"
                                                            class="form-control"
                                                            value="${Users.dob}"
                                                            
                                                            />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Email ID</label>
                                                    <input
                                                        type="email"
                                                        class="form-control"
                                                        value="${Users.email}"
                                                        
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Mobile</label>
                                                    <input
                                                        type="text"
                                                        value="${Users.phone}"
                                                        class="form-control"
                                                        
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Gender</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        value="<c:out value = "${Users.gender == 0 ? 'Female' : 'Male'}"/>" 
                                                        
                                                        />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button type="button" class="btn btn-primary submit-btn">
                                                Edit
                                            </button>
                                        </div>
                                    </form>
                                    <!-- /Profile Settings Form -->
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
