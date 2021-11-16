<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/calendar.html  30 Nov 2019 04:12:18 GMT -->
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

        <!-- Full Calander CSS -->
        <link rel="stylesheet" href="assets/plugins/fullcalendar/fullcalendar.min.css">


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
            <%@include file="index-header.jsp" %>
            <!-- /Header -->

            <!-- Breadcrumb -->
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Booking</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">Booking</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">

                    <div class="row">

                        <!-- Doctor Information -->
                        <div class="col-md-7 col-lg-7 col-xl-7">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Doctor Information</h4>
                                </div>
                                <div class="card-body">
                                    <div class="booking-doc-info">
                                        <a href="doctor-profile.html" class="booking-doc-img">
                                            <img src="${doctor.image}" alt="User Image">
                                        </a>
                                        <div class="booking-info">
                                            <h4 class="doc-name">Dr. ${doctor.name}</h4>
                                            <p class="doc-speciality">${doctor.role}</p>
                                            <p class="doc-department"><img src="assets/img/specialities/specialities-05.png" class="img-fluid" alt="Speciality">${doctor.spec.name}</p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">35</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <!-- Checkout Form -->
                                    <form action="booking" method="post">

                                        <div class="payment-widget">
                                            <p class="text-danger">${mess}</p>

                                            <h4 class="card-title">Appointment Details</h4>

                                            <!-- Appointment Details -->
                                            <input type="hidden" name="patient_id" value="${sessionScope.user.patientID}">

                                            <input type="hidden" name="doctor_id" value="${doctor.doctorID}">

                                            <div class="payment-list">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group card-label">
                                                            <label for="card_name" style="margin-bottom: 14px">Date</label>
                                                            <input class="form-control" id="card_name" type="date" name="date" value="${date}" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group card-label">
                                                            <label for="card_name">Time</label>
                                                            <select class="form-control" id="card_name" name="slot_id"> 
                                                                <option value="1">7h - 8h</option>
                                                                <option value="2">8h - 9h</option>
                                                                <option value="3">9h - 10h</option>
                                                                <option value="4">10h - 11h</option>
                                                                <option value="5">11h - 12h</option>                                                                
                                                                <option value="6">14h - 15h</option>
                                                                <option value="7">15h - 16h</option>
                                                                <option value="8">16h - 17h</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group card-label">
                                                            <label for="card_name">Description</label>
                                                            <textarea rows="5" cols="5" class="form-control" placeholder="Reason for this appointment (optional)" name="description"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Appointment Details -->

                                            <!-- Submit Section -->
                                            <div class="submit-section mt-4">
                                                <button type="submit" class="btn btn-primary submit-btn">Booking Appointment</button>
                                            </div>
                                            <!-- /Submit Section -->

                                        </div>
                                    </form>
                                    <!-- /Checkout Form -->

                                </div>
                            </div>
                        </div>
                        <!-- /Doctor Information -->

                        <!-- Calendar -->
                        <div class="col-md-5 col-lg-5 col-xl-5">
                            <div class="card">
                                <div id="calendar"></div>
                            </div>
                        </div>
                        <!-- /Calendar -->
                    </div>
                </div>

            </div>		
            <!-- /Page Content -->

            <!-- Footer Bottom -->
            <%@include file="index-footer.jsp" %>
            <!-- /Footer Bottom -->
        </div>
        <!-- /Main Wrapper -->

        <!-- Add Event Modal -->
        <div id="add_event" class="modal custom-modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Event</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label>Event Name <span class="text-danger">*</span></label>
                                <input class="form-control" type="text">
                            </div>
                            <div class="form-group">
                                <label>Event Date <span class="text-danger">*</span></label>
                                <div class="cal-icon">
                                    <input class="form-control datetimepicker" type="text">
                                </div>
                            </div>
                            <div class="submit-section">
                                <button class="btn btn-primary submit-btn">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Add Event Modal -->

        <!-- Add Event Modal -->
        <div class="modal custom-modal fade none-border" id="my_event">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Event</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body"></div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-success save-event submit-btn">Create event</button>
                        <button type="button" class="btn btn-danger delete-event submit-btn" data-dismiss="modal">Delete</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Add Event Modal -->

        <!-- Add Category Modal -->
        <div class="modal custom-modal fade" id="add_new_event">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Category</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label>Category Name</label>
                                <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
                            </div>
                            <div class="form-group">
                                <label>Choose Category Color</label>
                                <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                    <option value="success">Success</option>
                                    <option value="danger">Danger</option>
                                    <option value="info">Info</option>
                                    <option value="primary">Primary</option>
                                    <option value="warning">Warning</option>
                                    <option value="inverse">Inverse</option>
                                </select>
                            </div>
                            <div class="submit-section text-center">
                                <button type="button" class="btn btn-primary save-category submit-btn" data-dismiss="modal">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Add Category Modal -->

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Datetimepicker JS -->
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <!-- Full Calendar JS -->
        <script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="assets/plugins/fullcalendar/fullcalendar.min.js"></script>
        <script src="assets/plugins/fullcalendar/jquery.fullcalendar.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>
    </body>

    <!-- doccure/calendar.html  30 Nov 2019 04:12:19 GMT -->
</html>
