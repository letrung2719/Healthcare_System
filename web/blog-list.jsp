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
                                        <a href="services">Blogs</a>
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
                        <div class="col-lg-8">

                            <!-- Doctor Widget -->
                            <div class="card">
                                <div class="card-body">
                                    <div class="doctor-widget">
                                        <div class="doc-info-left">

                                            <div class="clinic-details">
                                                <c:forEach items="${listBlog}" var="blog">
                                                    <!-- Blog Widget -->
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="doctor-widget">
                                                                <div class="doc-info-left">
                                                                    <div class="doctor-img">

                                                                        <a href="blog-detail?id=${blog.blogID}">
                                                                            <img src="${blog.image}" class="img-fluid" alt="User Image">
                                                                        </a>
                                                                    </div>
                                                                    <div class="doc-info-cont">
                                                                        <h4 class="blog-name"><a href="blog-detail?id=${blog.blogID}">${blog.title}</a></h4>
                                                                        <fmt:parseDate var="p_date" value="${blog.date}" pattern="yyyy/MM/dd"/>
                                                                        <fmt:formatDate var="date" value="${p_date}" pattern="dd-MMM-yyyy"/>
                                                                        <h6>${date}</h6>                                                                       
                                                                        <b>Description:</b><p style="margin: 0;width: 90%;height: 60px;overflow: hidden;-webkit-mask-image: linear-gradient(180deg, #000 75%, transparent);">${blog.description}</p>
                                                                        <b><a style="color: aqua" href="blog-detail?id=${blog.blogID}">See more...</a></b>
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
                            </div>
                            <!-- /Doctor Widget -->                              
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

<!-- doccure/  30 Nov 2019 04:11:53 GMT -->

</html>