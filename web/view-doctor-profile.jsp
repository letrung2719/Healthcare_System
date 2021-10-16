<%-- 
    Document   : view-doctor-profile
    Created on : 03-Oct-2021, 13:24:47
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                                        <p class="doc-department"><img src="assets/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">${doctor.spec.name}</p>
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
                                    <li class="nav-item">
                                        <a class="nav-link" href="#doc_business_hours" data-toggle="tab">Business Hours</a>
                                    </li>
                                </ul>
                            </nav>
                            <!-- /Tab Menu -->

                            <!-- Tab Content -->
                            <div class="tab-content pt-0">

                                <!-- Overview Content -->
                                <div role="tabpanel" id="doc_overview" class="tab-pane fade show active">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-12">

                                            <!-- About Details -->
                                            <div class="widget about-widget">
                                                <h4 class="widget-title">About Me</h4>
                                                <p>${doctor.description}</p>
                                            </div>
                                            <!-- /About Details -->

                                        </div>
                                    </div>
                                </div>
                                <!-- /Overview Content -->
                                
                                <!-- Reviews Content -->
                                <div role="tabpanel" id="doc_reviews" class="tab-pane fade">
                                    <c:if test="${totalfeedback != 0}">
                                        <div style="text-align: right">
                                            <button class="btn btn-small btn-primary" data-toggle="portfilter" >
                                                All<a href="sortStarComment?star=all&&sid=${detail.service_id}" style="color: yellow"> <i class="fas fa-star filled"></i></a>
                                            </button>
                                            <button class="btn btn-small btn-primary" data-toggle="portfilter" >
                                                0<a href="sortStarComment?star=0&&sid=${detail.service_id}" style="color: yellow"> <i class="fas fa-star filled"></i></a>
                                            </button>
                                            <button class="btn btn-small btn-primary" data-toggle="portfilter" >
                                                1<a href="sortStarComment?star=1&&sid=${detail.service_id}"style="color: yellow"> <i class="fas fa-star filled"></i></a>
                                            </button>
                                            <button class="btn btn-small btn-primary" data-toggle="portfilter">
                                                2<a href="sortStarComment?star=2&&sid=${detail.service_id}"style="color: yellow"> <i class="fas fa-star filled"></i></a>
                                            </button>
                                            <button class="btn btn-small btn-primary" data-toggle="portfilter" >
                                                3<a href="sortStarComment?star=3&&sid=${detail.service_id}"style="color: yellow"> <i class="fas fa-star filled"></i></a>
                                            </button>
                                            <button class="btn btn-small btn-primary" data-toggle="portfilter" >
                                                4<a href="sortStarComment?star=4&&sid=${detail.service_id}"style="color: yellow"> <i class="fas fa-star filled"></i></a>
                                            </button>
                                            <button class="btn btn-small btn-primary" data-toggle="portfilter" >
                                                5<a href="sortStarComment?star=5&&sid=${detail.service_id}"style="color: yellow"> <i class="fas fa-star filled"></i></a>
                                            </button>
                                        </div>
                                    </c:if>
                                    <c:if test="${totalfeedback == 0}">
                                        <c:if test="${sessionScope.acc.author_id == 2}">
                                            <div style="text-align: center; color: gray;">
                                                <h1 style="margin: 45px auto">No feedback! Please give us your thought!</h1>
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope.acc.author_id != 2}">
                                            <div style="text-align: center; color: gray;">
                                                <h1 style="margin: 45px auto">No feedback! Please login to Patient account and give us your thought!</h1>
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${listF == null}">
                                        <div style="text-align: center; color: gray;">
                                            <h1 style="margin: 45px auto">No feedback have ${o.rate} <i class="fas fa-star filled"></i>!</h1>
                                        </div>
                                    </c:if>
                                    <!-- Review Listing -->
                                    <div class="widget review-listing">
                                        <ul class="comments-list">
                                            <c:forEach items="${listF}" var="o">
                                                <!-- Comment List -->
                                                <li>
                                                    <div class="comment" style="width: 100%">
                                                        <img class="avatar avatar-sm rounded-circle" alt="User Image" src="assets/img/patients/patient.jpg">
                                                        <div class="comment-body" style="width: 100%">
                                                            <div id="hienlen${o.patient}">
                                                                <div class="meta-data">
                                                                    <span class="comment-author">${o.patient}</span>
                                                                    <c:if test="${o.rate == 0}">
                                                                        <div class="review-count rating">
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                        </div>
                                                                    </c:if>
                                                                    <c:if test="${o.rate == 1}">
                                                                        <div class="review-count rating">
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                        </div>
                                                                    </c:if>
                                                                    <c:if test="${o.rate == 2}">
                                                                        <div class="review-count rating">
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                        </div>
                                                                    </c:if>
                                                                    <c:if test="${o.rate == 3}">
                                                                        <div class="review-count rating">
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                        </div>
                                                                    </c:if>
                                                                    <c:if test="${o.rate == 4}">
                                                                        <div class="review-count rating">
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star"></i>
                                                                        </div>
                                                                    </c:if>
                                                                    <c:if test="${o.rate == 5}">
                                                                        <div class="review-count rating">
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star filled"></i>
                                                                            <i class="fas fa-star filled"></i>
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                                <p class="comment-content">
                                                                    ${o.content}
                                                                </p>
                                                            </div>
                                                            <c:if test="${o.patient == sessionScope.user.name}">
                                                                <button style="float: right; color: red; margin-left: 10px">
                                                                    <a style="color: red" onclick="return confirm('Are you sure you want to delete this comment?');" href="deleteFeedback?fid=${o.feedback_id}&&sid=${detail.service_id}"><i class="fas fa-trash-alt"></i></a>
                                                                </button>
                                                                <button style="float: right; color: red; margin-left: 10px" onclick="myFunctionEditfeedback()">
                                                                    <a style="color: aqua"><i class="fas fa-pencil-alt"></i></a>
                                                                </button>
                                                                <script>
                                                                    function myFunctionEditfeedback() {
                                                                        var x = document.getElementById("editfeedback");
                                                                        var y = document.getElementById("hienlen${o.patient}");
                                                                        if (x.style.display === "none") {
                                                                            x.style.display = "block";
                                                                            y.style.display = "none";
                                                                        } else {
                                                                            x.style.display = "none";
                                                                            y.style.display = "block";
                                                                        }
                                                                    }
                                                                </script>
                                                                <div id="editfeedback" style="display: none">
                                                                    <form action="editfeedback?fid=${o.feedback_id}&&serviceid=${detail.service_id}" method="post">
                                                                        <input name="patientID" value="${sessionScope.user.accountID}" style="display: none">
                                                                        <div class="form-group" style="margin-bottom: 5px">
                                                                            <div class="meta-data" style="width: 50%">
                                                                                <span class="comment-author">${o.patient}</span>
                                                                            </div>
                                                                            <div class="star-rating">
                                                                                <c:if test="${o.rate == 0}">
                                                                                    <input id="star-5" type="radio" name="rating" value="5">
                                                                                    <label for="star-5" title="5 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-4" type="radio" name="rating" value="4">
                                                                                    <label for="star-4" title="4 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-3" type="radio" name="rating" value="3">
                                                                                    <label for="star-3" title="3 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-2" type="radio" name="rating" value="2">
                                                                                    <label for="star-2" title="2 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-1" type="radio" name="rating" value="1">
                                                                                    <label for="star-1" title="1 star">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                </c:if>
                                                                                <c:if test="${o.rate == 1}">
                                                                                    <input id="star-5" type="radio" name="rating" value="5">
                                                                                    <label for="star-5" title="5 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-4" type="radio" name="rating" value="4">
                                                                                    <label for="star-4" title="4 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-3" type="radio" name="rating" value="3">
                                                                                    <label for="star-3" title="3 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-2" type="radio" name="rating" value="2">
                                                                                    <label for="star-2" title="2 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-1" type="radio" name="rating" value="1" checked>
                                                                                    <label for="star-1" title="1 star">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                </c:if>
                                                                                <c:if test="${o.rate == 2}">
                                                                                    <input id="star-5" type="radio" name="rating" value="5">
                                                                                    <label for="star-5" title="5 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-4" type="radio" name="rating" value="4">
                                                                                    <label for="star-4" title="4 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-3" type="radio" name="rating" value="3">
                                                                                    <label for="star-3" title="3 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-2" type="radio" name="rating" value="2" checked>
                                                                                    <label for="star-2" title="2 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-1" type="radio" name="rating" value="1">
                                                                                    <label for="star-1" title="1 star">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                </c:if>
                                                                                <c:if test="${o.rate == 3}">
                                                                                    <input id="star-5" type="radio" name="rating" value="5">
                                                                                    <label for="star-5" title="5 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-4" type="radio" name="rating" value="4">
                                                                                    <label for="star-4" title="4 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-3" type="radio" name="rating" value="3" checked>
                                                                                    <label for="star-3" title="3 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-2" type="radio" name="rating" value="2">
                                                                                    <label for="star-2" title="2 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-1" type="radio" name="rating" value="1">
                                                                                    <label for="star-1" title="1 star">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                </c:if>
                                                                                <c:if test="${o.rate == 4}">
                                                                                    <input id="star-5" type="radio" name="rating" value="5">
                                                                                    <label for="star-5" title="5 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-4" type="radio" name="rating" value="4" checked>
                                                                                    <label for="star-4" title="4 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-3" type="radio" name="rating" value="3">
                                                                                    <label for="star-3" title="3 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-2" type="radio" name="rating" value="2">
                                                                                    <label for="star-2" title="2 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-1" type="radio" name="rating" value="1">
                                                                                    <label for="star-1" title="1 star">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                </c:if>
                                                                                <c:if test="${o.rate == 5}">
                                                                                    <input id="star-5" type="radio" name="rating" value="5" checked>
                                                                                    <label for="star-5" title="5 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-4" type="radio" name="rating" value="4">
                                                                                    <label for="star-4" title="4 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-3" type="radio" name="rating" value="3">
                                                                                    <label for="star-3" title="3 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-2" type="radio" name="rating" value="2">
                                                                                    <label for="star-2" title="2 stars">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                    <input id="star-1" type="radio" name="rating" value="1">
                                                                                    <label for="star-1" title="1 star">
                                                                                        <i class="active fa fa-star"></i>
                                                                                    </label>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>Your review</label>
                                                                            <textarea id="review_desc" maxlength="100" class="form-control" placeholder="${o.content}" name="comment" required></textarea>
                                                                            <div class="d-flex justify-content-between mt-3"><small class="text-muted"><span id="chars">100</span> characters remaining</small></div>
                                                                        </div>
                                                                        <hr>
                                                                        <div class="submit-section">
                                                                            <button type="submit" class="btn btn-primary submit-btn">Submit Editing</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!-- /Comment List -->
                                            </c:forEach> 
                                        </ul>
                                    </div>                                    
                                    <!-- /Review Listing -->

                                    <c:if test="${sessionScope.acc.author_id == 2}">
                                        <c:if test="${check == 1}">
                                            <!-- Write Review -->
                                            <div class="write-review">
                                                <h4>Write a review for Service <strong>${detail.title}</strong></h4>                                          

                                                <!-- Write Review Form -->
                                                <form action="sendfeedback?serviceid=${detail.service_id}" method="post">
                                                    <input name="patientID" value="${sessionScope.user.accountID}" style="display: none">
                                                    <div class="form-group" style="margin-bottom: 5px">
                                                        <label>Review</label>
                                                        <div class="star-rating">
                                                            <input id="star-5" type="radio" name="rating" value="5">
                                                            <label for="star-5" title="5 stars">
                                                                <i class="active fa fa-star"></i>
                                                            </label>
                                                            <input id="star-4" type="radio" name="rating" value="4">
                                                            <label for="star-4" title="4 stars">
                                                                <i class="active fa fa-star"></i>
                                                            </label>
                                                            <input id="star-3" type="radio" name="rating" value="3">
                                                            <label for="star-3" title="3 stars">
                                                                <i class="active fa fa-star"></i>
                                                            </label>
                                                            <input id="star-2" type="radio" name="rating" value="2">
                                                            <label for="star-2" title="2 stars">
                                                                <i class="active fa fa-star"></i>
                                                            </label>
                                                            <input id="star-1" type="radio" name="rating" value="1">
                                                            <label for="star-1" title="1 star">
                                                                <i class="active fa fa-star"></i>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Your review</label>
                                                        <textarea id="review_desc" maxlength="100" class="form-control" name="comment" required></textarea>

                                                        <div class="d-flex justify-content-between mt-3"><small class="text-muted"><span id="chars">100</span> characters remaining</small></div>
                                                    </div>
                                                    <hr>
                                                    <div class="submit-section">
                                                        <button type="submit" class="btn btn-primary submit-btn">Add Review</button>
                                                    </div>
                                                </form>
                                                <!-- /Write Review Form -->
                                            </div>
                                            <!-- /Write Review -->
                                        </c:if>
                                    </c:if>
                                </div>
                                <!-- /Reviews Content -->

                                <!-- Business Hours Content -->
                                <div role="tabpanel" id="doc_business_hours" class="tab-pane fade">
                                    <div class="row">
                                        <div class="col-md-6 offset-md-3">

                                            <!-- Business Hours Widget -->
                                            <div class="widget business-widget">
                                                <div class="widget-content">
                                                    <div class="listing-hours">
                                                        <div class="listing-day current">
                                                            <div class="day">Today <span><fmt:formatDate value="<%=new java.util.Date()%>" pattern="dd/MM/yyyy"/></span></div>
                                                            <div class="time-items">
                                                                <span class="open-status"><span class="badge bg-success-light">Open Now</span></span>
                                                                <span class="time">07:00 - 17:00</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Monday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 - 17:00</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Tuesday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 - 17:00</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Wednesday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 - 17:00</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Thursday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 - 17:00</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Friday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 - 17:00</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day">
                                                            <div class="day">Saturday</div>
                                                            <div class="time-items">
                                                                <span class="time">07:00 - 17:00</span>
                                                            </div>
                                                        </div>
                                                        <div class="listing-day closed">
                                                            <div class="day">Sunday</div>
                                                            <div class="time-items">
                                                                <span class="time"><span class="badge bg-danger-light">Closed</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Business Hours Widget -->

                                        </div>
                                    </div>
                                </div>
                                <!-- /Business Hours Content -->

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