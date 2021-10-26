<%@page import="model.DoctorFeedbacks"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dal.DoctorFeedbacksDAO"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/search.html  30 Nov 2019 04:12:16 GMT -->
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
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>

                                    <li class="breadcrumb-item active" aria-current="page">Doctor</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Doctor List</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">

                            <!-- Search Filter -->
                            <div class="card search-filter">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Search Filter</h4>
                                </div>
                                <form action="doctor_filter" method="post">
                                    <div class="card-body">
                                        <div class="filter-widget">
                                            <h4>Gender</h4>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="checkbox" name="gender_type" value="Male" ${gender==1?"checked":""}>
                                                    <span class="checkmark"></span> Male Doctor
                                                </label>
                                            </div>
                                            <div>
                                                <label class="custom_check">
                                                    <input type="checkbox" name="gender_type" value="Female" ${gender==0?"checked":""}>
                                                    <span class="checkmark"></span> Female Doctor
                                                </label>
                                            </div>
                                        </div>
                                        <div class="filter-widget">
                                            <h4>Select Specialist</h4>
                                            <c:forEach items="${listSpec}" var="spec">
                                                <div>
                                                    <label class="custom_check">

                                                        <input type="checkbox" name="select_specialist" value="${spec.name}">
                                                        <span class="checkmark"></span> ${spec.name}
                                                    </label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="btn-search">
                                            <button type="submit" class="btn btn-block">Search</button>
                                        </div>	
                                    </div>
                                </form>
                            </div>
                            <!-- /Search Filter -->

                        </div>

                        <div class="col-md-12 col-lg-8 col-xl-9 ">
                            <c:forEach items="${listDoctors}" var="doctor">
                                <c:set var="feedbackDB" value="<%=new DoctorFeedbacksDAO()%>"></c:set>
                                <c:set var="avgrate" value="${feedbackDB.getAverageRating(doctor.doctorID)}"></c:set>
                                <c:set var="feedbackList" value="${feedbackDB.getAllDoctorFeedbacks(doctor.doctorID)}"></c:set>
                                    <!-- Doctor Widget -->
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="doctor-widget">
                                                <div class="doc-info-left">
                                                    <div class="doctor-img">
                                                        <a href="doctor_profile_view?id=${doctor.accountID}">
                                                        <img src="${doctor.image}" class="img-fluid" alt="User Image">
                                                    </a>
                                                </div>
                                                <div class="doc-info-cont">
                                                    <h4 class="doc-name"><a href="doctor_profile_view?id=${doctor.accountID}">Dr. ${doctor.name}</a></h4>
                                                    <p class="doc-speciality">${doctor.role}</p>
                                                    <h5 class="doc-department"><img src="assets/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">${doctor.spec.name}</h5>
                                                    <div class="rating">
                                                        <i class="fas fa-star ${avgrate > 0 ? "filled" : ""}"></i>
                                                        <i class="fas fa-star ${avgrate > 1 ? "filled" : ""}"></i>
                                                        <i class="fas fa-star ${avgrate > 2 ? "filled" : ""}"></i>
                                                        <i class="fas fa-star ${avgrate > 3 ? "filled" : ""}"></i>
                                                        <i class="fas fa-star ${avgrate > 4 ? "filled" : ""}"></i>
                                                        <span class="d-inline-block average-rating">(${feedbackList.size()})</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="doc-info-right">
                                                <div class="clini-infos">
                                                    <ul>
                                                        <li><i class="far fa-thumbs-up"></i> ${avgrate/5*100}%</li>
                                                        <li><i class="far fa-comment"></i> ${feedbackList.size()} Feedbacks</li>
                                                    </ul>
                                                </div>
                                                <div class="clinic-booking">
                                                    <a class="view-pro-btn" href="doctor_profile_view?id=${doctor.accountID}">View Profile</a>
                                                    <a class="apt-btn" href="booking?account_id=${doctor.accountID}">Book Appointment</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Doctor Widget -->
                            </c:forEach>


                            <div class="load-more text-center">
                                <ul class="pagination">
                                    <li class="page-item ">
                                        <a class="page-link" href="doctor?page=${page-1}">Previous</a>
                                    </li>
                                    <c:set var="page" value="${requestScope.page}"/>
                                    <c:forEach begin="1" end="${pageNumber}" var="i">
                                        <li class="page-item ${page==i?"active":""}"><a class="page-link"  href="doctor?page=${i}">${i}</a></li>
                                        </c:forEach>

                                    <li class="page-item">
                                        <a class="page-link" href="doctor?page=${page+1}">Next</a>
                                    </li>
                                </ul>	
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

    <!-- doccure/search.html  30 Nov 2019 04:12:16 GMT -->
</html>
