<%-- 
    Document   : view-doctor-profile
    Created on : 03-Oct-2021, 13:24:47
    Author     : Admin
--%>
<%@page import="dal.DoctorFeedbacksDAO"%>
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

        <!--Favicons--> 
        <link href="assets/img/favicon.png" rel="icon">

        <!--Bootstrap CSS--> 
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!--Fontawesome CSS--> 
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <!--Fancybox CSS--> 
        <link rel="stylesheet" href="assets/plugins/fancybox/jquery.fancybox.min.css">

        <!--Main CSS--> 
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
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
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
                                            <i class="fas fa-star ${avgrate > 0 ? "filled" : ""}"></i>
                                            <i class="fas fa-star ${avgrate > 1 ? "filled" : ""}"></i>
                                            <i class="fas fa-star ${avgrate > 2 ? "filled" : ""}"></i>
                                            <i class="fas fa-star ${avgrate > 3 ? "filled" : ""}"></i>
                                            <i class="fas fa-star ${avgrate > 4 ? "filled" : ""}"></i>
                                            <span class="d-inline-block average-rating">(${feedbacksList.size()})</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="doc-info-right">
                                    <div class="clini-infos" style="margin-bottom: 70px">
                                        <ul>
                                            <li><i class="far fa-thumbs-up"></i> ${avgrate/5*100}%</li>
                                            <li><i class="far fa-comment"></i> ${feedbacksList.size()} Feedbacks</li>
                                        </ul>
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
                                        <c:forEach items="${feedbacksList}" var="feedback">
                                            <ul class="comments-list">

                                                <!-- Comment List -->
                                                <li>
                                                    <div class="comment" style="width: 100%">
                                                        <img class="avatar avatar-sm rounded-circle" alt="user-image" src="${feedback.patient.image}">
                                                        <div class="comment-body" style="width: 100%">
                                                            <div id="show${feedback.patient}">
                                                                <div class="meta-data">
                                                                    <span class="comment-author">${feedback.patient.name}</span>
                                                                    <fmt:parseDate var="p_date" value="${feedback.date}" pattern="yyyy-MM-dd"/>
                                                                    <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                                    <span class="comment-date">Reviewed ${date}</span>
                                                                    <div class="review-count rating">
                                                                        <i class="fas fa-star ${feedback.rate > 0 ? "filled" : ""}"></i>
                                                                        <i class="fas fa-star ${feedback.rate > 1 ? "filled" : ""}"></i>
                                                                        <i class="fas fa-star ${feedback.rate > 2 ? "filled" : ""}"></i>
                                                                        <i class="fas fa-star ${feedback.rate > 3 ? "filled" : ""}"></i>
                                                                        <i class="fas fa-star ${feedback.rate > 4 ? "filled" : ""}"></i>
                                                                    </div>
                                                                </div>
                                                                <p class="comment-content">
                                                                    ${feedback.content} 
                                                                </p>
                                                            </div>

                                                            <c:if test="${feedback.patient.patientID == sessionScope.user.patientID}">
                                                                <div class="actions" style="position:absolute;margin-top: -48px;margin-left: 81%" id="editBtn">
                                                                    <a class="btn btn-sm bg-success-light" data-toggle="modal" onclick="myFunctionEditfeedback()" href="#editDoctorFeedback">
                                                                        <i class="fe fe-pencil"></i> Edit
                                                                    </a>
                                                                    <a class="btn btn-sm bg-danger-light" onclick="return confirm('Are you sure you want to delete this feedback?');" href="doctor_feedbacks?action=delete&&patient_id=${feedback.patient.patientID}&&doctor_id=${feedback.doctor.doctorID}">
                                                                        <i class="fe fe-trash"></i> Delete
                                                                    </a>
                                                                </div>
                                                                <script>
                                                                    function myFunctionEditfeedback() {
                                                                        var x = document.getElementById("editfeedback");
                                                                        var y = document.getElementById("show${feedback.patient}");
                                                                        if (x.style.display === "none") {
                                                                            x.style.display = "block";
                                                                            y.style.display = "none";
                                                                            document.getElementById("editBtn").style.marginTop = "68px";
                                                                        } else {
                                                                            x.style.display = "none";
                                                                            y.style.display = "block";
                                                                            document.getElementById("editBtn").style.marginTop = "-48px";
                                                                        }
                                                                    }
                                                                </script>
                                                                <div id="editfeedback" style="display: none">
                                                                    <form action="doctor_feedbacks" method="get">
                                                                        <div class="form-group" style="margin-bottom: 5px">
                                                                            <input type="hidden" value="edit" name="action">
                                                                            <input type="hidden" value="${feedback.patient.patientID}" name="patient_id">
                                                                            <input type="hidden" value="${feedback.doctor.doctorID}" name="doctor_id">
                                                                            <div class="meta-data" >
                                                                                <span class="comment-author">${feedback.patient.name}</span>
                                                                                <span class="comment-date">Reviewed ${date}</span>
                                                                            </div>
                                                                            <div class="star-rating">
                                                                                <input id="star-5" type="radio" name="rating" value="5" ${feedback.rate == 5 ? "checked" : ""}>
                                                                                <label for="star-5" title="5 stars">
                                                                                    <i class="active fa fa-star"></i>
                                                                                </label>
                                                                                <input id="star-4" type="radio" name="rating" value="4" ${feedback.rate == 4 ? "checked" : ""}>
                                                                                <label for="star-4" title="4 stars">
                                                                                    <i class="active fa fa-star"></i>
                                                                                </label>
                                                                                <input id="star-3" type="radio" name="rating" value="3" ${feedback.rate == 3 ? "checked" : ""}>
                                                                                <label for="star-3" title="3 stars">
                                                                                    <i class="active fa fa-star"></i>
                                                                                </label>
                                                                                <input id="star-2" type="radio" name="rating" value="2" ${feedback.rate == 2 ? "checked" : ""}>
                                                                                <label for="star-2" title="2 stars">
                                                                                    <i class="active fa fa-star"></i>
                                                                                </label>
                                                                                <input id="star-1" type="radio" name="rating" value="1" ${feedback.rate == 1 ? "checked" : ""}>
                                                                                <label for="star-1" title="1 star">
                                                                                    <i class="active fa fa-star"></i>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>Your review</label>
                                                                            <textarea id="review_desc" maxlength="100" class="form-control" placeholder="${feedback.content}" name="content" required></textarea>
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
                                            </ul>
                                        </c:forEach>

                                        <!-- Show All -->
                                        <div class="all-feedback text-center">
                                            <a href="#" class="btn btn-primary btn-sm">
                                                Show all feedback <strong>(${feedbacksList.size()})</strong>
                                            </a>
                                        </div>
                                        <!-- /Show All -->

                                    </div>
                                    <!-- /Review Listing -->

                                    <!-- Write Review -->
                                    <c:if test="${sessionScope.acc != null && check != true}">
                                        <div class="write-review">
                                            <h4>Write a review for <strong>Dr. ${doctor.name}</strong></h4>

                                            <!-- Write Review Form -->
                                            <form action="doctor_feedbacks" method="post">
                                                <input type="hidden" name="patient_id" value="${sessionScope.user.patientID}">
                                                <input type="hidden" name="doctor_id" value="${doctor.doctorID}">
                                                <div class="form-group">
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
                                                    <textarea id="review_desc" maxlength="100" class="form-control" name="content"></textarea>

                                                    <div class="d-flex justify-content-between mt-3"><small class="text-muted"><span id="chars">100</span> characters remaining</small></div>
                                                </div>
                                                <hr>
                                                <div class="submit-section">
                                                    <button type="submit" class="btn btn-primary submit-btn">Add Review</button>
                                                </div>
                                            </form>
                                            <!-- /Write Review Form -->

                                        </div>
                                    </c:if>
                                    <!-- /Write Review -->

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
                        <!-- /Doctor Details Tab -->

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

        <!-- Fancybox JS -->
        <script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

        <!-- Select2 JS -->
        <script src="assets/plugins/select2/js/select2.min.js"></script>

    </body>

    <!-- doccure/doctor-profile.html  30 Nov 2019 04:12:16 GMT -->
</html>