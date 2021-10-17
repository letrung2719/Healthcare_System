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
            <!-- Breadcrumb -->
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
                                        <a href="services">Blogs</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        ${blog.title}
                                    </li>
                                </ol>
                            </nav>
                             <h2 class="breadcrumb-title">Information about our hospital</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->
            <!-- Page Content -->
			<div class="content">
				<div class="container">
					<div class="row">
						<div class="col-12">
                                                    <h4 class="blog-name"style="justify-content: center;">${blog.title}</h4>
                                                      <h6 class="blog-date"> ${blog.date}</h6>
							<a href="blog-detail?id=${blog.blogID}">
                                                        <img src="${blog.image}" class="img-fluid" alt="User Image">
                                                    </a>
                                                </div>
                                                <div class="doc-info-cont">
                                                    
                                                  
                                                    <span style="padding: 5px;" class="blog-description"> ${blog.description}</span>
                                                   
           
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