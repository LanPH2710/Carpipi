<%-- 
    Document   : productList
    Created on : Oct 11, 2024, 2:35:37 PM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Carpipi product list</title>
        <link href="cssFpt/bootstrap.min.css" rel="stylesheet">
        <link href="cssFpt/font-awesome.min.css" rel="stylesheet">
        <link href="cssFpt/font-awesome.min.css" rel="stylesheet">
        <link href="cssFpt/price-range.css" rel="stylesheet">
        <link href="cssFpt/animate.css" rel="stylesheet">
        <link href="cssFpt/main.css" rel="stylesheet">
        <link href="cssFpt/responsive.css" rel="stylesheet">

        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

        <style>
            .paginationProList {
                float: right;
                margin: 0 0 5px;
            }

            .paginationProList li a {
                border: none;
                font-size: 95%;
                width: 30px;
                height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 30px !important;
                text-align: center;
                padding: 0;
            }

            .paginationProList li a:hover {
                color: #666;
            }

            .paginationProList li.active a {
                background: #03A9F4;
            }

            .paginationProList li.active a:hover {
                background: #0397d6;
            }

            .paginationProList li.disabled i {
                color: #ccc;
            }

            .paginationProList li i {
                font-size: 16px;
                padding-top: 6px;
            }

            .hint-text {
                float: left;
                margin-top: 6px;
                font-size: 95%;
            }
        </style>
    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>

        <div class="container">
            <div class="row">
                <!-- Header Section -->
                <div class="col-sm-2">
                    <header id="header">
                        <div class="header-bottom">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="search_box pull-right">
                                            <input type="text" placeholder="Search"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                </div>

                <!-- Advertisement Section -->
                <div class="col-sm-10">
                    <section id="advertisement">
                        <div class="container">
                            <img src="assets/images/welcome-hero/welcome-banner.jpg" alt="" class="img-responsive" />
                        </div>
                    </section>
                </div>
            </div>
        </div>


        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Hãng Xe</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <c:forEach var="brand" items="${brandList}">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title"><a href="brand?brandId=${brand.brandId}&page=1">${brand.brandName}</a></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div><!--/category-productsr-->
                            <div class="brands_products"><!--brands_products-->
                                <h2>Kiểu Dáng</h2>
                                <div class="brands-name">
                                    <ul class="nav nav-pills nav-stacked">
                                        <c:forEach var="style" items="${styleList}">
                                            <li><a href=""> <span class="pull-right"></span>${style.styleName}</a></li>
                                                </c:forEach>
                                    </ul>
                                </div>
                            </div><!--/brands_products-->

                            <div class="price-range"><!--price-range-->
                                <h2>Price Range</h2>
                                <div class="well">
                                    <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                                    <b>$ 0</b> <b class="pull-right">$ 600</b>
                                </div>
                            </div><!--/price-range-->

                            <div class="shipping text-center"><!--shipping-->
                                <img src="images/home/shipping.jpg" alt="" />
                            </div><!--/shipping-->
                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Features Items</h2>
                            <c:forEach var="pro" items="${productList}">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <c:choose>
                                                    <c:when test="${not empty pro.images}">
                                                        <img src="${pro.images[1].imageUrl}" alt="${pro.name}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="assets/images/default-car.png" alt="${pro.name}">
                                                    </c:otherwise>
                                                </c:choose>
                                                <h2><fmt:formatNumber value="${pro.getPrice()}" type="number" pattern="#,###"/>đ</h2>
                                                <p>${pro.name}</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                            <div class="product-overlay">
                                                <div class="overlay-content">
                                                    <h2><fmt:formatNumber value="${pro.getPrice()}" type="number" pattern="#,###"/>đ</h2>
                                                    <div><a href="productdetail?productId=${pro.productId}" class="product-detail-link">${pro.name}</a></div>
                                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="clearfix">

                                <ul class="paginationProList justify-content-center">
                                    <!-- Điều hướng về trang trước -->
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="productlist?page=${currentPage - 1}">
                                                <i class="fa fa-angle-double-left"></i>
                                            </a>
                                        </li>
                                    </c:if>

                                    <!-- Vòng lặp phân trang -->
                                    <c:forEach begin="${(currentPage - 1) <= 1 ? 1 : (currentPage - 1)}" end="${currentPage + 1 > totalPages ? totalPages : currentPage + 1}" var="i">
                                        <c:choose>
                                            <c:when test="${i == currentPage}">
                                                <!-- Trang hiện tại -->
                                                <li class="page-item active">
                                                    <a class="page-link">${i}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <!-- Các trang khác -->
                                                <li class="page-item">
                                                    <a href="productlist?page=${i}" class="page-link">${i}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                    <!-- Điều hướng về trang sau -->
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="productlist?page=${currentPage + 1}">
                                                <i class="fa fa-angle-double-right"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>

                        </div><!--features_items-->
                    </div>
                </div>
            </div>
        </section>

        <script src="jsFpt/jquery_1.js"></script>
        <script src="jsFpt/price-range.js"></script>
        <script src="jsFpt/jquery.scrollUp.min.js"></script>
        <script src="jsFpt/bootstrap.min_2.js"></script>
        <script src="jsFpt/jquery.prettyPhoto.js"></script>
        <script src="jsFpt/main_1.js"></script>
    </body>
</html>