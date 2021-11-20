<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <h3 class="page-title">Blogs Management</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-home">Dashboard</a></li>

                                    <li class="breadcrumb-item active">Blogs</li>
                                </ul>
                            </div>

                            <div class="col-sm-5 col-auto" style="text-align: right">
                                <a href="add-blog.jsp"  class="btn btn-primary float-right mt-2">Add</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-body">
                                <form action="search-blog" method="post">
                                    <div class="row form-row">
                                        <div class="col-4 col-sm-3 form-group">
                                            <label>Title</label>
                                            <input type="text" class="form-control col-12 col-sm-12" value="" name="title" />
                                        </div>
                                        <div class="col-4 col-sm-3 form-group">
                                            <div class="form-group card-label">
                                                <label>Date</label>
                                                <input class="form-control col-12 col-sm-12" id="card_name" type="date" name="date" value="" >
                                            </div>
                                        </div>
                                        <label class="text-primary"></label>
                                        <button style="height: 20%; align-self: center; margin: -10px 0 0 30px" class="btn btn-primary" type="submit">
                                            Search
                                        </button>
                                    </div>
                                </form>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive ">
                                        <table class="datatable table table-hover table-center mb-0 "> 
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th style="max-width: 200px;">Title</th>
                                                    <th>Date</th>
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

                                                        <fmt:parseDate var="p_date" value="${blog.date}" pattern="yyyy-MM-dd"/>
                                                        <fmt:formatDate var="date" value="${p_date}" pattern="dd-MM-yyyy"/>
                                                        <!-- >Date-->
                                                        <td>${date}</td>
                                                        <td>
                                                            <div class="actions">
                                                                <a class="btn btn-sm bg-success-light" href="edit-blog?id=${blog.blogID}">
                                                                    <i class="fe fe-pencil"></i> Edit
                                                                </a>
                                                                <a data-toggle="modal" href="#delete_modal${blog.blogID}" class="btn btn-sm bg-danger-light">
                                                                    <i class="fe fe-trash"></i> Delete
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>

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
                                                <textarea class="form-control" id="description1" name="description"></textarea>
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