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
            <a href="home" class="navbar-brand logo">
                <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
            </a>
        </div>
        <div class="main-menu-wrapper">
            <div class="menu-header">
                <a href="home" class="menu-logo">
                    <img src="assets/img/logo.png" class="img-fluid" alt="Logo">
                </a>
                <a id="menu_close" class="menu-close" href="javascript:void(0);">
                    <i class="fas fa-times"></i>
                </a>
            </div>

            <c:set var="path" value="<%=request.getServletPath()%>"/>
            <ul class="main-nav">
                <li class="${path == "/index.jsp" ? "active" : ""}"><a href="home">Home</a></li>              
                <li class="${path == "/doctors-list.jsp" ? "active" : ""}"><a href="doctor-list?page=1">Doctors List</a></li>
                <li class="${path == "/services-list.jsp" ? "active" : ""}"><a href="services">Services List</a></li>
                <li class="${path == "/blog-list.jsp" ? "active" : ""}"><a href="blog-list">Blogs List</a></li>
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
                                src="${sessionScope.user.image}"
                                width="31"
                                alt=""
                                />
                        </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="user-header">
                            <a class="dropdown-item" href="patient_profile?id=${sessionScope.user.accountID}">
                                <div class="avatar avatar-sm">
                                    <img src="${sessionScope.user.image}" alt="" class="avatar-img rounded-circle"/>
                                </div>
                                <div class="user-text">
                                    <h6>${sessionScope.user.name}</h6>
                                    <p class="text-muted mb-0">Patient</p>
                                </div>
                            </a>
                        </div>
                        <a class="dropdown-item" href="patient_profile?id=${sessionScope.user.accountID}">Profile Settings</a>
                        <a class="dropdown-item" href="appointment-history?id=${sessionScope.user.patientID}">Appointment History</a>
                        <a class="dropdown-item" href="reservationHistory?id=${sessionScope.user.patientID}">Reservation History</a>
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