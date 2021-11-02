<%@page import="model.DoctorFeedbacks"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dal.DoctorFeedbacksDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <!-- Home Banner -->
            <section class="section section-search">
                <div class="container-fluid">
                    <div class="banner-wrapper">
                        <div class="banner-header text-center">
                            <h1>Doccure Healthcare System</h1>
                            <p>Discover the best doctors and services in our hospital.</p>
                            <p>Your health is our top priority.</p>
                        </div>

                    </div>
                </div>
            </section>
            <!-- /Home Banner -->

            <!-- Clinic and Specialities -->
            <section class="section section-specialities">
                <div class="container-fluid">
                    <div class="section-header text-center">
                        <h2>Our Best Services</h2>
                        <p class="sub-title">Here are our 10 best services that have been greatly appreciated by our patients. For more information, please select the service you want.</p>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <!-- Slider -->
                            <div class="specialities-slider slider">
<<<<<<< HEAD
                                <c:forEach items="${listDoctors}" var="doctor">
                                    <!-- Slider Item -->
                                    <div class="speicality-item text-center">
                                        <div class="speicality-img">
                                            <img src="assets/img/specialities/specialities-01.png" class="img-fluid"
                                                 alt="Speciality">
                                            <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                        </div>
                                        <p>Urology</p>
                                    </div>
                                    <!-- /Slider Item -->
                                </c:forEach>
                                    
                                <!-- Slider Item -->
                                <div class="speicality-item text-center">
                                    <div class="speicality-img">
                                        <img src="assets/img/specialities/specialities-02.png" class="img-fluid" alt="Speciality">
                                        <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                    </div>
                                    <p>Neurology</p>
                                </div>
                                <!-- /Slider Item -->

                                <!-- Slider Item -->
                                <div class="speicality-item text-center">
                                    <div class="speicality-img">
                                        <img src="assets/img/specialities/specialities-03.png" class="img-fluid"
                                             alt="Speciality">
                                        <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                    </div>
                                    <p>Orthopedic</p>
                                </div>
                                <!-- /Slider Item -->

                                <!-- Slider Item -->
                                <div class="speicality-item text-center">
                                    <div class="speicality-img">
                                        <img src="assets/img/specialities/specialities-04.png" class="img-fluid"
                                             alt="Speciality">
                                        <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                    </div>
                                    <p>Cardiologist</p>
                                </div>
                                <!-- /Slider Item -->

                                <!-- Slider Item -->
                                <div class="speicality-item text-center">
                                    <div class="speicality-img">
                                        <img src="assets/img/specialities/specialities-05.png" class="img-fluid"
                                             alt="Speciality">
                                        <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                    </div>
                                    <p>Dentist</p>
                                </div>
                                <!-- /Slider Item -->

=======
                                <c:forEach items="${listSer}" var="o">
                                    <!-- Slider Item -->
                                    <div class="speicality-item text-center">
                                        <div class="speicality-img">
                                            <img style="margin: 0 auto;border-radius: 50%;" src="${o.image}" class="img-fluid"
                                                 alt="Speciality">
                                            <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                        </div>
                                        <a href="serdetail?sid=${o.service_id}"><p style="width: 150px;font-size: 14px">${o.title}</p></a>
                                    </div>
                                    <!-- /Slider Item -->
                                </c:forEach>
