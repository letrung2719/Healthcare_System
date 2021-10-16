<%-- 
    Document   : view-doctor-profile
    Created on : 03-Oct-2021, 13:24:47
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/doctor-profile.html  30 Nov 2019 04:12:16 GMT -->
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
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Doctor Profile</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Doctor Profile</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container">

                    <!-- Doctor Widget -->
                    <div class="card">
                        <div class="card-body">
                            <div class="doctor-widget">
                                <div class="doc-info-left">
                                    <div class="doctor-img">
                                        <img src="${doctor.image}" class="img-fluid" alt="User Image">
                                    </div>
                                    <div class="doc-info-cont">
                                        <h4 class="doc-name">Dr. ${doctor.name}</h4>
                                        <p class="doc-speciality">${doctor.role}</p>
                                        <p class="doc-department">${doctor.spec.name}</p>
                                        <div class="rating">
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star"></i>
                                            <span class="d-inline-block average-rating">(35)</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="doc-info-right">
                                    <div class="clini-infos">
                                        <ul>
                                            <li><i class="far fa-thumbs-up"></i> 99%</li>
                                           
                                            <li><i class="far fa-money-bill-alt"></i> $100 per hour </li>
                                        </ul>
                                    </div>
                                    <div class="doctor-action">
                                        <a href="javascript:void(0)" class="btn btn-white fav-btn">
                                            <i class="far fa-bookmark"></i>
                                        </a>
                                        <a href="chat.html" class="btn btn-white msg-btn">
                                            <i class="far fa-comment-alt"></i>
                                        </a>
                                        <a href="javascript:void(0)" class="btn btn-white call-btn" data-toggle="modal" data-target="#voice_call">
                                            <i class="fas fa-phone"></i>
                                        </a>
                                        <a href="javascript:void(0)" class="btn btn-white call-btn" data-toggle="modal" data-target="#video_call">
                                            <i class="fas fa-video"></i>
                                        </a>
                                    </div>
                                    <div class="clinic-booking">
                                        <a class="apt-btn" href="booking?account_id=${doctor.accountID}">Book Appointment</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Doctor Widget -->

                    <!-- Doctor Details Tab -->
                    <div class="card">
                        <div class="card-body pt-0">

                            <!-- Tab Menu -->
                            <nav class="user-tabs mb-4">
                                <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#doc_overview" data-toggle="tab">Overview</a>
                                    </li>
                                    
                                    <li class="nav-item">
                                        <a class="nav-link" href="#doc_reviews" data-toggle="tab">Reviews</a>
                                    </li>
                                    
                                </ul>
                            </nav>
                            <!-- /Tab Menu -->

                            <!-- Tab Content -->
                            <div class="tab-content pt-0">

                                <!-- Overview Content -->
                                <div role="tabpanel" id="doc_overview" class="tab-pane fade show active">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-9">

                                            <!-- About Details -->
                                            <div class="widget about-widget">
                                                <h4 class="widget-title">About Me</h4>
                                                <p>${doctor.description}</p>
                                            </div>
                                            <!-- /About Details -->

                                            <!-- Specializations List -->
                                            <div class="service-list">
                                                <h4>Specializations</h4>
                                                <ul class="clearfix">
                                                    <li>${doctor.spec.name}</li>
                                                    	
                                                </ul>
                                            </div>
                                            <!-- /Specializations List -->

                                        </div>
                                    </div>
                                </div>
                                <!-- /Overview Content -->

                                

                                <!-- Reviews Content -->
                                <div role="tabpanel" id="doc_reviews" class="tab-pane fade">

                                    <!-- Review Listing -->
                                    <div class="widget review-listing">
                                        <ul class="comments-list">

                                            <!-- Comment List -->
                                            <li>
                                                <div class="comment">
                                                    <img class="avatar avatar-sm rounded-circle" alt="User Image" src="assets/img/patients/patient.jpg">
                                                    <div class="comment-body">
                                                        <div class="meta-data">
                                                            <span class="comment-author">Richard Wilson</span>
                                                            <span class="comment-date">Reviewed 2 Days ago</span>
                                                            <div class="review-count rating">
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                        </div>
                                                        <p class="recommended"><i class="far fa-thumbs-up"></i> I recommend the doctor</p>
                                                        <p class="comment-content">
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                            Ut enim ad minim veniam, quis nostrud exercitation.
                                                            Curabitur non nulla sit amet nisl tempus
                                                        </p>
                                                        <div class="comment-reply">
                                                            <a class="comment-btn" href="#">
                                                                <i class="fas fa-reply"></i> Reply
                                                            </a>
                                                            <p class="recommend-btn">
                                                                <span>Recommend?</span>
                                                                <a href="#" class="like-btn">
                                                                    <i class="far fa-thumbs-up"></i> Yes
                                                                </a>
                                                                <a href="#" class="dislike-btn">
                                                                    <i class="far fa-thumbs-down"></i> No
                                                                </a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Comment Reply -->
                                                <ul class="comments-reply">
                                                    <li>
                                                        <div class="comment">
                                                            <img class="avatar avatar-sm rounded-circle" alt="User Image" src="assets/img/patients/patient1.jpg">
                                                            <div class="comment-body">
                                                                <div class="meta-data">
                                                                    <span class="comment-author">Charlene Reed</span>
                                                                    <span class="comment-date">Reviewed 3 Days ago</span>
                                                                    <div class="review-count rating">
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star filled"></i>
                                                                        <i class="fas fa-star"></i>
                                                                    </div>
                                                                </div>
                                                                <p class="comment-content">
                                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                                    Ut enim ad minim veniam.
                                                                    Curabitur non nulla sit amet nisl tempus
                                                                </p>
                                                                <div class="comment-reply">
                                                                    <a class="comment-btn" href="#">
                                                                        <i class="fas fa-reply"></i> Reply
                                                                    </a>
                                                                    <p class="recommend-btn">
                                                                        <span>Recommend?</span>
                                                                        <a href="#" class="like-btn">
                                                                            <i class="far fa-thumbs-up"></i> Yes
                                                                        </a>
                                                                        <a href="#" class="dislike-btn">
                                                                            <i class="far fa-thumbs-down"></i> No
                                                                        </a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <!-- /Comment Reply -->

                                            </li>
                                            <!-- /Comment List -->

                                            <!-- Comment List -->
                                            <li>
                                                <div class="comment">
                                                    <img class="avatar avatar-sm rounded-circle" alt="User Image" src="assets/img/patients/patient2.jpg">
                                                    <div class="comment-body">
                                                        <div class="meta-data">
                                                            <span class="comment-author">Travis Trimble</span>
                                                            <span class="comment-date">Reviewed 4 Days ago</span>
                                                            <div class="review-count rating">
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star filled"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                        </div>
                                                        <p class="comment-content">
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                            Ut enim ad minim veniam, quis nostrud exercitation.
                                                            Curabitur non nulla sit amet nisl tempus
                                                        </p>
                                                        <div class="comment-reply">
                                                            <a class="comment-btn" href="#">
                                                                <i class="fas fa-reply"></i> Reply
                                                            </a>
                                                            <p class="recommend-btn">
                                                                <span>Recommend?</span>
                                                                <a href="#" class="like-btn">
                                                                    <i class="far fa-thumbs-up"></i> Yes
                                                                </a>
                                                                <a href="#" class="dislike-btn">
                                                                    <i class="far fa-thumbs-down"></i> No
                                                                </a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <!-- /Comment List -->

                                        </ul>

                                        <!-- Show All -->
                                        <div class="all-feedback text-center">
                                            <a href="#" class="btn btn-primary btn-sm">
                                                Show all feedback <strong>(167)</strong>
                                            </a>
                                        </div>
                                        <!-- /Show All -->

                                    </div>
                                    <!-- /Review Listing -->

                                    

                                </div>
                                <!-- /Reviews Content -->

                             

                            </div>
                        </div>
                    </div>
                    <!-- /Doctor Details Tab -->

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

        <!-- Fancybox JS -->
        <script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/doctor-profile.html  30 Nov 2019 04:12:16 GMT -->
</html>