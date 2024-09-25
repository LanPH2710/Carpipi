<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- meta data -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--font-family-->
<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet">

<!-- title of site -->
<title>CarShop</title>

<!-- For favicon png -->
<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>

<!-- Các link CSS khác -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/linearicons.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootsnav.css">    
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
    .car-desc {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2; /* number of lines to show */
        line-clamp: 2;
        -webkit-box-orient: vertical;
    }
</style>

<!-- Nội dung body cần import -->
<div class="top-area">
    <div class="header-area">
        <!-- Start Navigation -->
        <nav class="navbar navbar-default bootsnav navbar-sticky navbar-scrollspy" data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="index.jsp">Carpipi<span></span></a>
                </div>
                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                    <li class="active"><a href="HomePage.jsp#home">Trang Chủ</a></li>
                    <li><a href="HomePage.jsp#featured-cars">Xe tiêu biểu</a></li>
                    <li><a href="HomePage.jsp#new-cars">Mẫu mới</a></li>
                    <li><a href="HomePage.jsp#brand">Hãng</a></li>
                    <li><a href="HomePage.jsp#contact">Liên lạc</a></li>
                    <li><a href="login.jsp">Đăng Nhập</a></li>
                </ul>
            </div>
        </nav>
        <!-- End Navigation -->
    </div>
    <div class="clearfix"></div>
</div>
