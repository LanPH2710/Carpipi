<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Detail Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
        <style>
            .container{
                background-color: white;
                padding: 30px;
                margin-bottom: 50px;
                border-radius: 3px; /* Border radius set to 3px */
                box-shadow: 0 10px 40px 0px rgba(38, 40, 64, .2);
                position: relative;
            }
            .icon-hover:hover {
                border-color: #3b71ca !important;
                background-color: white !important;
                color: #3b71ca !important;
            }
            .icon-hover:hover i {
                color: #3b71ca !important;
            }
            .product-img {
                max-width: 100%;
                height: auto;
            }
            h4 {
                font-size: 3.5rem; /* Kích thước chữ cho tiêu đề */
            }
            .mb-3 p {
                font-size: 1.75rem; /* Kích thước chữ cho mô tả sản phẩm */
            }
            .h5 {
                font-size: 2.5rem; /* Kích thước chữ cho giá sản phẩm */
            }
            .col-6{
                font-size: 1.25rem;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container py-5">
                <div class="row">
                    <aside class="col-lg-7">
                        <div class="mb-3">
                        <c:forEach items="${requestScope.pro.images}" var="photo" varStatus="status">
                            <c:if test="${status.first}">
                                <img id="mainImage" src="${photo.imageUrl}" alt="Product Image" class="product-img rounded" style="width: 900px; height: 400px; object-fit: cover;">
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="d-flex justify-content-center mb-3">
                        <%-- Thumbnails for images --%>
                        <c:forEach items="${requestScope.pro.images}" var="photo">
                            <a class="mx-1" href="javascript:void(0);" onclick="changeMainImage('${photo.imageUrl}')" data-fslightbox="mygallery">
                                <img src="${photo.imageUrl}" class="rounded-2" width="80" height="60" alt="Thumbnail">
                            </a>
                        </c:forEach>
                    </div>
                </aside>

                <script>
                    function changeMainImage(imageUrl) {
                        document.getElementById("mainImage").src = imageUrl;
                    }
                </script>

                <main class="col-lg-5">
                    <h4 class="text-dark">${pro.name}</h4>
                    <div class="d-flex align-items-center my-3">
                        <div class="text-warning mb-1">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                            <span class="ms-1">4.5</span>
                        </div>
                        <span class="text-muted mx-2"><i class="fas fa-shopping-basket"></i> 154 orders</span>
                        <span class="text-success">In stock</span>
                    </div>
                    <div class="mb-3">
                        <span class="h5"><fmt:formatNumber value="${pro.price}" type="number" pattern="#,###"/> VNĐ</span> <span class="text-muted"></span>
                    </div>
                    <p style="font-size: 1.5 rem;">${pro.description}</p>
                    <div class="row">
                        <div class="col-6"><strong>Hãng:</strong> ${brand}</div>
                        <div class="col-6"><strong>Kiểu dáng:</strong> ${style}</div>
                        <div class="col-6"><strong>Số ghế:</strong> ${pro.seatNumber}</div>
                        <div class="col-6"><strong>Phân khúc:</strong> ${segment}</div>
                        <div class="col-6"><strong>Nguyên liệu:</strong> ${pro.fuel}</div>
                        <div class="col-6"><strong>Nhà phân phối:</strong> ${supply}</div>
                    </div>
                    <hr>
                    <div class="mb-4">
                        <label class="mb-2 h6">Số lượng</label>
                        <div class="input-group mb-3">
                            <button class="btn btn-outline-secondary" type="button" onclick="decreaseQuantity()">
                                <i class="fas fa-minus"></i>
                            </button>
                            <input type="text" class="form-control text-center" id="quantity" value="1" aria-label="Số lượng" style="max-width: 60px;" readonly />
                            <button class="btn btn-outline-secondary" type="button" onclick="increaseQuantity()">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                        <span class="text-muted" id="stock-info">${pro.stock} sản phẩm có sẵn</span>
                    </div>

                    <script>
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
                    <a href="#" class="btn btn-warning">Buy now</a>
                    <a href="#" class="btn btn-primary"><i class="fas fa-shopping-basket"></i> Add to cart</a>
                </main>
            </div>

            <section class="bg-light border-top py-4 mt-5">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="h5">Đánh giá sản phẩm</div>
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" href="#pills-home" role="tab">Tất cả</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="pills-5star-tab" data-bs-toggle="pill" href="#pills-5star" role="tab">5 sao (số lượng)</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="pills-4star-tab" data-bs-toggle="pill" href="#pills-4star" role="tab">4 sao (số lượng)</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="pills-3star-tab" data-bs-toggle="pill" href="#pills-3star" role="tab">3 sao (số lượng)</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="pills-2star-tab" data-bs-toggle="pill" href="#pills-2star" role="tab">2 sao (số lượng)</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="pills-1star-tab" data-bs-toggle="pill" href="#pills-1star" role="tab">1 sao (số lượng)</a>
                            </li>
                        </ul>

                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                                <p>Product specifications and features...</p>
                            </div>

                            <!-- 5 Star Reviews -->
                            <div class="tab-pane fade" id="pills-5star" role="tabpanel">
                                <div class="review p-3 mb-3" style="background-color: #f8f9fa; border-radius: 8px; border: 1px solid #dee2e6;">
                                    <div class="review-header d-flex align-items-center">
                                        <img style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover; margin-right: 15px;" 
                                             src="https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/anh-avatar-cute-58.jpg" 
                                             alt="Avatar của Ngọc Minh" class="avatar">
                                        <div>
                                            <h6 class="mb-1 font-weight-bold">Ngọc Minh</h6>
                                            <div class="text-warning">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="review-body mt-3">
                                        <p>Sản phẩm rất tốt! Chất lượng vượt xa mong đợi. Tôi sẽ giới thiệu cho bạn bè.</p>
                                    </div>
                                </div>

                                <div class="review p-3 mb-3" style="background-color: #f8f9fa; border-radius: 8px; border: 1px solid #dee2e6;">
                                    <div class="review-header d-flex align-items-center">
                                        <img style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover; margin-right: 15px;" 
                                             src="https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/anh-avatar-cute-58.jpg" 
                                             alt="Avatar của Quỳnh Anh" class="avatar">
                                        <div>
                                            <h6 class="mb-1 font-weight-bold">Quỳnh Anh</h6>
                                            <div class="text-warning">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="review-body mt-3">
                                        <p>Đã mua lần thứ hai, sản phẩm không có gì để chê. Giao hàng nhanh chóng, đóng gói cẩn thận.</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Other Star Ratings Placeholder -->
                            <div class="tab-pane fade" id="pills-4star" role="tabpanel">
                                <p>4 sao</p>
                            </div>
                            <div class="tab-pane fade" id="pills-3star" role="tabpanel">
                                <p>3 sao</p>
                            </div>
                            <div class="tab-pane fade" id="pills-2star" role="tabpanel">
                                <p>2 sao</p>
                            </div>
                            <div class="tab-pane fade" id="pills-1star" role="tabpanel">
                                <p>1 sao</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="border rounded-2 p-3">
                            <h5>Các xe cùng tầm giá</h5>
                            <c:forEach items="${pro1}" var="pro2">
                                <div class="d-flex mb-3">
                                    <img src="${pro2.images[0].imageUrl}" class="img-thumbnail me-3" style="width: 50%; height: auto; object-fit: cover;" alt="Product Image"/>
                                    <div>
                                        <a href="#" class="nav-link">${pro2.name}</a>
                                        <strong class="text-dark">
                                            <fmt:formatNumber value="${pro2.price}" type="number" pattern="#,###"/> VNĐ
                                        </strong>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <jsp:include page="footerDemo.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
