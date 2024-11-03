<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Doctris - Doctor Appointment Booking System</title>
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
        <!-- Select2 -->
        <link href="assetsSlider/css/select2.min.css" rel="stylesheet" />
        <!-- Icons -->
        <link href="assetsSlider/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assetsSlider/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link href="assetsSlider/css/tiny-slider.css" rel="stylesheet" />
        <!-- Css -->
        <link href="assetsSlider/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

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

                        <c:choose>
                            <c:when test="${sessionScope.account.roleId == 1}">
                                <li><a href="admin"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                                </c:when>
                                <c:when test="${sessionScope.account.roleId == 2}">
                                <li><a href="marketingdashboard"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                                </c:when>
                            </c:choose>
                        <li><a href="customerlist"><i class="uil uil-user me-2 d-inline-block"></i>Customer List</a></li>
                        <li><a href="proformarketing"><i class="uil uil-dashboard me-2 d-inline-block"></i>Product List</a></li>
                        <li><a href="SliderList"><i class="uil uil-dashboard me-2 d-inline-block"></i>Slider List</a></li>
                            <c:choose>
                                <c:when test="${sessionScope.account.roleId == 1}">
                                <li><a href="settingsList"><i class="uil uil-dashboard me-2 d-inline-block"></i>Setting List</a></li>
                                </c:when>
                            </c:choose>
                        <li><a href="postlist"><i class="uil uil-dashboard me-2 d-inline-block"></i>Post List</a></li>
                        <li><a href="feedbacklistformarketing"><i class="uil uil-dashboard me-2 d-inline-block"></i>Feedback List</a></li>
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
                        <h5 class="mb-0">Dashboard</h5>

                        <div class="row">
                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <a href="postlist" class="card features feature-primary rounded border-0 shadow p-4 text-decoration-none">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-bed h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0"> ${blogCount}</h5>
                                            <p class="text-muted mb-0">post</p>
                                        </div>
                                    </div>
                                </a>
                            </div><!--end col-->

                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <a href="productlist" class="card features feature-primary rounded border-0 shadow p-4 text-decoration-none">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-file-medical-alt h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">${productCount}</h5>
                                            <p class="text-muted mb-0">product</p>
                                        </div>
                                    </div>
                                </a>
                            </div><!--end col-->

                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <a href="customerlist" class="card features feature-primary rounded border-0 shadow p-4 text-decoration-none">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-social-distancing h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">${customerCount}</h5>
                                            <p class="text-muted mb-0">customer</p>
                                        </div>
                                    </div>

                                </a>
                            </div><!--end col-->

                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-ambulance h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">${totalQuantitySold}</h5>
                                            <p class="text-muted mb-0">total Sale Product</p>
                                        </div>
                                    </div>

                                </div>
                            </div><!--end col-->

                            <!--                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                                                <div class="d-flex align-items-center">
                                                                    <div class="icon text-center rounded-md">
                                                                        <i class="uil uil-medkit h3 mb-0"></i>
                                                                    </div>
                                                                    <div class="flex-1 ms-2">
                                                                        <h5 class="mb-0">${orderCount}</h5>
                                                                        <p class="text-muted mb-0">order</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>end col-->

                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <a href="SliderList" class="card features feature-primary rounded border-0 shadow p-4 text-decoration-none">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-medical-drip h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">${sliderCount}</h5>
                                            <p class="text-muted mb-0">slider Count</p>
                                        </div>
                                    </div>
                                </a>
                            </div><!--end col-->
                        </div><!--end row-->

                        <div class="row">
                            <!--                            <div class="col-xl-8 col-lg-7 mt-4">
                                                            <div class="card shadow border-0 p-4">
                                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                                    <h6 class="align-items-center mb-0">Customer by Gender</h6>
                                                                    
                                                                    <div class="mb-0 position-relative">
                                                                        <select class="form-select form-control" id="yearchart">
                                                                            <option selected>2020</option>
                                                                            <option value="2019">2019</option>
                                                                            <option value="2018">2018</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div id="dashboard" class="apex-chart"></div>
                                                            </div>
                                                        </div>end col-->


                            <div class="col-xl-8 col-lg-7 mt-4">
                                <div>
                                    <h2>Product Sales Chart</h2>
                                    <div style="width: 700px; margin: auto;"> <!-- Set a specific width for the chart -->
                                        <canvas id="productSalesChart" width="500" height="400"></canvas>
                                    </div>
                                </div>
                                <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.6/dist/chart.umd.min.js"></script>


                                <script>
                                    // Prepare product data for the chart
                                    const products = [];
                                    <c:forEach var="product" items="${productSale}">
                                    products.push({
                                        name: '${product.name}',
                                        totalQuantitySold: ${product.totalQuantitySold}
                                    });
                                    </c:forEach>

                                    // Create arrays for labels and data
                                    const labels = products.map(product => product.name); // Product names
                                    const data = products.map(product => product.totalQuantitySold); // Total quantities sold

                                    // Create the chart
                                    const ctx = document.getElementById('productSalesChart').getContext('2d');
                                    const myChart = new Chart(ctx, {
                                        type: 'bar',
                                        data: {
                                            labels: labels,
                                            datasets: [{
                                                    label: 'Total Quantity Sold',
                                                    data: data,
                                                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                                    borderColor: 'rgba(54, 162, 235, 1)',
                                                    borderWidth: 1
                                                }]
                                        },
                                        options: {
                                            scales: {
                                                y: {
                                                    beginAtZero: true
                                                }
                                            }
                                        }
                                    });
                                </script>
                            </div>
                            <div class="col-xl-4 col-lg-5 mt-4">
                                <div class="card shadow border-0 p-4">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h6 class="align-items-center mb-0">Patients by Department</h6>

                                        <div class="mb-0 position-relative">
                                            <select class="form-select form-control" id="dailychart">
                                                <option selected>Today</option>
                                                <option value="2019">Yesterday</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="department" class="apex-chart"></div>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->

                        

                            
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
        <!-- Chart -->
        <script src="assetsSlider/js/apexcharts.min.js"></script>
        <script src="assetsSlider/js/columnchart.init.js"></script>
        <!-- Icons -->
        <script src="assetsSlider/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assetsSlider/js/app.js"></script>

    </body>

</html>
