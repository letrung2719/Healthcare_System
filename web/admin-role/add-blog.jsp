<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>
        <!--[if lt IE 9]>
                            <script src="assets/js/html5shiv.min.js"></script>
                            <script src="assets/js/respond.min.js"></script>
                    <![endif]-->
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
                            <div class="col-sm-7 col-auto">
                                <h3 class="page-title">Blogs Management</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-home">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Blogs</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <p class="text-danger">${mess}</p>
                    <form method="post" action="addblog">
                        <label>Title:</label>
                        <br>
                        <input type="text" class="form-control" name="title">
                        <br>
                        <label>Image:</label>
                        <input type="text" class="form-control " name="image">
                        <br>
                        <label>Description:</label>
                        <!--<input type="text" class="form-control " value=" " name="email">-->
                        <textarea rows="50"cols="200" class="form-control" id="description1" name="description"></textarea>
                        <button style="margin-top: 30px; width: 100px " type="submit" class="btn btn-primary btn-block">Add New</button>
                    </form>
                    <!-- /Page Header -->
                </div>

            </div>

            <!-- Add Modal -->
            <div class="modal fade" id="Add_Specialities_details" aria-hidden="true" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add a Blog</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="addblog" method="post">
                                <div class="row form-row">
                                    <div class="row form-row">
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group">
                                                <label>Title</label>
                                                <input type="text" class="form-control" value="" name="title" required="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 ">
                                            <div class="form-group ">
                                                <label>Image</label>
                                                <input type="text" class="form-control " name="image" required="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 ">
                                            <div class="form-group ">
                                                <label>Description</label>
                                                <!--<input type="text" class="form-control " value=" " name="email">-->
                                                <textarea class="form-control" id="description1" name="description" required=""></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- /Page Wrapper -->

        <script>
            CKEDITOR.replace('description1');
            CKEDITOR.replace('description2');
        </script>
    </div>
    <!-- /Main Wrapper -->



    <!-- jQuery -->
    <script src="assets/js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Datatables JS -->
    <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="assets/plugins/datatables/datatables.min.js"></script>

    <!-- Custom JS -->
    <script src="assets/js/script.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>

</body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/doctor-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->
</html>