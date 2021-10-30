<%-- 
    Document   : admin-ServiceDashboard
    Created on : 08-10-2021, 17:05:04
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/patient-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Reviews Page</title>

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">

        <!-- Datatables CSS -->
        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

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

            <!-- Sidebar -->
            <%@include file="index-sidebar.jsp" %>
            <!-- Sidebar -->



            <!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="page-title">Reviews</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Reviews</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="datatable table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th style="margin-right: 20px !important; padding-right: 15px">ID</th>
                                                    <th style="margin-right: 40px; padding-right: 165px">Service Name</th>
                                                    <th style="margin-right: 40px;">Ratings</th>
                                                    <th>image</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach items="${serD}" var="o">
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">

                                                                <a href="serfeed?id=${o.service_id}">${o.service_id}</a>
                                                            </h2>
                                                        </td>
                                                        <td>
                                                            <h2 class="table-avatar">

                                                                <a href="serfeed?id=${o.service_id}">${o.title} </a>
                                                            </h2>
                                                        </td>
                                                        <td class="table-avatar">
                                                            <div class="table-avatar">
                                                                <c:if test="${o.description == 0}">
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                </c:if>
                                                                <c:if test="${o.description == '1'}">
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                </c:if>


                                                                <c:if test="${o.description == '2'}">
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                </c:if>
                                                                <c:if test="${o.description == '3'}">
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                </c:if>
                                                                <c:if test="${o.description == '4'}">
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star-o text-secondary"></i>
                                                                </c:if>
                                                                <c:if test="${o.description == '5'}">
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star text-warning"></i>
                                                                    <i class="fe fe-star text-warning"></i>
                                                                </c:if>
                                                            </div>

                                                        </td>


                                                        <td>
                                                            <img src="${o.image}" style="width: 150px; height: 150px;" class="serdashboard-image" alt="image service">


                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>			
                    </div>

                </div>			
            </div>
            <!-- /Page Wrapper -->

            <!-- jQuery -->
            <script src="assets/js/jquery-3.2.1.min.js "></script>

            <!-- Bootstrap Core JS -->
            <script src="assets/js/popper.min.js "></script>
            <script src="assets/js/bootstrap.min.js "></script>

            <!-- Slimscroll JS -->
            <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js "></script>

            <!-- Datatables JS -->
            <script src="assets/plugins/datatables/jquery.dataTables.min.js "></script>
            <script src="assets/plugins/datatables/datatables.min.js "></script>

            <!-- Custom JS -->
            <script src="assets/js/script.js "></script>

    </body>

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/patient-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:52 GMT -->

</html>