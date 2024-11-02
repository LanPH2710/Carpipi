<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.4;
                background-color: #f8f9fa;
                color: #333;
            }

            .header {
                margin-top: 20px;
            }

            .header .tabs {
                display: flex;
                gap: 20px;
            }

            .header .tabs li {
                list-style: none;
            }

            .header .tabs li a {
                text-decoration: none;
                color: #555;
                font-size: 16px;
                padding: 8px 15px;
                border-bottom: 3px solid transparent;
                transition: border-bottom 0.3s ease, color 0.3s ease;
            }

            .header .tabs li a:hover,
            .header .tabs .active a {
                border-bottom: 3px solid orange;
                color: orange;
            }

            .order-list {
                margin-top: 20px;
            }

            .order-item {
                background-color: white;
                border: 1px solid #e0e0e0;
                padding: 20px;
                margin: 15px;
                border-radius: 10px;
                transition: box-shadow 0.3s ease;
            }

            .order-item:hover {
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            }

            .order-shop {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                gap: 5px;
            }

            .view-shop-btn {
                padding: 8px 16px;
                background-color: #2980b9;
                color: white;
                border-radius: 5px;
                font-size: 14px;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .view-shop-btn:hover {
                background-color: #1e6389;
            }

            .order-details {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .product-info {
                display: flex;
                align-items: center;
                width: 100%;
            }

            .product-info > div {
                flex: 1;
            }

            .product-info img {
                width: auto;
                height: 280px;
                margin-right: 20px;
                border-radius: 10px;
            }

            .order-details h4 {
                font-size: 22px;
                color: #2c3e50;
            }

            .order-details p {
                font-size: 18px;
            }

            .order-actions {
                margin-left: auto;
                text-align: right;
            }

            .order-actions .price {
                color: #e74c3c;
                font-size: 22px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .return-btn,
            .buy-again-btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease;
            }

            .return-btn {
                background-color: #7f8c8d;
                color: white;
            }

            .return-btn:hover {
                background-color: #616a6e;
            }

            .buy-again-btn {
                background-color: #e74c3c;
                color: white;
            }

            .buy-again-btn:hover {
                background-color: #c0392b;
            }

            .delivery-status {
                margin-top: 13px;
                font-size: 18px;
                color: green;
            }
        </style>
    </head>
    <body>
        <div class="page-wrapper doctris-theme toggled">
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <div class="sidebar-brand">
                        <a href="home">
                            <img src="img/logoBlack.png" height="120" class="logo-light-mode" alt="">
                        </a>
                    </div>
                    <ul class="sidebar-menu pt-3">
                        <li>
                            <a href="userpro"><i class="uil uil-user me-2 d-inline-block"></i>Profile</a>
                        </li>
                        <li><a href="myorder"><i class="uil uil-cube me-2 d-inline-block"></i>Đơn Mua</a></li>
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
            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="assets1/images/logo-icon.png" height="30" class="small" alt="">
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form method="get" id="searchform" class="searchform" action="shipper">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="keyword" id="s" placeholder="Search Keywords..." value="${param.keyword}" >
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>                             
                                </div>
                            </div>
                            <a href="myorder" class="btn btn-secondary ms-2">Reset Search</a> <!-- Reset button -->
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                            <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Vận chuyển</li>
                            </ul>
                        </nav>
                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="table-responsive bg-white shadow rounded">
                                    <div class="header">
                                        <c:set var="currentStatusId" value="${param.statusId != null ? param.statusId : 0}" />
                                        <ul class="tabs">
                                            <li class="${currentStatusId == 0 ? 'active' : ''}"><a href="shipper">Tất cả</a></li>
                                            <li class="${currentStatusId == 2 ? 'active' : ''}"><a href="shipper?statusId=2">Đã xác nhận</a></li>
                                            <li class="${currentStatusId == 3 ? 'active' : ''}"><a href="shipper?statusId=3">Chờ giao hàng</a></li>
                                            <li class="${currentStatusId == 4 ? 'active' : ''}"><a href="shipper?statusId=4">Hoàn thành</a></li>
                                        </ul>
                                    </div>
                                    <div class="order-list">
                                        <c:choose>

                                            <c:when test="${empty requestScope.order}">
                                                <p style="
                                                   text-align: center;
                                                   font-size: 18px;
                                                   color: #2c3e50;
                                                   background-color: #f0f8ff;
                                                   padding: 15px;
                                                   border-radius: 8px;
                                                   box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                                                   margin: 20px 0;
                                                   ">Chưa có đơn nào, xin hãy chờ khách mua hàng.</p>
                                            </c:when>

                                            <c:otherwise>
                                                <c:forEach items="${order}" var="order">
                                                    <div class="order-item">
                                                        <div class="order-shop">
                                                            <a href="cartCompletionDetail.jsp">
                                                                <p class="delivery-status">${order.description}</p>
                                                            </a>&nbsp;&nbsp;
                                                        </div>
                                                        <div class="order-details">
                                                            <div class="product-info">
                                                                <img src="${order.imageUrl}" class="product-img">
                                                                <div>
                                                                    <h4><a href="cartCompletionDetail.jsp" style="color: inherit;">${order.productName}</a></h4>
                                                                    <p>Hãng xe: ${order.brandName}</p>
                                                                    <p>Số lượng: ${order.quantity}</p>
                                                                    <p class="price">
                                                                        <span>Giá: </span>
                                                                        <fmt:formatNumber value="${order.price}" type="currency" currencySymbol="USD"/>
                                                                    </p>
                                                                    <p>Màu sắc: ${order.colorName}</p>
                                                                    <p>Thời gian: ${order.createDate}</p>
                                                                </div>
                                                                <div class="order-actions">
                                                                    <p class="price">
                                                                        <span style="color: #2c3e50">Thành tiền:</span>&nbsp;&nbsp;
                                                                        <fmt:formatNumber value="${order.price * (1 - order.discount) * order.quantity}" type="currency" currencySymbol="USD"/>
                                                                    </p>
                                                                    <button class="buy-again-btn">Thông tin đơn hàng</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div><!--end row--> 
                        </div>
                        <div class="row text-center">
                            <!-- Pagination -->
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <span class="text-muted me-3">Showing <b>${page}</b> out of <b>${num}</b> pages customers</span>
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <c:if test="${page > 1}">
                                            <li class="page-item"><a class="page-link" href="shipper?page=${page - 1}&statusId=${statusId}&keyword=${keyword}" aria-label="Previous">Prev</a></li>
                                            </c:if>
                                            <c:forEach begin="${(page - 1) <= 1 ? 1 : (page - 1)}" end="${page + 1 > num ? num : page + 1}" var="i">
                                                <c:choose>
                                                    <c:when test="${i == page}">
                                                    <li class="page-item active"><a class="page-link">${i}</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <li class="page-item"><a href="shipper?page=${i}&statusId=${statusId}&keyword=${keyword}" class="page-link">${i}</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${page < num}">
                                            <li class="page-item"><a class="page-link" href="shipper?page=${page + 1}&statusId=${statusId}&keyword=${keyword}" aria-label="Next">Next</a></li>
                                            </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div><!--end container-->
            </main>
        </div>
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
