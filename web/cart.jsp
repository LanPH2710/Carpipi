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

    <style>
        .productCheckbox {
            transform: scale(1.2); /* Increase checkbox size */
            margin-top: 0.5rem; /* Adjust top margin for better alignment */
        }
        .qty-btn1 {
            width: 65px;
            padding-left: 0; /* Remove left padding for true centering */
            text-align: center; /* Centers the number within the input */
            pointer-events: auto;
            appearance: none; /* Hides default arrows in WebKit browsers */
            -moz-appearance: textfield; /* Hides default arrows in Firefox */
        }

        .qty-btn1::-webkit-inner-spin-button,
        .qty-btn1::-webkit-outer-spin-button {
            -webkit-appearance: none; /* Hides spin buttons in Chrome/Safari */
            margin: 0;

        }

    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Kiểm tra nếu có thông báo
            var message = "${messUpdateCart}";
            if (message && message.trim() !== "") {
                var messageDiv = document.getElementById("message");
                messageDiv.style.display = "block";

                // Tự động ẩn sau 3 giây
                setTimeout(function () {
                    messageDiv.style.display = "none";
                }, 3000);
            }
        });
    </script>
    <script> $(document).ready(function () {
            $('.breadcrumb-item a').click(function () {
                $('.breadcrumb-item').removeClass('active'); // Xóa lớp active của tất cả
                $(this).parent().addClass('active'); // Thêm lớp active cho mục đang nhấp
            });
        });</script>
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



                        <li class="sidebar-dropdown">
                            <a href="userpro"><i class="uil uil-user me-2 d-inline-block"></i>Profile</a>
                        </li>
                        <li><a href="myorder"><i class="uil uil-cube me-2 d-inline-block"></i>Đơn Mua</a></li>









                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-sign-in-alt me-2 d-inline-block"></i>Authentication</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="login">Login</a></li>
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
                            <a href="carts" class="btn btn-secondary ms-2">Reset Search</a> <!-- Reset button -->


                        </div>


                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h3 class=" text-center">ShopCart</h3>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item ${param.supplyId == null ? 'active" aria-current="page' : ''}">
                                        <a href="carts">All</a>
                                    </li>
                                    <li class="breadcrumb-item ${param.supplyId == 3 ? 'active" aria-current="page' : ''}">
                                        <a href="brandCart?supplyId=3">Audi</a>
                                    </li>
                                    <li class="breadcrumb-item ${param.supplyId == 1 ? 'active" aria-current="page' : ''}">
                                        <a href="brandCart?supplyId=1">Mercedes</a>
                                    </li>
                                    <li class="breadcrumb-item ${param.supplyId == 5 ? 'active" aria-current="page' : ''}">
                                        <a href="brandCart?supplyId=5">BMW</a>
                                    </li>
                                    <li class="breadcrumb-item ${param.supplyId == 2 ? 'active" aria-current="page' : ''}">
                                        <a href="brandCart?supplyId=2">Porsche</a>
                                    </li>
                                    <li class="breadcrumb-item ${param.supplyId == 4 ? 'active" aria-current="page' : ''}">
                                        <a href="brandCart?supplyId=4">Volkswagen</a>
                                    </li>
                                </ul>

                            </nav>
                        </div>
                        <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                            <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>

                                <li class="breadcrumb-item active" aria-current="page">Cart</li>


                            </ul>

                        </nav>
                        <div id="message" class="message-popup" style="display: none; color: red;">
                            ${messUpdateCart}
                        </div>




                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table table-center table-padding mb-0">
                                        <thead>
                                            <tr>
                                                <th type class="border-bottom text-center p-3" style="min-width: 50px;">Chọn</th>
                                                <th class="border-bottom text-center p-3" style="min-width: 300px;">Sản phẩm</th>
                                                <th class="border-bottom text-center p-3" style="min-width: 160px;">Màu</th>

                                                <th class="border-bottom text-center p-3" style="min-width: 160px;">Giá</th>
                                                <th class="border-bottom text-center p-3" style="min-width: 190px;">Số Lượng</th>
                                                <th class="border-bottom text-center p-3" style="min-width: 50px;">Tổng</th>
                                                <th class="border-bottom p-3" style="min-width: 20px;">Xóa</th>                                            </tr>
                                        </thead>

                                        <tbody>


                                            <c:forEach items="${sessionScope.carts}" var="C">
                                            <form action="update-quantity">
                                                <tr>
                                                    <td class="text-center p-3">
                                                        <input type="checkbox" name="selectCart" <c:if test="${C.isSelect == 1}">checked</c:if> onchange="this.form.submit()">
                                                        <input type="hidden" name="isSelect" value="${C.isSelect}">
                                                    </td>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <img src="${C.product.images[0].imageUrl}" alt="${C.product.name}" class="img-fluid avatar avatar-small rounded shadow" style="height: 150px; width: 250px;">
                                                            <a href="productdetail?productId=${C.product.productId}" class="mb-0 ms-3">${C.product.name}</a>
                                                        </div>
                                                    </td>
                                                    <td class="text-center p-3">
                                                        <select name="color" id="colorSelect" class="form-select" onchange="this.form.submit()">
                                                            <c:forEach items="${C.product.colorList}" var="color">
                                                                <option value="${color.colorId}" ${C.colorId == color.colorId ? "selected" : ""}>${color.colorName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>

                                                    <td class="text-center p-3">
                                                        <fmt:formatNumber value="${C.product.price}" type="number" minFractionDigits="0"/> đ
                                                    </td>
                                                    <td class="text-center shop-list p-3">
                                                        <div class="qty-icons">
                                                            <input type="hidden" name="productId" value="${C.product.productId}">
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn btn-icon btn-primary minus">-</button>
                                                            <input type="number" name="quantity" value="${C.quantity}" min="0" step="1" title="Please enter a non-negative integer!" class="btn btn-icon btn-primary qty-btn1 quantity" onchange="this.form.submit()" required>
                                                            <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn btn-icon btn-primary plus">+</button>
                                                        </div>
                                                        Còn lại: ${C.product.stock}
                                                    </td>
                                                    <td class="text-end font-weight-bold p-3">
                                                        <fmt:formatNumber value="${C.product.price * C.quantity}" type="number" minFractionDigits="0"/> đ
                                                    </td>
                                                    <td class="h5 p-3 text-center">
                                                        <a href="delete-cart?productId=${C.product.productId}" class="text-danger"><i class="uil uil-times"></i></a>
                                                    </td>
                                                </tr>
                                            </form>
                                        </c:forEach>






                                        </tbody>

                                    </table>  

                                </div>  <c:if test="${ empty sessionScope.carts}"> 
                                    <div class="alert alert-primary " role="alert"> Giỏ hàng trống</div>
                                </c:if>
                            </div><!--end col-->
                        </div><!--end row-->

                        <c:if test="${not empty sessionScope.carts}">       
                            <div class="row">
                                <div class="col-lg-8 col-md-6 mt-4 pt-2">
                                    <a href="productlist" class="btn btn-primary">Shop More</a>

                                </div>
                                <div class="col-lg-4 col-md-6 ms-auto mt-4 pt-2">
                                    <div class="table-responsive bg-white rounded shadow">
                                        <table class="table table-center table-padding mb-0">
                                            <tbody>

                                                <tr>
                                                    <td class="h6 p-3">Giá (chưa thuế)</td>
                                                    <td class="text-end font-weight-bold p-3">
                                                        <fmt:formatNumber value="${sessionScope.totalMoney}" type="number" minFractionDigits="0"/> đ
                                                    </td>
                                                </tr>


                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="mt-4 pt-2 text-end">
                                        <a href="tax" class="btn btn-primary" >Tính Thuế</a>
                                    </div>
                                </div><!--end col-->
                            </div><!--end row-->
                        </c:if> 
                    </div>
                </div><!--end container-->

            </main>

            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->
        <div class="modal fade" id="checkoutModal" tabindex="-1" aria-labelledby="checkoutModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="checkoutModalLabel">Checkout</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="process-checkout" method="post">
                            <div class="mb-3">
                                <label for="Name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="Name" name="Name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">email</label>
                                <input type="text" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="Adress" class="form-label">Adress</label>
                                <input type="text" class="form-control" id="Adress" name="Adress" required>
                            </div>
                            <div class="mb-3">
                                <label for="mobie" class="form-label">Số điện Thoại</label>
                                <input type="text" class="form-control" id="mobie" name="mobie" required>
                            </div>
                            <div class="form-label-group"><label>Chọn ngày muốn nhận hàng</label>
                                <input type="date" id="dateShip" id="address" class="form-control" value="${sessionScope.dateShip!=null?sessionScope.dateShip:''}" name="dateShip">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
        <script src="js/cart.js"></script>
        <script src="assets1/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets1/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets1/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets1/js/app.js"></script>

    </body>

</html>