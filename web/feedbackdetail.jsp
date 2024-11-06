



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slider List</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="img/logo3.png">
        <!-- Bootstrap -->
        <link href="assetsSlider/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assetsSlider/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assetsSlider/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assetsSlider/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assetsSlider/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <%--<jsp:include page="header.jsp"/>--%>
        <%--<jsp:include page="footerDemo.jsp"/>--%>
    </head>

    <body>
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <div class="page-wrapper doctris-theme toggled">
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <div class="sidebar-brand">
                        <a href="home">
                            <img src="img/logoBnoBG.png" height="120px" class="logo-light-mode" alt="">
                            <img src="img/logoBnoBG.png" height="120px" class="logo-dark-mode" alt="">
                        </a>
                    </div>

                    <ul class="sidebar-menu pt-3">
                        <li><a href="index.html"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                        <li><a href="patients.html"><i class="uil uil-user me-2 d-inline-block"></i>Customer List</a></li>
                        <li><a href="patients.html"><i class="uil uil-dashboard me-2 d-inline-block"></i>Product List</a>
                        </li>
                        <li><a href="sliderList.html"><i class="uil uil-dashboard me-2 d-inline-block"></i>Slider List</a>
                        </li>
                        <li><a href="patients.html"><i class="uil uil-dashboard me-2 d-inline-block"></i>Setting List</a>
                        </li>
                        <li><a href="patients.html"><i class="uil uil-dashboard me-2 d-inline-block"></i>Product List</a>
                        </li>
                        <li><a href="patients.html"><i class="uil uil-dashboard me-2 d-inline-block"></i>Post List</a></li>


                    </ul>
                    <!-- sidebar-menu  -->
                </div>
                <!-- sidebar-content  -->
                <ul class="sidebar-footer list-unstyled mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <a href="#" class="btn btn-icon btn-pills btn-soft-primary">
                            <i class="uil uil-comment icons"></i>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="assetsSlider/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="assetsSlider/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="assetsSlider/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>

                        </div>


                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Feedback detail</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="marketingdashboard">Marketing</a></li>
                                    <li class="breadcrumb-item"><a href="feedbacklistformarketing">Feedback List</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Feedback Detail</li>
                                </ul>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-5 mt-4">
                            </div><!--end col-->
                            <div class="col-lg-5 col-md-7 mt-4">
                                <div class="card border-0 shadow overflow-hidden">
                                    <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded-0 shadow overflow-hidden bg-white mb-0"
                                        id="pills-tab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link rounded-0 active" id="overview-tab" data-bs-toggle="pill"
                                               href="#pills-overview" role="tab" aria-controls="pills-overview"
                                               aria-selected="false">
                                                <div class="text-center pt-1 pb-1">
                                                    <h4 class="title fw-normal mb-0">feedback</h4>
                                                </div>
                                            </a><!--end nav link-->
                                        </li><!--end nav item-->
                                    </ul>

                                    <c:if test="${not empty feedbackdetail}">
                                        <form method="POST" action="feedbackdetail">

                                            <div class="tab-content p-4" id="pills-tabContent">
                                                <div class="tab-pane fade show active" id="pills-overview" role="tabpanel"
                                                     aria-labelledby="overview-tab">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-12 mt-4">

                                                            <div>
                                                                <strong>Feedback ID</strong>
                                                                <!--                                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">-->
                                                                <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3bottom">
                                                                    ${feedbackdetail.feedbackId}
                                                                </div>
                                                            </div>

                                                            <div>
                                                                <strong>email</strong>
                                                                <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3bottom">
                                                                    ${feedbackdetail.email}
                                                                </div>
                                                            </div>


                                                            <div>
                                                                <strong>feedback</strong>
                                                                <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3bottom">
                                                                    ${feedbackdetail.feedback}
                                                                </div>
                                                            </div>
                                                                <div>
                                                                <strong>ratedStar</strong>
                                                                <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3bottom">
                                                                    ${feedbackdetail.ratedStar}
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-12 mt-4">

                                                            <div>
                                                                <strong>fullName</strong>
                                                                <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3bottom">
                                                                    ${feedbackdetail.fullName}
                                                                </div>
                                                            </div>

                                                            <div>
                                                                <strong>mobile</strong>
                                                                <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3bottom">
                                                                    ${feedbackdetail.mobile}
                                                                </div>
                                                            </div>
                                                            


                                                            <strong>Trạng thái</strong>
                                                            <input type="hidden" name="feedbackId" value="${feedbackdetail.feedbackId}" />
                                                            <select name="status" class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3bottom">
                                                                <option value="1" ${feedbackdetail.feedbackStatus == 1 ? 'selected' : ''}>Hiển thị</option>
                                                                <option value="0" ${feedbackdetail.feedbackStatus == 0 ? 'selected' : ''}>Ẩn</option>
                                                            </select>

                                                            
                                                            <div>
                                                                <strong>productName</strong>
                                                                <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3bottom">
                                                                    ${feedbackdetail.productName}
                                                                </div>
                                                            </div>



                                                        </div>
                                                    </div>


<!--                                                    <h5 class="mb-0 mt-4 pt-2">Image</h5>
                                                    <div class="row">
                                                        <div class="col-md-12 col-lg-6 mt-4">
                                                            <img src="img/${feedbackdetail.feedbackImg}" alt="" style="width: auto; height: 220px; object-fit: cover"/>
                                                        </div>end col

                                                        <div class="col-md-12 col-lg-6 mt-4">

                                                        </div>end col
                                                    </div>end row-->


                                                </div>


                                            </div>
                                            <div class="modal-footer">
                                                <a href="feedbacklistformarketing" class="btn btn-secondary">Hủy</a>
                                                <input type="submit" class="btn btn-info" value="Lưu">
                                            </div>
                                        </form>
                                    </c:if>
                                    <c:if test="${empty feedbackdetail}">
                                        <p>No feedback details found.</p>
                                    </c:if>



                                </div>
                            </div><!--end col-->


                        </div><!--end row-->
                    </div>
                </div><!--end container-->

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">

                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end container-->
                </footer><!--end footer-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- javascript -->
        <script src="assetsSlider/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assetsSlider/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assetsSlider/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assetsSlider/js/app.js"></script>

    </body>

</html>