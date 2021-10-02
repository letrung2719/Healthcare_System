<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Header -->
<header class="header">
    <nav class="navbar navbar-expand-lg header-nav">
        <div class="navbar-header">
            <a id="mobile_btn" href="javascript:void(0);">
                <span class="bar-icon">
                    <span></span>
                    <span></span>
                    <span></span>
                </span>
            </a>
            <a href="index.jsp" class="navbar-brand logo">
                <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
            </a>
        </div>
        <div class="main-menu-wrapper">
            <div class="menu-header">
                <a href="index.jsp" class="menu-logo">
                    <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
                </a>
                <a id="menu_close" class="menu-close" href="javascript:void(0);">
                    <i class="fas fa-times"></i>
                </a>
            </div>
            <ul class="main-nav">
                <li class="active">
                    <a href="index.jsp">Home</a>
                </li>
                <li class="has-submenu">
                    <a href="#">Doctors <i class="fas fa-chevron-down"></i></a>
                    <ul class="submenu">
                        <li><a href="doctor-profile.html">Doctor Profile</a></li>
                        <li><a href="doctor-dashboard.html">Doctor Dashboard</a></li>
                        <li><a href="appointments.html">Appointments</a></li>
                        <li><a href="schedule-timings.html">Schedule Timing</a></li>
                        <li><a href="my-patients.html">Patients List</a></li>
                        <li><a href="invoices.html">Invoices</a></li>
                        <li><a href="doctor-profile-settings.html">Profile Settings</a></li>
                        <li><a href="reviews.html">Reviews</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#">Patients <i class="fas fa-chevron-down"></i></a>
                    <ul class="submenu">
                        <li><a href="patient_profile?id=${sessionScope.user.accountID}">Patients Profile</a></li>
                        <li><a href="booking.html">Booking</a></li>
                        <li><a href="checkout.html">Checkout</a></li>
                        <li><a href="booking-success.html">Booking Success</a></li>
                        <li><a href="patient-dashboard.html">Patient Dashboard</a></li>
                        <li><a href="favourites.html">Favourites</a></li>

                        <li><a href="change-password.jsp">Change Password</a></li>
                    </ul>
                </li>
                <li>
                    <a href="admin/index.html" target="_blank">Admin</a>
                </li>
                <li class="login-link">
                    <a href="login.jsp">Login / Signup</a>
                </li>
            </ul>
        </div>
        <ul class="nav header-navbar-rht">
            <li class="nav-item contact-item">
                <div class="header-contact-img">
                    <i class="far fa-hospital"></i>
                </div>
                <div class="header-contact-detail">
                    <p class="contact-header">Contact</p>
                    <p class="contact-info-header"> +1 315 369 5943</p>
                </div>
            </li>

            <!-- User Menu -->
            <c:if test="${sessionScope.acc != null}">
            <li class="nav-item dropdown has-arrow logged-item">
                
                    <a
                        href="#"
                        class="dropdown-toggle nav-link"
                        data-toggle="dropdown"
                        >
                        <span class="user-img">
                            <img
                                class="rounded-circle"
                                src="assets/img/patients/patient.jpg"
                                width="31"
                                alt="Ryan Taylor"
                                />
                        </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        
                            <div class="user-header">
                                <c:if test="${sessionScope.acc.author_id == 1}">
                                    <a class="dropdown-item" href="doctor_profile?id=${sessionScope.user.accountID}">
                                <div class="avatar avatar-sm">
                                    <img
                                        src="assets/img/patients/patient.jpg"
                                        alt="User Image"
                                        class="avatar-img rounded-circle"
                                        />
                                </div>
                                <div class="user-text">
                                    <h6>${sessionScope.user.name}</h6>
                                    <p class="text-muted mb-0">
                                        <c:if test="${sessionScope.acc.author_id == 1}">Doctor</c:if>
                                        <c:if test="${sessionScope.acc.author_id == 2}">Patient</c:if>
                                    </p>
                                </div>
                                    </a>
                                </c:if>
                                <c:if test="${sessionScope.acc.author_id == 2}">
                                    <a class="dropdown-item" href="patient_profile?id=${sessionScope.user.accountID}">
                                <div class="avatar avatar-sm">
                                    <img
                                        src="assets/img/patients/patient.jpg"
                                        alt="User Image"
                                        class="avatar-img rounded-circle"
                                        />
                                </div>
                                <div class="user-text">
                                    <h6>${sessionScope.user.name}</h6>
                                    <p class="text-muted mb-0">
                                        <c:if test="${sessionScope.acc.author_id == 1}">Doctor</c:if>
                                        <c:if test="${sessionScope.acc.author_id == 2}">Patient</c:if>
                                    </p>
                                </div>
                                    </a>
                                </c:if>
                                
                            </div>

                        <a class="dropdown-item" href="patient-dashboard.html"
                           >Dashboard</a
                        >
                        <a class="dropdown-item" href="patient_profile?id=${sessionScope.user.accountID}"
                           >Profile Settings</a
                        >
                        <a class="dropdown-item" href="logout">Logout</a>
                    </div>
               
            </li>
             </c:if>
            <!-- /User Menu -->

            <c:if test="${sessionScope.acc == null}">
                <li class="nav-item">
                    <a class="nav-link header-login" href="login.jsp">login / Signup </a>
                </li>
            </c:if>
        </ul>
    </nav>
</header>
<!-- /Header -->