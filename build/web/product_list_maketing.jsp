
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
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
        <link href="assets_son/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets_son/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets_son/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets_son/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets_son/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

        <style>
            .col {
                display: flex;
                align-items: stretch;
            }

            .card {
                flex-grow: 1;
                display: flex;
                flex-direction: column;
            }

            .shop-image {
                height: 200px; /* Chiều cao cố định cho khung chứa ảnh */
                overflow: hidden;
                border-radius: 8px; /* Thêm nếu muốn ảnh bo góc */
            }

            .shop-image img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* Ảnh sẽ căn chỉnh và giữ tỷ lệ */
            }

            li {
                flex: 1 0 30%; /* Chia mỗi phần tử chiếm 30% chiều rộng, đảm bảo 3 phần tử trong mỗi hàng */
                margin: 5px; /* Thêm khoảng cách giữa các phần tử */
                text-align: start;
            }


        </style>

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
                        <a href="index.html">
                            <img src="img/logoBnoBG.png" height="120px" class="logo-light-mode" alt="">
                           
                        </a>
                    </div>
                    <ul class="sidebar-menu pt-3">

                        <c:choose>
                            <c:when test="${sessionScope.account.roleId == 1}">
                                <li><a href="admindashboard"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
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
                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)">
                                <i class="uil uil-flip-h me-2 d-inline-block"></i>Posts List</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="postlist">Tất cả bài viết</a></li>
                                        <c:forEach items="${topic}" var="t">
                                        <li><a href="postlist?topic=${t.blogTopicId}">${t.toppicName}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </li>
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
                                <img src="assets_son/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="assets_son/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="assets_son/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form action="proformarketing" method="get" id="searchform" class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="searchse" id="s" placeholder="Search Keywords...">
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
<!--                            <div>
                                <h5 class="mb-0">Shop</h5>

                                <nav aria-label="breadcrumb" class="d-inline-block mt-1">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="index.html">Doctris</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Shop</li>
                                    </ul>
                                </nav>

                            </div>-->

                            <div class="mt-4 mt-sm-0">
                                
                                <a href="addbymarketing" class="btn btn-primary">Thêm sản phẩm</a>
                            </div>
                        </div>

                        <h6 class="mt-4 mb-0">Most Viewed Products</h6>

                        <div class="container">
                            <div class="row row-cols-auto">
                                <div class="col">
                                    <a href="product?brandId=ME&page=1"><button class="btn btn-outline-primary">Tất cả</button></a>
                                </div>
                                <c:forEach var="brand" items="${brandList}">
                                    <div class="col">
                                        <a href="proformarketing?brandId=${brand.brandId}"><button class="btn btn-outline-primary">${brand.brandName}</button></a>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>

                        <form action="proformarketing" method="get">
                            <div class="card-group">

                                <div class="card" style="width: 50%; border-radius: 3px">

                                    <div class="card-body">

                                        <span class="bg-danger"><h5>Kiểu dáng:</h5></span>
                                        <div class="form-check">

                                            <ul class="nav nav-stacked">
                                                <c:forEach var="style" items="${styleList}">
                                                    <li>
                                                        <input class="form-check-input" type="checkbox" id="check${style.styleId}" name="styleId" value="${style.styleId}">
                                                        <label class="form-check-label" for="check${style.styleId}">${style.styleName}</label><br>

                                                    </li>
                                                </c:forEach>
                                            </ul>                                      

                                        </div>
                                    </div>
                                </div>

                                <div class="card" style="width: 50%;">

                                    <div class="card-body">

                                        <span class="bg-danger"><h5>Phân khúc:</h5></span>
                                        <div class="form-check">

                                            <ul class="nav nav-stacked">
                                                <c:forEach var="segment" items="${segmentList}">
                                                    <li>
                                                        <input class="form-check-input" type="checkbox" id="check${segment.segmentId}" name="segmentId" value="${segment.segmentId}">
                                                        <label class="form-check-label" for="check${segment.segmentId}">${segment.segmentName}</label><br>

                                                    </li>
                                                </c:forEach>
                                            </ul>

                                        </div>
                                        <div class="form-check">
                                            <span class="bg-danger"><h5>Nhà cung cấp: </h5></span>  
                                            <ul class="nav nav-stacked">
                                                <c:forEach var="supply" items="${supplyList}">
                                                    <li>
                                                        <input class="form-check-input" type="checkbox" id="check${supply.supplyId}" name="supplyId" value="${supply.supplyId}">
                                                        <label class="form-check-label" for="check${supply.supplyId}">${supply.supplyName}</label><br>

                                                    </li>
                                                </c:forEach>
                                            </ul>

                                        </div>
                                    </div>                  
                                </div>


                            </div>
                            <input type="hidden" name="brandId" value="${requestScope.brandId}">
                            <input class="btn btn-primary mt-3" type="submit" value="Tìm kiếm">
                        </form>
                        <div class="order" style="display: flex" >
                            <div class="col-2">
                                Sắp xếp theo tên 
                                <form action="proformarketing" method="get" style="display: inline;">

                                    <select class="form-select" name="orderName" onchange="this.form.submit()">
                                        <option value="1" ${requestScope.orderName == 1 ? 'selected' : ''}>Từ bé đến lớn</option>
                                        <option value="0" ${requestScope.orderName == 0 ? 'selected' : ''}>Từ lớn đến bé</option>
                                    </select>

                                    <input type="hidden" name="brandId" value="${requestScope.brandId}">

                                    <!-- Vòng lặp thêm input ẩn cho từng styleId đã chọn -->
                                    <c:forEach var="styleId" items="${sessionScope.styleIdList}">
                                        <input type="hidden" name="styleId" value="${styleId}">
                                    </c:forEach>
                                    <c:forEach var="segmentId" items="${sessionScope.segmentIdList}">
                                        <input type="hidden" name="segmentId" value="${segmentId}">
                                    </c:forEach>
                                    <c:forEach var="supplyId" items="${sessionScope.supplyIdList}">
                                        <input type="hidden" name="supplyId" value="${supplyId}">
                                    </c:forEach>

                                </form>
                            </div>


                            <div class="col-2">
                                <div>
                                    Sắp xếp theo giá 
                                    <form action="proformarketing" method="get" style="display: inline;">

                                        <select class="form-select" name="orderName" onchange="this.form.submit()">
                                            <option value="1" ${requestScope.orderName == 1 ? 'selected' : ''}>Từ bé đến lớn</option>
                                            <option value="0" ${requestScope.orderName == 0 ? 'selected' : ''}>Từ lớn đến bé</option>
                                        </select>

                                        <input type="hidden" name="brandId" value="${requestScope.brandId}">

                                        <!-- Vòng lặp thêm input ẩn cho từng styleId đã chọn -->
                                        <c:forEach var="styleId" items="${sessionScope.styleIdList}">
                                            <input type="hidden" name="styleId" value="${styleId}">
                                        </c:forEach>
                                        <c:forEach var="segmentId" items="${sessionScope.segmentIdList}">
                                            <input type="hidden" name="segmentId" value="${segmentId}">
                                        </c:forEach>
                                        <c:forEach var="supplyId" items="${sessionScope.supplyIdList}">
                                            <input type="hidden" name="supplyId" value="${supplyId}">
                                        </c:forEach>

                                    </form>
                                </div>
                            </div>
                            <div class="col-2">
                                <div>
                                    Sắp xếp theo nhiên liệu 
                                    <form action="proformarketing" method="post" style="display: inline;">
                                        <input type="hidden" name="sliderId" value="${slider.sliderId}" />
                                        <select class="form-select" name="orderPrice" onchange="this.form.submit()">
                                            <option value="1" ${requestScope.orderName == 1 ? 'selected' : ''}>Từ bé đến lớn</option>
                                            <option value="0" ${requestScope.orderName == 0 ? 'selected' : ''}>Từ lớn đến bé</option>
                                        </select>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <div class="row row-cols-md-2 row-cols-lg-5">
                            <c:forEach items="${productList}" var="product">

                                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                                    <div class="card shop-list border-0 overflow-hidden rounded shadow">
                                        <ul class="label list-unstyled mb-0">
                                            <li><a href="javascript:void(0)" class="badge badge-pill badge-success">Featured</a></li>
                                        </ul>
                                        <div class="shop-image position-relative overflow-hidden">
                                            <a href="editproductbymarketing?id=${product.productId}">
                                                <c:forEach items="${imageList}" var="image">
                                                    <c:if test="${image.productId == product.productId}">
                                                        <div class="shop-image position-relative overflow-hidden">
                                                            <a href="editproductbymarketing?id=${product.productId}">
                                                                <img src="${image.imageUrl}" alt="Xe">
                                                            </a>
                                                        </div>

                                                    </c:if>

                                                </c:forEach>
                                            </a>
                                            <ul class="list-unstyled shop-icons">

                                                <li class="mt-2"><a href="editproductbymarketing?id=${product.productId}" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="eye" class="icons"></i></a></li>
                                            </ul>                                


                                        </div>
                                        <div class="card-body content p-4 border-top">
                                            <table class="table table-borderless">

                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <a href="editproductbymarketing?id=${product.productId}" class="text-dark product-name h6">${product.name}</a>

                                                        </td>
                                                        <td>
                                                            <h6 class="text-muted small font-italic mb-0 mt-1"><fmt:formatNumber value="${product.price}" type="number" pattern="#,###"/></h6>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h6 class="text-muted small font-italic mb-0 mt-1">ID: ${product.productId}</h6>

                                                        </td>
                                                        <td>
                                                            <a href="editproductbymarketing?id=${product.productId}" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="eye" class="icons"></i></a>

                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>


                                        </div>
                                    </div>
                                </div><!--end col-->
                            </c:forEach>

                        </div><!--end row-->


                        <div class="clearfix">

                        <ul class="pagination">

                             
                                <c:forEach begin="1" end="${endP}" var="i">
                                    <li style="flex: 1 0 2% " class="${tag == i?"page-item active":"page-item"}"><a class="page-link" href="proformarketing?index=${i}&brandId=${chooseBrand}">${i}</a></li>
                                </c:forEach>

                          
                        </ul>
                    </div> 

                    </div>
                </div><!--end container-->

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.html" target="_blank" class="text-reset">Shreethemes</a>.</p>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end container-->
                </footer><!--end footer-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- Offcanvas Start -->
        <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header p-4 border-bottom">
                <h5 id="offcanvasRightLabel" class="mb-0">
                    <img src="assets_son/images/logo-dark.png" height="24" class="light-version" alt="">
                    <img src="assets_son/images/logo-light.png" height="24" class="dark-version" alt="">
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
                                    <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="assets_son/images/layouts/light-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="assets_son/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="assets_son/images/layouts/dark-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="assets_son/images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="assets_son/images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="assets_son/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                                    <li class="d-grid"><a href="../landing/index.html" target="_blank" class="mt-4"><img src="assets_son/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Landing Demos</span></a></li>
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

        <!-- Start Modal -->
        <div class="modal fade"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Add Shop Product</h5>
                        <!--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>-->
                        <a href="addbymarketing"></a>
                    </div>

                    <div class="modal-body p-3 pt-4">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="d-grid me-md-4">
                                    <p class="text-muted">Upload your shop image here, Please click "Upload Image" Button.</p>
                                    <div class="preview-box d-block justify-content-center rounded shadow overflow-hidden bg-light p-1"></div>
                                    <input type="file" id="input-file" name="input-file" accept="image/*" onchange={
                                           handleChange()} hidden />
                                    <label class="btn-upload btn btn-primary mt-4" for="input-file">Upload Image</label>
                                </div>
                            </div><!--end col-->

                            <div class="col-md-6 mt-4 mt-sm-0">
                                <form>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="mb-3">
                                                <label class="form-label">Shop Title <span class="text-danger">*</span></label>
                                                <input name="name" id="name" type="text" class="form-control" placeholder="Title :">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label"> Price: </label>
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text border bg-transparent" id="basic-addon1">$</span>
                                                    <input type="number" min="0" class="form-control" placeholder="Price" aria-label="Price" aria-describedby="basic-addon1">
                                                </div>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Label:</label>
                                                <select class="form-control">
                                                    <option value="FE">Featured</option>
                                                    <option value="NE">New</option>
                                                    <option value="PO">Popular</option>
                                                    <option value="RE">Recent</option>
                                                    <option value="FR">Free</option>
                                                </select>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label"> Rating : </label>
                                                <input name="time" type="text" class="form-control" id="time" value="0">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-12 text-end">
                                            <button type="submit" class="btn btn-primary">Add Product</button>
                                        </div><!--end col-->
                                    </div>
                                </form>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div>
                </div>
            </div>
        </div>
        <!-- End modal -->

        <!-- javascript -->
        <script src="assets_son/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets_son/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets_son/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets_son/js/app.js"></script>

        <script>
                                        const handleChange = () => {
                                            const fileUploader = document.querySelector('#input-file');
                                            const getFile = fileUploader.files
                                            if (getFile.length !== 0) {
                                                const uploadedFile = getFile[0];
                                                readFile(uploadedFile);
                                            }
                                        }

                                        const readFile = (uploadedFile) => {
                                            if (uploadedFile) {
                                                const reader = new FileReader();
                                                reader.onload = () => {
                                                    const parent = document.querySelector('.preview-box');
                                                    parent.innerHTML = `<img class="preview-content" src=${reader.result} />`;
                                                };

                                                reader.readAsDataURL(uploadedFile);
                                            }
                                        };
        </script>
    </body>

</html>