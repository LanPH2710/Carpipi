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
            .modal {
                display: none; /* Ẩn modal mặc định */
                position: fixed;
                z-index: 1000; /* Đặt z-index cao hơn để modal nổi bật hơn */
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.7); /* Nền tối với độ trong suốt cao hơn */
            }

            .modal-content {
                background-color: #fff; /* Đặt nền trắng cho nội dung modal */
                margin: 5% auto; /* Căn giữa với khoảng cách từ trên */
                padding: 30px; /* Tăng độ padding */
                border-radius: 8px; /* Bo góc cho modal */
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Đổ bóng cho modal */
                width: 90%; /* Độ rộng modal */
                max-width: 500px; /* Độ rộng tối đa */
            }

            .close {
                color: #888;
                float: right;
                font-size: 24px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #333;
                text-decoration: none;
                cursor: pointer;
            }

            .product-info {
                display: flex;
                align-items: center; /* Căn giữa hình ảnh và tên sản phẩm */
                margin-bottom: 20px; /* Khoảng cách dưới hình ảnh sản phẩm */
            }

            h2 {
                margin: 0; /* Bỏ khoảng cách mặc định */
                font-size: 24px; /* Kích thước tiêu đề lớn hơn */
                color: #333; /* Màu tiêu đề */
            }

            .rating label, .comment label {
                font-weight: bold; /* Làm cho nhãn đậm hơn */
                margin-top: 10px; /* Khoảng cách trên nhãn */
            }

            textarea {
                width: 100%; /* Chiều rộng đầy đủ */
                padding: 10px; /* Padding cho textarea */
                border-radius: 4px; /* Bo góc cho textarea */
                border: 1px solid #ccc; /* Đường viền cho textarea */
                box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1); /* Đổ bóng cho textarea */
            }

            .modal-buttons {
                display: flex;
                justify-content: flex-end; /* Căn chỉnh nút ở bên phải */
                margin-top: 20px;
                gap: 5px;
            }

            .modal-buttons button {
                padding: 10px 15px; /* Padding cho nút */
                border: none; /* Bỏ đường viền */
                border-radius: 4px; /* Bo góc cho nút */
                cursor: pointer; /* Thay đổi con trỏ khi di chuột qua */
                transition: background-color 0.3s; /* Hiệu ứng chuyển màu nền */
            }

            .modal-buttons button:hover {
                background-color: #007bff; /* Màu nền khi hover */
                color: #fff; /* Màu chữ khi hover */
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
                        <li><a href="#"><i class="uil uil-cube me-2 d-inline-block"></i>Đơn Mua</a></li>
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
                                    <form method="get" id="searchform" class="searchform" action="searchCart">
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
                                <li class="breadcrumb-item active" aria-current="page">Đơn hàng</li>
                            </ul>
                        </nav>
                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="table-responsive bg-white shadow rounded">
                                    <div class="header">
                                        <ul class="tabs">
                                            <li class="active"><a href="myorder">Tất cả</a></li>
                                            <li><a href="myorder?statusId=1">Chờ xử lý</a></li>
                                            <li><a href="myorder?statusId=2">Đã xác nhận</a></li>
                                            <li><a href="myorder?statusId=3">Chờ giao hàng</a></li>
                                            <li><a href="myorder?statusId=4">Hoàn thành</a></li>
                                            <li><a href="myorder?statusId=5">Đã hủy</a></li>
                                            <li><a href="myorder?statusId=6">Hoàn trả</a></li>
                                            <li><a href="myorder?statusId=7">Tạm hoãn</a></li>
                                        </ul>
                                    </div>
                                    <div class="order-list">
                                        <c:choose>

                                            <c:when test="${empty requestScope.myOrder}">
                                                <p style="
                                                   text-align: center;
                                                   font-size: 18px;
                                                   color: #2c3e50;
                                                   background-color: #f0f8ff;
                                                   padding: 15px;
                                                   border-radius: 8px;
                                                   box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                                                   margin: 20px 0;
                                                   ">Chưa có đơn nào, xin hãy quay lại mua sắm.</p>
                                            </c:when>

                                            <c:otherwise>
                                                <c:forEach items="${requestScope.myOrder}" var="order">
                                                    <div class="order-item">
                                                        <div class="order-shop">

                                                            <a href="cartCompletionDetail.jsp">
                                                                <p class="delivery-status">${order.description}</p>
                                                            </a>&nbsp;&nbsp;
                                                            <c:if test="${fn:contains(order.description, 'Đơn hàng đã được giao đến tay khách hàng')}">
                                                                <a class="buy-again-btn" id="open-modal">Đánh giá</a>
                                                            </c:if>
                                                        </div>
                                                        <div class="order-details">
                                                            <div class="product-info">
                                                                <img src="${order.imageUrl}" class="product-img">
                                                                <div>
                                                                    <h4><a href="cartCompletionDetail.jsp" style="color: inherit;">${order.productName}</a></h4>
                                                                    <p>Hãng xe: ${order.brandName}</p>
                                                                    <p>Số lượng: ${order.quantity}</p>
                                                                    <p>Màu sắc: ${order.colorName}</p>
                                                                    <p class="price">
                                                                        <span>Giá: </span>
                                                                        <span style="text-decoration: line-through; color: #999;">
                                                                            <fmt:formatNumber value="${order.price}" type="currency" currencySymbol="USD"/>
                                                                        </span>&nbsp;
                                                                        <fmt:formatNumber value="${order.price * (1 - order.discount)}" type="currency" currencySymbol="USD"/>
                                                                    </p>
                                                                    <p>Thời gian: ${order.createDate}</p>
                                                                </div>

                                                                <div class="order-actions">
                                                                    <p class="price">
                                                                        <span style="color: #2c3e50">Thành tiền:</span>&nbsp;&nbsp;
                                                                        <fmt:formatNumber value="${order.price * (1 - order.discount) * order.quantity}" type="currency" currencySymbol="USD"/>
                                                                    </p>
                                                                    <button class="return-btn">Thông tin đơn hàng</button>
                                                                    <c:if test="${fn:contains(order.description, 'Đơn hàng đã được giao đến tay khách hàng')}">
                                                                        <a href="addToCart">
                                                                            <button class="buy-again-btn">Mua Lại</button>
                                                                        </a>
                                                                    </c:if>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <small>Xin hãy đánh giá trước ngày (ngày giao hàng xong + 30 ngày)</small>
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
                                            <li class="page-item"><a class="page-link" href="myorder?page=${page - 1}&statusId=${statusId}" aria-label="Previous">Prev</a></li>
                                            </c:if>
                                            <c:forEach begin="${(page - 1) <= 1 ? 1 : (page - 1)}" end="${page + 1 > num ? num : page + 1}" var="i">
                                                <c:choose>
                                                    <c:when test="${i == page}">
                                                    <li class="page-item active"><a class="page-link">${i}</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <li class="page-item"><a href="myorder?page=${i}&statusId=${statusId}" class="page-link">${i}</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${page < num}">
                                            <li class="page-item"><a class="page-link" href="myorder?page=${page + 1}&statusId=${statusId}" aria-label="Next">Next</a></li>
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
