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
                            <div class="col-sm-5 col">
                                <a href="#Add_Specialities_details" data-toggle="modal" class="btn btn-primary float-right mt-2">Add</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12" style="display: flex;padding: 0">
                        <div class="col-sm-2" style=" margin: 10px; padding: 0;height: 325px">
                            <div class="modal-dialog modal-dialog-centered" style="margin: 0 !important" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Search Filter</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form action="search-blog" method="post">
                                            <div class="row form-row">
                                                <div class="row form-row">
                                                    <div class="col-12 col-sm-12">
                                                        <div class="form-group">
                                                            <label class="text-primary">Title</label>
                                                            <input
                                                                type="text"
                                                                class="form-control col-12 col-sm-12"
                                                                value=""
                                                                name="title"
                                                                />
                                                        </div>
                                                    </div>


                                                    <div class="col-12 col-sm-12">
                                                        <div class="form-group card-label">
                                                            <label for="card_name" style="margin-bottom: 14px">Date</label>
                                                            <input class="form-control col-12 col-sm-12" id="card_name" type="date" name="date" value="" >
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary btn-block">
                                                Search
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-10" style=" margin: 0; padding: 0;">
                            <!-- /Page Header -->
                            <div class="row" >
                                <div class="col-sm-12"　style="padding: 0 !important;">
                                    <div class="card">
                                        <div class="card-body modal-content"> 
                                            <div class="table-responsive ">
                                                <table class="datatable table table-hover table-center mb-0 "> 
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th style="max-width: 200px;">Title</th>
                                                            <th>Date</th>
                                                            <th>Image</th>
                                                            <th style="margin-right: 50px; padding-right: 50px; ">Description</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listBlog}" var="blog">
                                                            <tr>
                                                                <!-- >Doctor ID-->
                                                                <td>${blog.blogID}</td>

                                                                <td> <!-- title-->
                                                                    <p class="table-avatar">
                                                                        <a class="avatar avatar-sm mr-2 "><img class="avatar-img rounded-circle" src="${blog.image}" alt="Doctor Image"></a>
                                                                        <a class="text_over" style="text-overflow:ellipsis;">${blog.title}</a>
                                                                    </p>
                                                                </td>
                                                                <!-- >Date-->
                                                                <td>${blog.date} </td>
                                                                <!-- >Description-->
                                                                <td>
                                                                    <img src="${blog.image}" style="width: 120px; height: 120px;" class="serdashboard-image" alt="image service">
                                                                </td>

                                                        <style>
                                                            .text_over {
                                                                white-space: nowrap;
                                                                width: 200px;

                                                                overflow: hidden;
                                                                text-overflow: clip;
                                                            }
                                                            .text_over:hover{
                                                                overflow: visible;
                                                            }
                                                        </style>

                                                        <td>
                                                            <div class="clinic-details text_over" style="text-overflow:ellipsis;">
                                                                <p>${blog.description}</p>

                                                            </div>
                                                        </td>
                                                        <!--                                                            Action-->
                                                        <td class="text-right">
                                                            <div class="actions">
                                                                <a class="btn btn-sm bg-success-light" data-toggle="modal" href="#edit_specialities_details${blog.blogID}">
                                                                    <i class="fe fe-pencil"></i> Edit
                                                                </a>
                                                                <a data-toggle="modal" href="#delete_modal${blog.blogID}" class="btn btn-sm bg-danger-light">
                                                                    <i class="fe fe-trash"></i> Delete
                                                                </a>
                                                            </div>
                                                        </td>
                                                        </tr>
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
                                                                                            <textarea class="form-control" name="description" required="">${blog.description}</textarea>

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

                                                        <!-- Delete Modal -->
                                                        <div class="modal fade" id="delete_modal${blog.blogID}" aria-hidden="true" role="dialog">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">

                                                                    <div class="modal-body" style="text-align: center">
                                                                        <div class="form-content p-2">
                                                                            <h4 class="modal-title">Delete</h4>
                                                                            <p class="mb-4">Are you sure want to delete?</p>
                                                                            <a href="delete-blog?blogId=${blog.blogID}"><button type="button" class="btn btn-primary">Save</button></a>
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
                                                    <input type="text" class="form-control" value="" name="title">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 ">
                                                <div class="form-group ">
                                                    <label>Image</label>
                                                    <input type="text" class="form-control " name="image">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 ">
                                                <div class="form-group ">
                                                    <label>Description</label>
                                                    <!--<input type="text" class="form-control " value=" " name="email">-->
                                                    <textarea class="form-control" name="description"></textarea>
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

    </body>

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/doctor-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->
</html>