>>>>>>> 90834e8ac511d9a9984855dd396bdb12184c8570
                            </div>
                            <!-- /Slider -->

                        </div>
                    </div>
                </div>
            </section>
            <!-- Clinic and Specialities -->

            <!-- Popular Section -->
            <section class="section section-doctor">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="section-header ">
                                <h2>Book Our Doctor</h2>
                            </div>
                            <div class="about-content">
                                <p>Doccure gathers a team of experts, doctors, pharmacists and nurses who are highly trained and receive in depth training in Vietnam and many countries with developed Medicine such as the US, UK, France … Vinmec always considers patients as the core, and commits to providing comprehensive and high quality healthcare services to our customers.</p>
                                <a href="javascript:;">Read More..</a>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="doctor-slider slider">
                                <c:forEach items="${listDoctors}" var="doctor">
                                    <c:set var="feedbackDB" value="<%=new DoctorFeedbacksDAO()%>"></c:set>
                                    <c:set var="avgrate" value="${feedbackDB.getAverageRating(doctor.doctorID)}"></c:set>
                                    <c:set var="feedbackList" value="${feedbackDB.getAllDoctorFeedbacks(doctor.doctorID)}"></c:set>
                                        <!-- Doctor Widget -->
                                        <div class="profile-widget">
                                            <div class="doc-img">
                                                <a href="doctor_profile_view?id=${doctor.accountID}"">
                                                    <img class="img-fluid" style="height: 250px" alt="User Image" src="${doctor.image}">
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="doctor_profile_view?id=${doctor.accountID}">${doctor.name}</a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="speciality">${doctor.role}</p>
<<<<<<< HEAD
<<<<<<< HEAD
                                            <div class="rating">
=======
<!--                                            <div class="rating">
>>>>>>> 90834e8ac511d9a9984855dd396bdb12184c8570
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <span class="d-inline-block average-rating">(17)</span>
<<<<<<< HEAD
                                            </div>
=======
                                            </div>-->
>>>>>>> 90834e8ac511d9a9984855dd396bdb12184c8570
=======
                                            <div class="doc-info-cont">
                                                <div class="rating">
                                                    <i class="fas fa-star ${avgrate > 0 ? "filled" : ""}"></i>
                                                    <i class="fas fa-star ${avgrate > 1 ? "filled" : ""}"></i>
                                                    <i class="fas fa-star ${avgrate > 2 ? "filled" : ""}"></i>
                                                    <i class="fas fa-star ${avgrate > 3 ? "filled" : ""}"></i>
                                                    <i class="fas fa-star ${avgrate > 4 ? "filled" : ""}"></i>
                                                    <span class="d-inline-block average-rating">(${feedbackList.size()})</span>
                                                </div>
                                            </div>
>>>>>>> 6339d5ab2a4e24c0bf27ca33af7c3fa51e7aebeb
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
                                                    <a href="doctor_profile_view?id=${doctor.accountID}" class="btn view-btn">View Profile</a>
                                                </div>
                                                <div class="col-6">
                                                    <a href="booking?account_id=${doctor.accountID}" class="btn book-btn">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Doctor Widget -->
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- /Popular Section -->

            <!-- Availabe Features -->
            <section class="section section-features">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-5 features-img">
                            <img src="assets/img/features/feature.png" class="img-fluid" alt="Feature">
                        </div>
                        <div class="col-md-7">
                            <div class="section-header">
                                <h2 class="mt-2">Available Specialities in Our System</h2>
                                <p>Doccure Healthcare System is a not-for profit institution, invested by HKTMC Corporation - Vietnam’s leading private economic consortium with the mission of “We care with compassion, professionalism, and wisdom”.</p>
                            </div>
                            <div class="features-slider slider">
                                <c:forEach items="${listSpec}" var="listSpec">
                                    <!-- Slider Item -->
                                    <div class="feature-item text-center">
                                        <img style="margin: 0 auto" src="assets/img/features/feature-01.jpg" class="img-fluid" alt="Feature">
                                        <p style="width: 138px">${listSpec.name}</p>
                                    </div>
                                    <!-- /Slider Item -->
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Availabe Features -->
            
            <!--Google Map-->
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.485409531647!2d105.52487561533206!3d21.013254993682363!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2sFPT%20University!5e0!3m2!1sen!2s!4v1635783917552!5m2!1sen!2s" width="100%" height="500" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            <!--Google Map-->
            
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

    <!-- doccure/  30 Nov 2019 04:11:53 GMT -->

</html>