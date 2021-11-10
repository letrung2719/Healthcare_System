<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ServiceFeedbacks"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dal.ServicesDAO"%>
<!DOCTYPE html>
<html lang="en">

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

        <!-- Datetimepicker CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

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
                        <div class="col-md-8 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="home">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        <a href="services">Services</a>
                                    </li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Available Services in Our System</h2>
                        </div>
                        <div class="col-md-4 col-12 d-md-block d-none">
                            <div class="sort-by">
                                <span class="sort-title">Sort by</span>
                                <span class="sortby-fliter">
                                    <form action="sortlistservices" method="get" name="sorting_form">
                                        <select class="select" name="id" onChange="document.sorting_form.submit();">
                                            <option>Select</option>
                                            <option class="sorting" value="1">Highest</option>
                                            <option class="sorting" value="2">Lowest</option>
                                            <option class="sorting" value="3">Alphabetical Order</option>
                                        </select>
                                    </form>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

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
                                <c:set var="feedbackDB" value="<%=new ServicesDAO()%>"></c:set>
                                <c:set var="avgrate" value="${feedbackDB.averageRateServices(o.service_id)}"></c:set>
                                <c:set var="feedbackList" value="${feedbackDB.getAllComment(o.service_id)}"></c:set>
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

                                                    <h5 class="doc-department"><img src="assets/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">${o.type_id}</h5>
                                                    <div class="rating">
                                                        <i class="fas fa-star ${avgrate > 0 ? "filled" : ""}"></i>
                                                        <i class="fas fa-star ${avgrate > 1 ? "filled" : ""}"></i>
                                                        <i class="fas fa-star ${avgrate > 2 ? "filled" : ""}"></i>
                                                        <i class="fas fa-star ${avgrate > 3 ? "filled" : ""}"></i>
                                                        <i class="fas fa-star ${avgrate > 4 ? "filled" : ""}"></i>
                                                        <span class="d-inline-block average-rating">(${feedbackList.size()})</span>
                                                    </div>
                                                    <div class="clinic-details">
                                                        <b>Description:</b><p style="margin: 0;width: 90%;height: 60px;overflow: hidden;-webkit-mask-image: linear-gradient(180deg, #000 75%, transparent);">${o.description}</p>
                                                        <b><a style="color: aqua" href="serdetail?sid=${o.service_id}">See more...</a></b>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="doc-info-right">
                                                <div class="clini-infos">
                                                    <ul>
                                                        <li><i class="far fa-thumbs-up"></i> ${avgrate/5*100}%</li>
                                                        <li><i class="far fa-comment"></i> ${feedbackList.size()} Feedbacks</li>
                                                        <li><i class="far fa-money-bill-alt"></i> ${o.price} VND</li>
                                                    </ul>
                                                </div>
                                                <div class="clinic-booking">
                                                    <div class="clinic-booking">
                                                        <a class="view-pro-btn" href="serdetail?sid=${o.service_id}">View Details</a>
                                                        <a class="apt-btn" href="reservation?id=${o.service_id}">Book Service</a>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Doctor Widget -->
                            </c:forEach>

                            <div class="load-more text-center">
                                <ul class="pagination">
                                    <li class="page-item ">
                                        <a class="page-link" href="services?page=${page-1}">Previous</a>
                                    </li>
                                    <c:set var="page" value="${requestScope.page}"/>
                                    <c:forEach begin="1" end="${pageNumber}" var="i">
                                        <li class="page-item ${page==i?"active":""}"><a class="page-link"  href="services?page=${i}">${i}</a></li>
                                        </c:forEach>

                                    <li class="page-item">
                                        <a class="page-link" href="services?page=${page+1}">Next</a>
                                    </li>
                                </ul>	
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

            <!-- Sticky Sidebar JS -->
            <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
            <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

            <!-- Select2 JS -->
            <script src="assets/plugins/select2/js/select2.min.js"></script>

            <!-- Datetimepicker JS -->
            <script src="assets/js/moment.min.js"></script>
            <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

            <!-- Fancybox JS -->
            <script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>

            <!-- Custom JS -->
            <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/  30 Nov 2019 04:11:53 GMT -->

</html>