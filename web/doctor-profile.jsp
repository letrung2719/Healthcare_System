<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
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
                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                            <!-- Profile Sidebar -->
                            <div class="profile-sidebar">
                                <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <img src="${doctor.image}" alt="User Image" />
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>Dr. ${doctor.name}</h3>

                                            <div class="patient-details">
                                                <h5 class="mb-0">${doctor.role}</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-widget">
                                    <nav class="dashboard-menu">
                                        <ul>
                                            
                                            <li>
                                                <a href="appointments.html">
                                                    <i class="fas fa-calendar-check"></i>
                                                    <span>Appointments</span>
                                                </a>
                                            </li>
                                           
                                            
                                            <li>
                                                <a href="reviews.html">
                                                    <i class="fas fa-star"></i>
                                                    <span>Reviews</span>
                                                </a>
                                            </li>
                                            <li class="active">
                                                <a href="doctor-profile-settings.html">
                                                    <i class="fas fa-user-cog"></i>
                                                    <span>Profile Settings</span>
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
                            <!-- /Profile Sidebar -->
                        </div>
                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <h3 class="text-success">${thongbao}</h3>
                            <form action="doctor_profile_setting" method="post">
                                <!-- Basic Information -->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Basic Information</h4>
                                        <div class="row form-row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div class="change-avatar">
                                                        <div class="profile-img">
                                                            <img src="${doctor.image}" alt="User Image" />
                                                        </div>
                                                        <div class="upload-img">
                                                            <div class="change-photo-btn">
                                                                <span
                                                                    ><i class="fa fa-upload"></i> Upload
                                                                    Photo</span
                                                                >
                                                                <input type="file" class="upload" />
                                                            </div>
                                                            <small class="form-text text-muted"
                                                                   >Allowed JPG, GIF or PNG. Max size of 2MB</small
                                                            >
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <input
                                                name="id"
                                                type="hidden"
                                                value="${doctor.doctorID}"
                                                />
                                            <input
                                                name="accountID"
                                                type="hidden"
                                                value="${doctor.accountID}"
                                                />
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label
                                                        >Username <span class="text-danger">*</span></label
                                                    >
                                                    <input
                                                        name="username"
                                                        type="text"
                                                        class="form-control"
                                                        readonly
                                                        value="${sessionScope.acc.user}"
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label
                                                        >Email <span class="text-danger">*</span></label
                                                    >
                                                    <input
                                                        name="email"
                                                        type="email"
                                                        class="form-control"
                                                        readonly
                                                        value="${doctor.email}"
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Name <span class="text-danger">*</span></label>
                                                    <input
                                                        name="name"
                                                        type="text"
                                                        class="form-control"
                                                        value="${doctor.name}"
                                                        />
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Phone Number</label>
                                                    <input
                                                        name="phone"
                                                        type="text"
                                                        class="form-control"
                                                        value="${doctor.phone}"
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Gender</label><br />
                                                    <style>
                                                        .genderedit,
                                                        option {
                                                            width: 100%;
                                                            border-radius: 3px;
                                                            height: 46px;
                                                            padding: 2px 10px;
                                                            border: 1px solid lightgray;
                                                            color: #333;
                                                            outline: none;
                                                            -moz-appearance: none;
                                                            -webkit-appearance: none;
                                                            appearance: none;
                                                            &::-ms-expand {
                                                                display: none;
                                                            }
                                                        }
                                                    </style>
                                                    <select name="gender" class="genderedit">
                                                        <option
                                                            value="${doctor.gender == 0 ? 'Female' : 'Male'}"
                                                            >
                                                            ${doctor.gender == 0 ? 'Female' : 'Male'}
                                                        </option>
                                                        <option
                                                            value="${doctor.gender == 0 ? 'Male' : 'Female'}"
                                                            >
                                                            ${doctor.gender == 0 ? 'Male' : 'Female'}
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group mb-0">
                                                    <label>Date of Birth</label>
                                                    <input
                                                        name="dob"
                                                        type="text"
                                                        class="form-control"
                                                        value="${doctor.dob}"

                                                        />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Basic Information -->

                                <!-- About Me -->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">About Me</h4>
                                        <div class="form-group mb-0">
                                            <label>Biography</label>
                                            <textarea
                                                name="description"
                                                class="form-control"
                                                rows="5"
                                                >
                                                ${doctor.description}</textarea
                                            >
                                        </div>
                                    </div>
                                </div>
                                <!-- /About Me -->
                                
                                <div class="submit-section submit-btn-bottom">
                                    <button type="submit" class="btn btn-primary submit-btn">
                                        Edit
                                    </button>
                                </div>
                            </form>
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
