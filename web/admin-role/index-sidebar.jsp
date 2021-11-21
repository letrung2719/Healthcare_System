<%-- 
    Document   : index-sidebar
    Created on : Oct 14, 2021, 3:55:38 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Sidebar-->
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Menu</span>
                </li>
                <c:set var="context" value="<%=request.getContextPath()%>"></c:set>
                <c:set var="path" value="<%=request.getServletPath()%>"></c:set>
                <li class="${path == "/admin-role/index.jsp" ? "active" : ""}">
                    <a href="admin-home"><i class="fe fe-home"></i><span> Dashboard</span></a>
                </li>
                <li class="${path == "/admin-role/accounts.jsp" ? "active" : ""}">
                    <a href="account"><i class="fa fa-user"></i><span> Accounts</span></a>
                </li>
                <li class="${path == "/admin-role/patient-list.jsp" ? "active" : ""} ${path == "/admin-role/patient-details.jsp" ? "active" : ""}">
                    <a href="patient_list"><i class="fa fa-wheelchair"></i><span> Patients</span></a>
                </li>
                <li class="${path == "/admin-role/doctor-list.jsp" ? "active" : ""} ${path == "/admin-role/doctor_profile.jsp" ? "active" : ""}">
                    <a href="doctor_list"><i class="fa fa-user-md"></i><span>Doctors</span></a>
                </li>
                <li class="${path == "/admin-role/appointment.jsp" ? "active" : ""} ${path == "/admin-role/appointment-detail.jsp" ? "active" : ""}">
                    <a href="appoint"><i class="fe fe-calendar"></i><span> Appointments</span></a>
                </li>
                <li class="${path == "/admin-role/reservation.jsp" ? "active" : ""} ${path == "/admin-role/reservation-detail.jsp" ? "active" : ""}">
                    <a href="reservation"><i class="fe fe-bell"></i><span> Reservations</span></a>
                </li>
                <li class="${path == "/admin-role/service-list.jsp" ? "active" : ""} ${path == "/admin-role/service-detail.jsp" ? "active" : ""}">
                    <a href="service_list"><i class="fe fe-star-o"></i><span> Services</span></a>
                </li>
                <li class="${path == "/admin-role/blog-managerment.jsp" ? "active" : ""} ${path == "/admin-role/add-blog.jsp" ? "active" : ""} ${path == "/admin-role/edit-blog.jsp" ? "active" : ""}">
                    <a href="blog"><i class="fe fe-palette"></i><span> Blogs</span></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!--Sidebar-->
