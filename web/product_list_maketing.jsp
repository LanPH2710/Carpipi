<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="header.jsp"/>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shop | E-Shopper</title>

        <link href="css/css_fpt/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/css_fpt/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/css_fpt/css/prettyPhoto.css" rel="stylesheet">
        <link href="css/css_fpt/css/price-range.css" rel="stylesheet">
        <link href="css/css_fpt/css/animate.css" rel="stylesheet">
        <link href="css/css_fpt/css/main.css" rel="stylesheet">
        <link href="css/css_fpt/css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

        <div class="">
            <header id="header"><!--header-->
                <div class="header_top"><!--header_top-->

                </div><!--/header_top-->

                <div class="header-middle"><!--header-middle-->

                </div><!--/header-middle-->

                <div class="header-bottom"><!--header-bottom-->
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-9">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                                <div class="mainmenu pull-left">
                                    <ul class="nav navbar-nav collapse navbar-collapse">
                                        <li><a href="index.html">Home</a></li>
                                        <!-- <li class="dropdown"><a href="#" class="active">Shop<i class="fa fa-angle-down"></i></a>
            <ul role="menu" class="sub-menu">
                <li><a href="shop.html" class="active">Products</a></li>
                                                        <li><a href="product-details.html">Product Details</a></li> 
                                                        <li><a href="checkout.html">Checkout</a></li> 
                                                        <li><a href="cart.html">Cart</a></li> 
                                                        <li><a href="login.html">Login</a></li> 
            </ul>
        </li> 
                                        <li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
            <ul role="menu" class="sub-menu">
                <li><a href="blog.html">Blog List</a></li>
                                                        <li><a href="blog-single.html">Blog Single</a></li>
            </ul>
        </li> 
                                        <li><a href="404.html">404</a></li>
                                        <li><a href="contact-us.html">Contact</a></li> -->
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="search_box pull-right">
                                    <input type="text" placeholder="Search"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <section id="advertisement">
                <div class="container">
                    <!-- <img src="images/shop/advertisement.jpg" alt="" /> -->
                </div>
            </section>

            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="left-sidebar">
                                <h2>Brands</h2>
                                <div class="brands-name">
                                    <ul class="nav nav-pills nav-stacked">
                                        <li><a href=""><span class="pull-right">(50)</span>Mercedes</a></li>
                                        <li><a href=""><span class="pull-right">(50)</span>Audi</a></li>
                                        <li><a href=""><span class="pull-right">(50)</span>Porsche</a></li>
                                        <li><a href=""><span class="pull-right">(50)</span>BMW</a></li>
                                        <li><a href=""><span class="pull-right">(50)</span>Volkswagen</a></li>
                                    </ul>
                                </div>
                                <!--/brands_products-->

                                <div class="brands_products"><!--brands_products-->
                                    <h2>Brands</h2>
                                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordian" href="#style">
                                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                        Kiểu dáng
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="style" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <ul>
                                                        <li><a href="">Nike </a></li>
                                                        <li><a href="">Under Armour </a></li>
                                                        <li><a href="">Adidas </a></li>
                                                        <li><a href="">Puma</a></li>
                                                        <li><a href="">ASICS </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordian" href="#color">
                                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                        Màu sắc
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="color" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <ul>
                                                        <li><a href="">Nike </a></li>
                                                        <li><a href="">Under Armour </a></li>
                                                        <li><a href="">Adidas </a></li>
                                                        <li><a href="">Puma</a></li>
                                                        <li><a href="">ASICS </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordian" href="#segment">
                                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                        Phân khúc
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="segment" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <ul>
                                                        <li><a href="">Nike </a></li>
                                                        <li><a href="">Under Armour </a></li>
                                                        <li><a href="">Adidas </a></li>
                                                        <li><a href="">Puma</a></li>
                                                        <li><a href="">ASICS </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordian" href="#segment">
                                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                        Phân khúc
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="segment" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <ul>
                                                        <li><a href="">Nike </a></li>
                                                        <li><a href="">Under Armour </a></li>
                                                        <li><a href="">Adidas </a></li>
                                                        <li><a href="">Puma</a></li>
                                                        <li><a href="">ASICS </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordian">
                                                        <span class="badge pull-right"></span>
                                                        Xe nổi bật
                                                    </a>
                                                </h4>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                                <!--/category_products-->

                                <div class="price-range"><!--price-range-->
                                    <h2>Price Range</h2>
                                    <div class="well">
                                        <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br/>
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
                                <c:forEach items="${listProduct}" var="product">
                                    <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <c:choose>
                                                    <c:when test="${not empty pro.images}">
                                                        <img src="${product.images[1].imageUrl}" alt="${product.name}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="assets/images/welcome-hero/welcome-banner.jpg" alt="${product.name}">
                                                    </c:otherwise>
                                                </c:choose>
                                                <h2><fmt:formatNumber value="${product.getPrice()}" type="number" pattern="#,###"/>đ</h2>
                                                <p>${product.name}</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                            <div class="product-overlay">
                                                <div class="overlay-content">
                                                    <h2><fmt:formatNumber value="${product.getPrice()}" type="number" pattern="#,###"/>đ</h2>
                                                    <div><a href="product?product=${pro.productId}" class="product-detail-link">${product.name}</a></div>
                                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-2x"></i>Chi tiết</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>




                        </section>

                        <footer id="footer"><!--Footer-->
                            <div class="footer-top">

                            </div>

                            <div class="footer-widget">

                            </div>

                        </footer>
                        <!--/Footer-->


                    </div>

                    <script src="./css/css_fpt/js/jquery.js"></script>
                    <script src="./css/css_fpt/js/price-range.js"></script>
                    <script src="./css/css_fpt/js/jquery.scrollUp.min.js"></script>
                    <script src="./css/css_fpt/js/bootstrap.min.js"></script>
                    <script src="./css/css_fpt/js/jquery.prettyPhoto.js"></script>
                    <script src="./css/css_fpt/js/main.js"></script>



                    </body>



                    </html>
