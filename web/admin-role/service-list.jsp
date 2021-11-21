<%-- 
    Document   : servlet-list
    Created on : Nov 2, 2021, 11:08:10 AM
    Author     : admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/doctor-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure Admin</title>

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
        <style>
            tr:hover{
                cursor: pointer;
            } 
        </style>
    </head>

    <body>

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <%@include file="index-header.jsp" %>
            <!-- /Header -->

            <!-- Sidebar -->
            <%@include file="index-sidebar.jsp" %>
            <!-- /Sidebar -->

            <!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="page-title">Services Management</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-home">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Services</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Page Header -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-body">
                                <form action="search-service" method="post">
                                    <div class="form-row">
                                        <div class="col-4 col-sm-3 form-group">
                                            <label>Service Name</label>
                                            <input type="text" class="form-control" value="${tim}" name="txt"/>
                                        </div>                                            
                                        <div class="col-4 col-sm-3 form-group">
                                            <label>Select Specialities</label>
                                            <select class="form-control">                                                   
                                                <option value="">Open this select menu</option>
                                                <c:forEach items="${listSpec}" var="spec">
                                                    <option value="${spec.name}">${spec.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <button style="height: 20%; align-self: center; margin: 12px 0 0 30px" class="btn btn-primary" type="submit" >
                                            Search
                                        </button>
                                    </div>
                                </form> 
                            </div>

                            <div class="card">
                                <div class="card-body">                                                
                                    <div class="table-responsive">
                                        <table class="datatable table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Service Name</th>
                                                    <th>Specialities</th>
                                                    <th>Price</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listServices}" var="o">
                                                    <tr>
                                                        <!-- >Service ID-->
                                                        <td>${o.service_id}</td>
                                                        <td><!-- name-->
                                                            <h2 class="table-avatar">
                                                                <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="${o.image}" alt="Service Image"></a>
                                                                <a href="service-detail-ad?id=${o.service_id}&&star=all">${o.title}</a>
                                                            </h2>
                                                        </td>
                                                        <!-- >Speciality-->
                                                        <td>${o.type_id}</td>                                                           
                                                        <!-- >Phone -->
                                                        <td><fmt:formatNumber value="${o.price}" type="number"></fmt:formatNumber> VND</td>
                                                        <td>
                                                            <div class="actions">
                                                                <a class="btn btn-sm bg-success-light" data-toggle="modal" href="#edit_specialities_details${o.service_id}">
                                                                    <i class="fe fe-pencil"></i> Edit
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <!-- Edit Modal -->
                                                <div class="modal fade" id="edit_specialities_details${o.service_id}" aria-hidden="true" role="dialog">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Edit Service</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="update-service" method="post">
                                                                    <div class="row form-row">
                                                                        <input name="id" type="hidden" value="${o.service_id}">
                                                                        <div class="col-12 col-sm-12">
                                                                            <div class="form-group">
                                                                                <label>Title</label>
                                                                                <input type="text" class="form-control" value="${o.title}" name="title" required="">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-12">
                                                                            <div class="form-group">
                                                                                <label>Image</label>
                                                                                <input type="text" class="form-control" value="${o.image}" name="image" required="">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-12">
                                                                            <div class="form-group">
                                                                                <label>Price</label>
                                                                                <input type="text" class="form-control" value="${o.price}" name="price" required="">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12 col-sm-12 ">
                                                                            <div class="form-group ">
                                                                                <label>Description</label>
                                                                                <input type="text " class="form-control " value="${o.description}" name="description" required="" >
                                                                            </div>
                                                                        </div> 

                                                                    </div>
                                                                    <button type="submit" class="btn btn-primary btn-block">Save Changes</button>       
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>  
                                                <!-- Edit Modal -->

                                                <!-- Delete Modal -->
                                                <div class="modal fade" id="delete_modal${o.service_id}" aria-hidden="true" role="dialog">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-body" style="text-align: center">
                                                                <div class="form-content p-2">
                                                                    <h4 class="modal-title">Delete</h4>
                                                                    <p class="mb-4">Are you sure want to delete?</p>
                                                                    <a href="delete-service-list?id=${o.service_id}"><button type="button" class="btn btn-primary">Save</button></a>
                                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Delete Modal -->

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

        </div>
        <!-- /Main Wrapper -->

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

</html>
