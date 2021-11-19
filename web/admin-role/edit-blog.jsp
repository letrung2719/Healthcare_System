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
        <title>blog-managerment</title>

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
                                <h3 class="page-title">List of Doctors</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Admin</a></li>

                                    <li class="breadcrumb-item active">Blogs</li>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <style>
                        label{
                            width: 100%;
                            padding: 5px;
                        }
                        #image{
                            width: 30% !important;
                        }
                        input{

                            margin: 5px;
                            margin-bottom: 15px;
                        }


                    </style>
                    <form method="post" action="edit-blog">

                        <label>ID</label>

                        <input name="blogId" class="form-control" type="text" readonly value="${blog.blogID}">
                        <label>Title:</label>

                        <br>
                        <input type="text" class="form-control " name="title" value="${blog.title}" required=""> 

                        <label>Date</label>
                        <input type="text " class="form-control " value="${blog.date} " name="date" readonly required="">
                        <br>
                        <label>Image:</label>
                        <input type="text" class="form-control " value="${blog.image} " id="image" name="image" required="">
                        <br>


                        <label>Description</label>
                        <!--<input type="text" class="form-control " value=" " name="email">-->
                        <textarea rows="50"cols="200" class="form-control" id="description1"  name="description" required="">${blog.description}</textarea>
                        
                        <button style="margin-top: 50px; " type="submit" class="btn btn-primary btn-block">Save</button>

                    </form>

                    <!-- /Page Header -->
                </div>

            </div>

            <!-- Edit Details Modal -->
            <div class="modal fade" id="edit_specialities_details${blog.blogID}" aria-hidden="true" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Blog</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p class="text-danger">${mess}</p>
                            <form action="edit-blog" method="post">
                                <div class="row form-row">
                                    <div class="row form-row">
                                        <input name="blogId" class="form-control" type="text" readonly value="${blog.blogID}">

                                        <div class="col-12 col-sm-12">
                                            <div class="form-group">
                                                <label>Title</label>
                                                <textarea class="form-control" name="title" required="">${blog.title}</textarea>
                                            </div>
                                        </div>


                                        <div class="col-12 col-sm-12 ">
                                            <div class="form-group ">
                                                <label>Date</label>
                                                <input type="text " class="form-control " value="${blog.date} " name="date" readonly required="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 ">
                                            <div class="form-group ">
                                                <label>Image</label>
                                                <input type="text " class="form-control " value="${blog.image} " name="image" required="">
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 ">
                                            <div class="form-group ">
                                                <label>Description</label>
                                                <textarea class="form-control"  id="description2" name="description" required="">${blog.description}</textarea>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Save Changes</button>
                            </form>


                        </div>
                    </div>
                </div>
            </div>
            <!-- /Edit Details Modal -->


        </div>
        <!-- /Page Wrapper -->

        <script>


            CKEDITOR.replace('description1');
            CKEDITOR.replace('description2');

        </script>
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