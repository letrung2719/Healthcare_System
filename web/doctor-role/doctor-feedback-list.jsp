<%-- 
    Document   : doctor-feedback-list
    Created on : 16-Oct-2021, 17:07:37
    Author     : Admin
--%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- doccure/reviews.html  30 Nov 2019 04:12:15 GMT -->
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
        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">
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
                        <div class="col-md-8 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="doctor_profile?id=${sessionScope.user.accountID}">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Feedbacks</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Feedbacks</h2>
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


                            <div class="doc-review review-listing">
                                <!-- Review Listing -->
                                <ul class="comments-list">
                                    <c:forEach items="${listdFb}" var="fb">
                                        <!-- Comment List -->
                                        <li>
                                            <div class="comment">
                                                <img
                                                    class="avatar rounded-circle"
                                                    alt="User Image"
                                                    src="${fb.patient.image}"
                                                    />
                                                <div class="comment-body">
                                                    <div class="meta-data">
                                                        <span class="comment-author">${fb.patient.name}</span>
                                                        <span class="comment-date">${fb.patient.email}</span>

                                                    </div>
                                                    <div class="review-count rating">
                                                        <c:forEach begin="1" end="${fb.rate}">
                                                            <i class="fas fa-star filled"></i>
                                                        </c:forEach>
                                                        <c:forEach begin="${fb.rate+1}" end="5">
                                                            <i class="fas fa-star"></i>
                                                        </c:forEach>

                                                    </div>

                                                    <p >
                                                        ${fb.content}

                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- /Comment List -->
                                    </c:forEach>
                                </ul>

                                <!-- /Comment List -->
                            </div>
                            <div class="load-more text-center">
                                <ul class="pagination align-content-center" >
                                    <li class="page-item ">
                                        <a class="page-link" href="doctorFeedbackList?doctorID=${sessionScope.user.doctorID}&page=${page-1}">Previous</a>
                                    </li>
                                    <c:set var="page" value="${indexPage}"/>
                                    <c:forEach begin="1" end="${numberOfPage}" var="i">
                                        <li class="page-item ${page==i?"active":""}"><a class="page-link"  href="doctorFeedbackList?doctorID=${sessionScope.user.doctorID}&page=${i}">${i}</a></li>
                                        </c:forEach>

                                    <li class="page-item">
                                        <a class="page-link" href="doctorFeedbackList?doctorID=${sessionScope.user.doctorID}&page=${page+1}">Next</a>
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


        <!-- Select2 JS -->
        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>
    </body>

    <!-- doccure/reviews.html  30 Nov 2019 04:12:15 GMT -->
</html>
