<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>

        <title>Carpipi</title>



        <!-- favicon -->
        <link rel="shortcut icon" href="img/logo3.png">
        <!-- Bootstrap -->
        <link href="assets1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets1/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets1/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets1/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets1/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

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
                            <img src="img/logoBlack.png" height="120" class="logo-light-mode" alt="">

                        </a>
                    </div>

                    <ul class="sidebar-menu pt-3">
                        <li><a href="index.html"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>


                        <li class="sidebar-dropdown">
                            <a href="userpro"><i class="uil uil-user me-2 d-inline-block"></i>Profile</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="doctors.html">Doctors</a></li>
                                    <li><a href="add-doctor.html">Add Doctor</a></li>
                                    <li><a href="dr-profile.html">Profile</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-wheelchair me-2 d-inline-block"></i>Patients</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="patients.html">All Patients</a></li>
                                    <li><a href="add-patient.html">Add Patients</a></li>
                                    <li><a href="patient-profile.html">Profile</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-apps me-2 d-inline-block"></i>Apps</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="chat.html">Chat</a></li>
                                    <li><a href="email.html">Email</a></li>
                                    <li><a href="calendar.html">Calendar</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-shopping-cart me-2 d-inline-block"></i>Pharmacy</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="shop.html">Shop</a></li>
                                    <li><a href="product-detail.html">Shop Detail</a></li>
                                    <li><a href="shopcart.html">Shopcart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-flip-h me-2 d-inline-block"></i>Blogs</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="blogs.html">Blogs</a></li>
                                    <li><a href="blog-detail.html">Blog Detail</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-file me-2 d-inline-block"></i>Pages</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="faqs.html">FAQs</a></li>
                                    <li><a href="review.html">Reviews</a></li>
                                    <li><a href="invoice-list.html">Invoice List</a></li>
                                    <li><a href="invoice.html">Invoice</a></li>
                                    <li><a href="terms.html">Terms & Policy</a></li>
                                    <li><a href="privacy.html">Privacy Policy</a></li>
                                    <li><a href="error.html">404 !</a></li>
                                    <li><a href="blank-page.html">Blank Page</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-sign-in-alt me-2 d-inline-block"></i>Authentication</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="signup.html">Signup</a></li>
                                    <li><a href="forgot-password.html">Forgot Password</a></li>
                                    <li><a href="lock-screen.html">Lock Screen</a></li>
                                    <li><a href="thankyou.html">Thank you...!</a></li>
                                </ul>
                            </div>
                        </li>

                        <li><a href="components.html"><i class="uil uil-cube me-2 d-inline-block"></i>Components</a></li>

                        <li><a href="../landing/index-two.html" target="_blank"><i class="uil uil-window me-2 d-inline-block"></i>Landing page</a></li>
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
                                <img src="assets1/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="assets1/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="assets1/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                            
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form method="get" id="searchform" class="searchform" action="searchCart">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="keyword" id="s" placeholder="Search Keywords..." value="${param.keyword}" >
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>                             </div>
                            </div>
                                            <a href="reset-carts" class="btn btn-secondary ms-2">Reset Search</a> <!-- Reset button -->
                        </div>


                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">ShopCart</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>

                                    <li class="breadcrumb-item active" aria-current="page">Cart</li>
                                </ul>
                            </nav>
                        </div>

                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table table-center table-padding mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width:20px "></th>
                                                <th class="border-bottom p-3" style="min-width: 300px;">Product</th>
                                                <th class="border-bottom text-center p-3" style="min-width: 160px;">Price</th>
                                                <th class="border-bottom text-center p-3" style="min-width: 190px;">Quantity</th>
                                                <th class="border-bottom text-end p-3" style="min-width: 50px;">Total</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:if test="${not empty sessionScope.filteredCarts}">
                                                <c:forEach items="${sessionScope.filteredCarts.values()}" var="C">
                                                <form action="update-quantity">
                                                    <tr>
                                                        <td class="h5 p-3 text-center">
                                                            <a href="delete-cart?productId=${C.product.productId}" class="text-danger">
                                                                <i class="uil uil-times"></i>
                                                            </a>
                                                        </td>
                                                        <td class="p-3">
                                                            <div class="d-flex align-items-center">
                                                                <img src="${C.product.images[0].imageUrl}" alt="${C.product.name}" class="img-fluid avatar avatar-small rounded shadow" style="height:150px; width:auto;">
                                                                <h6 class="mb-0 ms-3">${C.product.name}</h6>
                                                            </div>
                                                        </td>
                                                        <td class="text-center p-3"><fmt:formatNumber value="${C.product.price}" type="number" minFractionDigits="0"/> đ</td>
                                                        <td class="text-center shop-list p-3">
                                                            <div class="qty-icons">
                                                                <input type="hidden" name="productId" value="${C.product.productId}">
                                                                <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn btn-icon btn-primary minus">-</button>
                                                                <input min="1" name="quantity" value="${C.quantity}" type="number" class="btn btn-icon btn-primary qty-btn quantity" onchange="this.form.submit()">
                                                                <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn btn-icon btn-primary plus">+</button>
                                                            </div>
                                                        </td>
                                                        <td class="text-end font-weight-bold p-3">
                                                            <fmt:formatNumber value="${C.product.price * C.quantity}" type="number" minFractionDigits="0"/> đ
                                                        </td>
                                                    </tr>
                                                </form>
                                            </c:forEach>
                                        </c:if>

                                        <c:if test="${empty sessionScope.filteredCarts}">
                                            <c:forEach items="${sessionScope.carts.values()}" var="C">
                                                 <form action="update-quantity">
                                                    <tr>
                                                        <td class="h5 p-3 text-center">
                                                            <a href="delete-cart?productId=${C.product.productId}" class="text-danger">
                                                                <i class="uil uil-times"></i>
                                                            </a>
                                                        </td>
                                                        <td class="p-3">
                                                            <div class="d-flex align-items-center">
                                                                <img src="${C.product.images[0].imageUrl}" alt="${C.product.name}" class="img-fluid avatar avatar-small rounded shadow" style="height:150px; width:auto;">
                                                                <h6 class="mb-0 ms-3">${C.product.name}</h6>
                                                            </div>
                                                        </td>
                                                        <td class="text-center p-3"><fmt:formatNumber value="${C.product.price}" type="number" minFractionDigits="0"/> đ</td>
                                                        <td class="text-center shop-list p-3">
                                                            <div class="qty-icons">
                                                                <input type="hidden" name="productId" value="${C.product.productId}">
                                                                <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn btn-icon btn-primary minus">-</button>
                                                                <input min="1" name="quantity" value="${C.quantity}" type="number" class="btn btn-icon btn-primary qty-btn quantity" onchange="this.form.submit()">
                                                                <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn btn-icon btn-primary plus">+</button>
                                                            </div>
                                                        </td>
                                                        <td class="text-end font-weight-bold p-3">
                                                            <fmt:formatNumber value="${C.product.price * C.quantity}" type="number" minFractionDigits="0"/> đ
                                                        </td>
                                                    </tr>
                                                </form>
                                            </c:forEach>
                                        </c:if>



                                        </tbody>
                                    </table>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->

                        <div class="row">
                            <div class="col-lg-8 col-md-6 mt-4 pt-2">
                                <a href="#" class="btn btn-primary">Shop More</a>
                                <a href="#" class="btn btn-soft-primary ms-2">Update Cart</a>
                            </div>
                            <div class="col-lg-4 col-md-6 ms-auto mt-4 pt-2">
                                <div class="table-responsive bg-white rounded shadow">
                                    <table class="table table-center table-padding mb-0">
                                        <tbody>

                                            <tr>
                                                <td class="h6 p-3">Subtotal</td>
                                                <td class="text-end font-weight-bold p-3">
                                                    <fmt:formatNumber value="${sessionScope.totalMoney}" type="number" minFractionDigits="0"/> đ
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="h6 p-3">Taxes (10%)</td>
                                                <td class="text-end font-weight-bold p-3">
                                                    <fmt:formatNumber value="${sessionScope.totalMoney * 0.1}" type="number" minFractionDigits="0"/> đ
                                                </td>
                                            </tr>
                                            <tr class="bg-light">
                                                <td class="h6 p-3">Total</td>
                                                <td class="text-end font-weight-bold p-3">
                                                    <fmt:formatNumber value="${sessionScope.totalMoney * 1.1}" type="number" minFractionDigits="0"/> đ
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="mt-4 pt-2 text-end">
                                    <a href="#" class="btn btn-primary">Proceed to checkout</a>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div>
                </div><!--end container-->

            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- Offcanvas Start -->
        <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header p-4 border-bottom">
                <h5 id="offcanvasRightLabel" class="mb-0">
                    <img src="assets1/images/logo-dark.png" height="24" class="light-version" alt="">
                    <img src="assets1/images/logo-light.png" height="24" class="dark-version" alt="">
                </h5>
                <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
            </div>
            <div class="offcanvas-body p-4 px-md-5">
                <div class="row">
                    <div class="col-12">
                        <!-- Style switcher -->
                        <div id="style-switcher">
                            <div>
                                <ul class="text-center list-unstyled mb-0">
                                    <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="assets1/images/layouts/light-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="assets1/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="assets1/images/layouts/dark-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="assets1/images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="assets1/images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="assets1/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                                    <li class="d-grid"><a href="../landing/index.html" target="_blank" class="mt-4"><img src="assets1/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Landing Demos</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end Style switcher -->
                    </div><!--end col-->
                </div><!--end row-->
            </div>

            <div class="offcanvas-footer p-4 border-top text-center">
                <ul class="list-unstyled social-icon mb-0">
                    <li class="list-inline-item mb-0"><a href="https://1.envato.market/doctris-template" target="_blank" class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://dribbble.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://www.facebook.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://www.instagram.com/shreethemes/" target="_blank" class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://twitter.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="../../../index.html" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
                </ul><!--end icon-->
            </div>
        </div>
        <!-- Offcanvas End -->

        <!-- javascript -->
        <script src="assets1/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets1/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets1/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets1/js/app.js"></script>

    </body>

</html>