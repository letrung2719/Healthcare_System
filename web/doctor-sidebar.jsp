<%-- 
    Document   : doctor-sidebar
    Created on : Oct 16, 2021, 4:52:18 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
    <!-- Profile Sidebar -->
    <div class="profile-sidebar">
        <div class="widget-profile pro-widget-content">
            <div class="profile-info-widget">
                <a href="#" class="booking-doc-img">
                    <img src="${sessionScope.user.image}" alt="User Image" />
                </a>
                <div class="profile-det-info">
                    <h3>Dr. ${sessionScope.user.name}</h3>

                    <div class="patient-details">
                        <h5 class="mb-0">${sessionScope.user.role}</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="dashboard-widget">
            <nav class="dashboard-menu">
                <ul>
                    <c:set var="path" value="<%=request.getServletPath()%>"/>
                        <li class="${path == "/doctor-profile.jsp" ? "active" : ""}">
                            <a href="doctor_profile?id=${sessionScope.user.accountID}">
                                <i class="fas fa-user-cog"></i>
                                <span>Profile Settings</span>
                            </a>
                        </li>
                        <li class="${path == "/doctor-appointment.jsp" ? "active" : ""} ${path == "/appointment-detail.jsp" ? "active" : ""}">
                            <a href="doctorAppointmentControl?doctorID=${sessionScope.user.doctorID}&indexPage=1">
                                <i class="fas fa-calendar-check"></i>
                                <span>Appointments</span>
                            </a>
                        </li>
<!--                        <li>
                            <a href="#">
                                <i class="fas fa-user-injured"></i>
                                <span>My Patients</span>
                            </a>
                        </li>-->
                        <li>
                            <a href="doctorFeedbackList?doctorID=${sessionScope.user.doctorID}">
                                <i class="fas fa-star"></i>
                                <span>Feedbacks</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-lock"></i>
                                <span>Change Password</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /Profile Sidebar -->
    </div>
