<%@page import="model.DoctorFeedbacks"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dal.DoctorFeedbacksDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- doccure/  30 Nov 2019 04:11:34 GMT -->

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure</title>

        <!-- Favicons -->
        <link type="image/x-icon" href="assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

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

            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="home">Home</a>
                                    </li>
                                    <li class="breadcrumb-item " >
                                        <a href="blog-list">Blogs</a>
                                    </li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Information about our hospital</h2>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Home Banner -->
            <section class="section section-search">
                <div class="container-fluid">
                    <div class="banner-wrapper">
                        <div class="banner-header text-center">
                            <h1>Search Blogs, Something you want to know?</h1>
                            <p>Discover the best infofmation about my hospital </p>
                        </div>

                        <!-- Search -->
                        <div class="search-box">
                            <form action="SearchListBlog?id=0" method="post" style="justify-content: center;">
                                <div class="form-group search-info">
                                    <input value="${tim}" name="text" type="text" class="form-control"
                                           placeholder="Search Blogs,Title">
                                    <span class="form-text">Ex : How to recovery your body?</span>
                                </div>
                                <button type="submit" class="btn btn-primary search-btn"><i class="fas fa-search"></i>
                                    <span>Search</span></button>
                            </form>
                        </div>
                        <!-- /Search -->

                    </div>
                </div>
            </section>
            <!-- /Home Banner -->

            <!-- Popular Section -->
            <section class="section section-doctor">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-9">
                            <!-- Doctor Widget -->
                            <div class="card">
                                <div style="text-align: center">
                                    <h1 style="width: 100%; margin: 30px auto; font-weight: bold">See our Blog to gain more knowledge</h1>
                                </div>
                                <div class="card-body">
                                    <div class="doctor-widget">
                                        <div class="doc-info-left">
                                            <div class="clinic-details">
                                                <div class="row row-cols-md-3">
                                                    <c:forEach items="${listBlog}" var="blog">
                                                        <fmt:parseDate var="p_date" value="${blog.date}" pattern="yyyy-MM-dd"/>
                                                        <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                        <div class="col mb-4">
                                                            <div class="card text-white" style="background-color: white">
                                                                <img src="${blog.image}" class="card-img" alt="..." style="height: 355px;border: 2px solid white; border-radius: 4%">
                                                                <div class="card-img-overlay" style="padding-top: 225px">
                                                                    <h4 class="card-title" style="height: 45px;font-weight: bold">${blog.title}</h4>
                                                                    <p class="card-text" style="color: #334;">Update in: ${date}</p>
                                                                    <a href="blog-detail?id=${blog.blogID}" style="font-weight: bold; color: #fc5;">View more...</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>

                                                    <div class="col mb-4">
                                                        <div class="card text-white" style="background-color: white">
                                                            <img src="https://funix.edu.vn/wp-content/uploads/2019/11/11.jpg" class="card-img" alt="..." style="height: 355px;border: 2.5px solid white; border-radius: 3%">
                                                            <div class="card-img-overlay" style="padding-top: 225px">
                                                                <h4 class="card-title" style="height: 45px;font-weight: bold">Covid is not good for us</h4>
                                                                <p class="card-text" style="color: #334;">Update in: Today</p>
                                                                <a href="#" style="font-weight: bold; color: #fc5;">View more...</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col mb-4">
                                                        <div class="card text-white" style="background-color: white">
                                                            <img src="https://funix.edu.vn/wp-content/uploads/2019/11/11.jpg" class="card-img" alt="..." style="height: 355px;border: 2.5px solid white; border-radius: 3%">
                                                            <div class="card-img-overlay" style="padding-top: 225px">
                                                                <h4 class="card-title" style="height: 45px;font-weight: bold">Covid is not good for us</h4>
                                                                <p class="card-text" style="color: #334;">Update in: Today</p>
                                                                <a href="#" style="font-weight: bold; color: #fc5;">View more...</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col mb-4">
                                                        <div class="card text-white" style="background-color: white">
                                                            <img src="https://funix.edu.vn/wp-content/uploads/2019/11/11.jpg" class="card-img" alt="..." style="height: 355px;border: 2.5px solid white; border-radius: 3%">
                                                            <div class="card-img-overlay" style="padding-top: 225px">
                                                                <h4 class="card-title" style="height: 45px;font-weight: bold">Covid is not good for us</h4>
                                                                <p class="card-text" style="color: #334;">Update in: Today</p>
                                                                <a href="#" style="font-weight: bold; color: #fc5;">View more...</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col mb-4">
                                                        <div class="card text-white" style="background-color: white">
                                                            <img src="https://funix.edu.vn/wp-content/uploads/2019/11/11.jpg" class="card-img" alt="..." style="height: 355px;border: 2.5px solid white; border-radius: 3%">
                                                            <div class="card-img-overlay" style="padding-top: 225px">
                                                                <h4 class="card-title" style="height: 45px;font-weight: bold">Covid is not good for us</h4>
                                                                <p class="card-text" style="color: #334;">Update in: Today</p>
                                                                <a href="#" style="font-weight: bold; color: #fc5;">View more...</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- /Doctor Widget -->                              
                        </div>
                        <c:set var="feedbackDB" value="<%=new DoctorFeedbacksDAO()%>"></c:set>
                        <c:set var="avgrate" value="${feedbackDB.getAverageRating(doctor.doctorID)}"></c:set>
                        <c:set var="feedbackList" value="${feedbackDB.getAllDoctorFeedbacks(doctor.doctorID)}"></c:set>
                            <div class="col-lg-3">
                                <div class="card">
                                    <div style="text-align: center;padding: 0 24px 0 24px ">
                                        <h2 style="margin: 30px 5px;font-weight: bold">Don't miss our best Doctor</h2>
                                    </div>
                                    <div style="padding: 24px">
                                        <h3 class="title">
                                            <a href="doctor_profile_view?id=${doctor.accountID}" style="font-weight: bold">Doctor ${doctor.name} </a><br>
                                        <i style="color: #fc5" class="fas fa-star ${avgrate > 0 ? "filled" : ""}"></i>
                                        <i style="color: #fc5" class="fas fa-star ${avgrate > 1 ? "filled" : ""}"></i>
                                        <i style="color: #fc5" class="fas fa-star ${avgrate > 2 ? "filled" : ""}"></i>
                                        <i style="color: #fc5" class="fas fa-star ${avgrate > 3 ? "filled" : ""}"></i>
                                        <i style="color: #fc5" class="fas fa-star ${avgrate > 4 ? "filled" : ""}"></i>
                                    </h3>
                                    <div class="doc-img">
                                        <a href="doctor_profile_view?id=${doctor.accountID}">
                                            <img class="img-fluid" alt="User Image" src="${doctor.image}">
                                        </a>
                                    </div>
                                    <div class="pro-content">
                                        <p class="speciality"><b style="color: #fc5;">Speciality: </b>${doctor.role}</p>
                                        <ul class="available-info">
                                            <li>
                                                <i class="fas fa-map-marker-alt"></i> Hanoi, Vietnam
                                            </li>
                                            <li>
                                                <i class="far fa-clock"></i> From Monday to Saturday
                                            </li>
                                            <li>
                                                <i class="far fa-money-bill-alt"></i> Free
                                                <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                            </li>
                                        </ul>
                                        <div class="row row-sm">
                                            <div class="col-6">
                                                <a style="color: #fc5;border: 2px solid #fc5" href="doctor_profile_view?id=${doctor.accountID}" class="btn view-btn">View Profile</a>
                                            </div>
                                            <div class="col-6">
                                                <a style="background-color: #fc5;border: 2px solid #fc5" href="booking?account_id=${doctor.accountID}" class="btn book-btn">Book Now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- /Popular Section -->

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

        <!-- Slick JS -->
        <script src="assets/js/slick.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>
    </body>
</html>