<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.DecimalFormat" %>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <title>Chi tiết sản phẩm</title>
        <style>
            body {
                background-color: #e64a19;
                padding: 20px;
            }
            .detail {
                max-width: 1500px;
                margin: auto;
                margin-top: 50px;
                margin-bottom: 50px;
                padding: 20px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
                background-color: #b9bbbe;
                border-radius: 8px; /* Bo góc cho detail */
            }
            .main-image {
                width: 100%; /* Sử dụng 100% chiều rộng */
                height: auto; /* Chiều cao tự động */
                margin-bottom: 10px;
                border-radius: 8px; /* Bo góc cho hình ảnh chính */
            }
            .product-images img {
                width: 80px;
                height: 100px;
                cursor: pointer;
                border-radius: 5px; /* Bo góc cho hình ảnh nhỏ */
                transition: transform 0.3s; /* Hiệu ứng zoom */
            }
            .product-images img:hover {
                transform: scale(1.1); /* Phóng to khi hover */
            }
            .button {
                display: inline-block;
                padding: 12px 30px;
                font-size: 16px;
                text-align: center;
                border: none;
                background-color: #ff5722;
                color: white;
                cursor: pointer;
                margin-right: 10px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .button:hover {
                background-color: #e64a19; /* Tối hơn khi hover */
            }

            .button-secondary {
                background-color: #e0e0e0;
                color: #0056b3;
            }

            .button-secondary:hover {
                background-color: #333; /* Tối hơn khi hover */
            }

            .b-auto__main-item {
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                padding: 15px;
                background-color: #fff;
                transition: transform 0.3s, box-shadow 0.3s;
            }

            .b-auto__main-item:hover {
                transform: translateY(-5px); /* Nâng lên nhẹ khi hover */
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            }

            .s-title {
                font-size: 28px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 30px;
                color: #333;
            }

            .b-featured {
                background-color: #f0f0f0;
                padding: 20px;
            }

            .quantity-input-container {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                margin-bottom: 30px;
            }

            .quantity-input button {
                width: 35px;
                height: 35px;
                font-size: 20px;
                background-color: #e0e0e0;
                border: none;
                cursor: pointer;
                border-radius: 5px; /* Bo góc nút */
                transition: background-color 0.3s;
            }

            .quantity-input button:hover {
                background-color: #d0d0d0; /* Tối hơn khi hover */
            }

            .quantity-input input {
                width: 50px;
                text-align: center;
                font-size: 18px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .reviews h4 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }

            .review-item {
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 10px;
                margin-bottom: 10px;
                transition: box-shadow 0.3s;
            }

            .review-item:hover {
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng khi hover */
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="detail">
                <div class="product-info row">
                    <!-- Tiêu đề -->
                    <div class="col-md-12">
                        <div class="bg-info text-white text-center py-2 mb-4 rounded">
                            <h3>${requestScope.pro.name}</h3>
                    </div>

                    <!-- Thông tin và hình ảnh -->
                    <div class="row">
                        <div class="col-md-5">
                            <!-- Bảng thông tin -->
                            <div class="bg-primary text-white text-center py-3 rounded">
                                <h4 class="m-0">Thông số kỹ thuật</h4>
                            </div>
                            <table class="table table-bordered mt-3">
                                <tbody>
                                    <tr><th>Hãng xe</th><td>${brand}</td></tr>
                                    <tr><th>Số ghế</th><td>${pro.seatNumber}</td></tr>
                                    <tr><th>Nguyên liệu</th><td>${pro.fuel}</td></tr>
                                    <tr><th>Phân khúc</th><td>${segment}</td></tr>
                                    <tr><th>Kiểu dáng</th><td>${style}</td></tr>
                                    <tr><th>Xuất xứ</th><td>Đức</td></tr>
                                </tbody>
                            </table> 
                            <div>
                                <p style="color: #ff5722; font-size: 30px; font-weight: bold;">Ưu đãi giảm giá:</p>
                                <h5 class="text-secondary">
                                    <del><fmt:formatNumber value="${pro.price}" type="number" pattern="#,###"/> VNĐ</del>
                                </h5>
                                <h3 class="text-primary">
                                    <fmt:formatNumber value="${pro.price * 0.8}" type="number" pattern="#,###"/> VNĐ
                                </h3>
                            </div>
                            <!-- Mô tả sản phẩm -->
                            <div class="description mt-4 p-3 border rounded bg-light">
                                <h4 class="text-primary" style="font-size: 30px">Thông tin mô tả</h4>
                                <p>${requestScope.pro.description}</p>
                            </div>
                        </div>

                        <div class="col-md-7 text-center">
                            <!-- Carousel -->
                            <div id="productImageCarousel" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <c:forEach items="${pro.images}" var="photo" varStatus="status">
                                        <div class="carousel-item ${status.first ? 'active' : ''}">
                                            <img id="mainImage" src="${photo.imageUrl}" class="main-image rounded" style="width: 100%; height: 400px; object-fit: cover;">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <!-- Hình ảnh nhỏ -->
                            <div class="product-images d-flex justify-content-center mt-3 gap-2 mb-5">
                                <c:forEach items="${pro.images}" var="photo">
                                    <img src="${photo.imageUrl}" class="img-thumbnail" onclick="changeImage('${photo.imageUrl}')">
                                </c:forEach>
                            </div>

                            <div class="quantity-input-container">
                                <span for="quantity" style="font-size: 18px;">Số lượng</span>
                                <div class="quantity-input">
                                    <button class="minus-btn" type="button" onclick="decreaseQuantity()">&#8722;</button>
                                    <input type="text" id="quantity" name="quantity" value="1" readonly>
                                    <button class="plus-btn" type="button" onclick="increaseQuantity()">&#43;</button>
                                    <span id="available-quantity">${pro.stock} sản phẩm có sẵn</span>
                                </div>
                            </div>

                            <div class="text-center">
                                <button class="button"><a href="addtocart?productId=${pro.productId}" style="text-decoration: none">Thêm vào giỏ hàng</a></button>
                                <button class="button button-secondary"><a href="buynow?productId=${pro.productId}" style="text-decoration: none">Mua ngay</a></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Đánh giá -->
            <div class="product-reviews row">
                <div class="col-md-12 reviews">
                    <h4 class="s-title">Đánh giá sản phẩm</h4>
                    <c:if test="${empty reviews}">
                        <p>Chưa có đánh giá nào cho sản phẩm này.</p>
                    </c:if>
                    <c:forEach items="${reviews}" var="review">
                        <div class="review-item">
                            <strong>${review.userName}</strong> - <span>${review.rating}★</span>
                            <p>${review.comment}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Xe cùng hãng -->
            <div class="related-products row">
                <div class="col-md-12 mt-4">
                    <h4 class="s-title">Xe cùng hãng</h4>
                    <div class="row">
                        <c:forEach items="${pro1}" var="pro1">
                            <div class="col-md-3 mb-3">
                                <div class="b-auto__main-item">
                                    <img style="width: 317px; height: 177px; object-fit: cover;" src="${pro1.images[0].imageUrl}" class="img-fluid" alt="${pro1.name}">
                                    <h5 class="mt-2" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                        ${pro1.name}
                                    </h5>
                                    <p class="text-primary"><fmt:formatNumber value="${pro1.price}" type="number" pattern="#,###"/> VNĐ</p>
                                    <a href="productdetail?productId=${pro1.productId}" class="button button-secondary" style="text-decoration: none">Chi tiết</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Xe cùng tầm giá -->
                <div class="col-md-12 mt-4">
                    <h4 class="s-title">Xe cùng tầm giá</h4>
                    <div class="row">
                        <c:forEach items="${pro2}" var="pro2">
                            <div class="col-md-3 mb-3">
                                <div class="b-auto__main-item">
                                    <img style="width: 317px; height: 177px; object-fit: cover;" src="${pro2.images[0].imageUrl}" class="img-fluid" alt="${pro2.name}">
                                    <h5 class="mt-2" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                        ${pro2.name}
                                    </h5>
                                    <p class="text-primary"><fmt:formatNumber value="${pro2.price}" type="number" pattern="#,###"/> VNĐ</p>
                                    <a href="productdetail?productId=${pro2.productId}" class="button button-secondary" style="text-decoration: none">Chi tiết</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script>
                                    function changeImage(imageUrl) {
                                        document.getElementById("mainImage").src = imageUrl;
                                    }

                                    function increaseQuantity() {
                                        var quantityInput = document.getElementById("quantity");
                                        var quantity = parseInt(quantityInput.value);
                                        var availableQuantity = parseInt("${pro.stock}");
                                        if (quantity < availableQuantity) {
                                            quantityInput.value = quantity + 1;
                                        }
                                    }

                                    function decreaseQuantity() {
                                        var quantityInput = document.getElementById("quantity");
                                        var quantity = parseInt(quantityInput.value);
                                        if (quantity > 1) {
                                            quantityInput.value = quantity - 1;
                                        }
                                    }
        </script>
    </body>
</html>
