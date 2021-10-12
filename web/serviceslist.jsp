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
            
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="index.jsp">Home</a>
                                    </li>
                                    <li class="breadcrumb-item " >
                                        <a href="services">Services</a>
                                    </li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Available Services in Our Clinic</h2>
                        </div>
                    </div>
                </div>
            </div>
                        
            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">

                            <!-- Search Filter -->
                            <div class="card search-filter">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Search Filter</h4>
                                    <div class="card-body">
                                        <form action="sortlistservices?id=0" method="post">
                                            <div class="input-group">
                                                <input value="${tim}" name="txt" type="text" class="form-control" placeholder="Search">
                                                <button style="width: 50px;border: 0px;background-color: white" type="submit"><i class="fa fa-search"></i></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="filter-widget">
                                        <h4>Sort list</h4>
                                        <style>
                                            a:hover {
                                                color: aqua !important;
                                            }
                                        </style>
                                        <a href="sortlistservices?id=1" class="text-muted"><i class="fas fa-angle-up text-primary"></i>  Sort by highest to lowest Price</a><br>
                                        <a href="sortlistservices?id=2" class="text-muted"><i class="fas fa-angle-down text-primary"></i>  Sort by lowest to highest Price</a><br>
                                        <a href="sortlistservices?id=3" class="text-muted"><i class="fas fa-notes-medical text-primary"></i>  Sort by Specialist list</a><br>
                                    </div>
                                </div>
                                <div class="card-body"> 
                                    <form action="searchspecialities" method="post">
                                        <div class="filter-widget">
                                            <h4>Select Specialist</h4>
                                            <c:forEach items="${listSpecialities}" var="o">
                                                <div>
                                                    <label class="custom_check">
                                                        <input type="checkbox" value="${o.name}" name="select_specialist">
                                                        <span class="checkmark"></span> ${o.name}
                                                    </label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="btn-search">
                                            <button type="submit" class="btn btn-block">Search</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /Search Filter -->

                        </div>

                        <div class="col-md-12 col-lg-8 col-xl-9">
                            <c:forEach items="${listServices}" var="o">
                                <!-- Doctor Widget -->
                                <div class="card">
                                    <div class="card-body">
                                        <div class="doctor-widget">
                                            <div class="doc-info-left">
                                                <div class="doctor-img">
                                                    <a href="serdetail?sid=${o.service_id}">
                                                        <img src="${o.image}" class="img-fluid" alt="User Image">
                                                    </a>
                                                </div>
                                                <div class="doc-info-cont">
                                                    <h4 class="doc-name"><a href="serdetail?sid=${o.service_id}">${o.title}</a></h4>
                                                    <h5 class="doc-department">${o.type_id}</h5>
                                                    <div class="rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star"></i>
                                                        <span class="d-inline-block average-rating">(17)</span>
                                                    </div>
                                                    <div class="clinic-details">
                                                        <p class="doc-location"><i class="fas fa-map-marker-alt"></i> Florida, USA</p>
                                                        <ul class="clinic-gallery">
                                                            <li>
                                                                <a href="assets/img/features/feature-01.jpg" data-fancybox="gallery">
                                                                    <img src="assets/img/features/feature-01.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="assets/img/features/feature-02.jpg" data-fancybox="gallery">
                                                                    <img  src="assets/img/features/feature-02.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="assets/img/features/feature-03.jpg" data-fancybox="gallery">
                                                                    <img src="assets/img/features/feature-03.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="assets/img/features/feature-04.jpg" data-fancybox="gallery">
                                                                    <img src="assets/img/features/feature-04.jpg" alt="Feature">
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="clinic-services">
                                                        <span>Dental Fillings</span>
                                                        <span> Whitening</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="doc-info-right">
                                                <div class="clini-infos">
                                                    <ul>
                                                        <li><i class="far fa-thumbs-up"></i> 98%</li>
                                                        <li><i class="far fa-comment"></i> 17 Feedback</li>
                                                        <li><i class="fas fa-map-marker-alt"></i> Florida, USA</li>
                                                        <li><i class="far fa-money-bill-alt"></i> ${o.price} VND</li>
                                                    </ul>
                                                </div>
                                                <div class="clinic-booking">
                                                    <a class="view-pro-btn" href="serdetail?sid=${o.service_id}">View Profile</a>
                                                    <a class="apt-btn" href="booking.html">Book Appointment</a>
                                                </div>
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

        <!-- Slick JS -->
        <script src="assets/js/slick.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/  30 Nov 2019 04:11:53 GMT -->

</html>