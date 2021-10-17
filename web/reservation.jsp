<%-- 
    Document   : reservation
    Created on : 16-Oct-2021, 14:16:34
    Author     : Admin
--%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- doccure/checkout.html  30 Nov 2019 04:12:16 GMT -->
    <head>
        <meta charset="utf-8" />
        <title>Doccure</title>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=0"
            />

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

        <!-- Fontawesome CSS -->
        <link
            rel="stylesheet"
            href="assets/plugins/fontawesome/css/fontawesome.min.css"
            />
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css" />

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css" />

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
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">Service</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Reservation
                                    </li>
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
                <div class="container">
                    <div class="row">
                        <div class="col-md-7 col-lg-8">
                            <div class="card">
                                <div class="card-body">
                                    <!-- Checkout Form -->

                                    <!-- Personal Information -->
                                    <div class="info-widget">
                                        <h4 class="card-title">Personal Information</h4>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group card-label">
                                                    <label> Name</label>
                                                    <input class="form-control" type="text" value="${sessionScope.user.name}" readonly="" />
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group card-label">
                                                    <label>Email</label>
                                                    <input class="form-control" type="email" value="${sessionScope.user.email}" readonly=""/>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group card-label">
                                                    <label>Phone</label>
                                                    <input class="form-control" type="text" value="${sessionScope.user.phone}" readonly=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="exist-customer">
                                            Want to change information?
                                            <a href="#">Click here ! </a>
                                        </div>
                                    </div>
                                    <!-- /Personal Information -->

                                    <div class="payment-widget">
                                        <!-- Checkout Form -->
                                        <form action="reservation" method="post">
                                            <div class="payment-widget">
                                                <p class="text-danger">${mess}</p>

                                                <h4 class="card-title">Reservation Details</h4>

                                                <!-- Appointment Details -->
                                                <input
                                                    type="hidden"
                                                    name="patientId"
                                                    value="${sessionScope.user.patientID}"
                                                    />

                                                <input
                                                    type="hidden"
                                                    name="serviceID"
                                                    value="${service.service_id}"
                                                    />

                                                <div class="payment-list">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group card-label">
                                                                <label
                                                                    for="card_name"
                                                                    style="margin-bottom: 14px"
                                                                    >Date</label
                                                                >
                                                                <input
                                                                    class="form-control"
                                                                    id="card_name"
                                                                    type="date"
                                                                    name="date"
                                                                    
                                                                    required=""
                                                                    />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group card-label">
                                                                <label for="card_name">Time</label>
                                                                <select
                                                                    class="form-control"
                                                                    id="card_name"
                                                                    name="slot_id"
                                                                    >
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
                                                                <textarea
                                                                    rows="5"
                                                                    cols="5"
                                                                    class="form-control"
                                                                    placeholder="Reason for this reservation (optional)"
                                                                    name="description"
                                                                    ></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /Appointment Details -->

                                                <!-- Submit Section -->
                                                <div class="submit-section mt-4">
                                                    <button
                                                        type="submit"
                                                        class="btn btn-primary submit-btn"
                                                        >
                                                        Confirm
                                                    </button>
                                                </div>
                                                <!-- /Submit Section -->
                                            </div>
                                        </form>
                                        <!-- /Checkout Form -->
                                    </div>

                                    <!-- /Checkout Form -->
                                </div>
                            </div>
                        </div>

                        <div class="col-md-5 col-lg-4 theiaStickySidebar">
                            <!-- Booking Summary -->
                            <div class="card booking-card">
                                <div class="card-header">
                                    <h4 class="card-title">Booking Summary</h4>
                                </div>
                                <div class="card-body">
                                    <!-- Booking Doctor Info -->
                                    <div class="booking-doc-info">
                                        <a href="doctor-profile.html" class="booking-doc-img">
                                            <img
                                                src="${service.image}"
                                                alt="User Image"
                                                />
                                        </a>
                                        <div class="booking-info">
                                            <h4>
                                                <a href="doctor-profile.html">${service.title}</a>
                                            </h4>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Booking Doctor Info -->

                                    <div class="booking-summary">
                                        <div class="booking-item-wrap">
                                            <ul class="booking-date">
                                                <li>Date <span>16 Nov 2019</span></li>
                                                <li>Time <span>10:00 AM</span></li>
                                            </ul>

                                            <ul class="booking-fee">
                                                <li>Reservation Fee <span>$100</span></li>
                                            </ul>
                                            <div class="booking-total">
                                                <ul class="booking-total-list">
                                                    <li>
                                                        <span>Total</span>
                                                        <span class="total-cost">$160</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Booking Summary -->
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

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>
    </body>

    <!-- doccure/checkout.html  30 Nov 2019 04:12:16 GMT -->
</html>
