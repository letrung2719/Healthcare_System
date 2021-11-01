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
                            <h1>Search Doctor, Make an Appointment</h1>
                            <p>Discover the best doctors, clinic & hospital the city nearest to you.</p>
                        </div>

                        <!-- Search -->
                        <div class="search-box">
                            <form action="templateshub.net" style="justify-content: center;">
                                <div class="form-group search-info">
                                    <input type="text" class="form-control"
                                           placeholder="Search Doctors, Clinics, Hospitals, Diseases Etc">
                                    <span class="form-text">Ex : Dental or Sugar Check up etc</span>
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

            <!-- Clinic and Specialities -->
            <section class="section section-specialities">
                <div class="container-fluid">
                    <div class="section-header text-center">
                        <h2>Our best Services</h2>
                        <p class="sub-title">Here are our 10 best services that have been greatly appreciated by our patients. For more information please select the service you want.</p>
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
                                <p>Lorem Ipsum is simply dummy text </p>
                            </div>
                            <div class="about-content">
                                <p>It is a long established fact that a reader will be distracted by the readable content of
                                    a page when looking at its layout. The point of using Lorem Ipsum.</p>
                                <p>web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem
                                    ipsum' will uncover many web sites still in their infancy. Various versions have evolved
                                    over the years, sometimes</p>
                                <a href="javascript:;">Read More..</a>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="doctor-slider slider">
                                <c:forEach items="${listDoctors}" var="doctor">
                                    <!-- Doctor Widget -->
                                    <div class="profile-widget">
                                        <div class="doc-img">
                                            <a href="doctor-profile.html">
                                                <img class="img-fluid" style="height: 200px" alt="User Image" src="${doctor.image}">
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
                                            <ul class="available-info">
                                                <li>
                                                    <i class="fas fa-map-marker-alt"></i> Florida, USA
                                                </li>
                                                <li>
                                                    <i class="far fa-clock"></i> Available on Fri, 22 Mar
                                                </li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i> $300 - $1000
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
                                <h2 class="mt-2">Availabe Specialities in Our Clinic</h2>
                                <p>It is a long established fact that a reader will be distracted by the readable content of
                                    a page when looking at its layout. </p>
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