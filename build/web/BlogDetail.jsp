<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi Tiết Bài Viết Blog</title>
        <style>
            /* resources/css/styles.css */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            .container {
                display: flex;
                margin: 30px 0px 50px 0px;
                max-width: 1200px;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .blog-content {
                width: 70%;
                padding: 20px;
                box-sizing: border-box;
            }

            .blog-title {
                font-size: 3.5em;
                color: #333;
                margin-bottom: 10px;
            }

            .blog-meta {
                color: #777;
                font-size: 1em;
                margin-bottom: 20px;
            }

            .blog-image {
                max-width: 100%;
                height: auto;
                margin: 20px 0;
            }

            .textImage {
                color: #b21f2d;
                font-size: 1em;
                text-align: center;
                display: block;
            }

            .blog-footer {
                font-size: 0.8em;
                color: #555;
                text-align: center;
                margin-top: 30px;
            }

            .sidebar {
                width: 30%;
                padding: 20px;
                box-sizing: border-box;
                border-left: 1px solid #ddd;
            }

            .search-box input[type="text"] {
                width: calc(100% - 22px);
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-bottom: 10px;
            }

            .search-box input[type="submit"] {
                padding: 5px 10px;
                border: none;
                background-color: #007bff;
                color: white;
                cursor: pointer;
                border-radius: 4px;
                margin-bottom: 50px;
            }

            .categories ul {
                list-style-type: none;
                padding: 0;
            }

            .categories ul li {
                margin-bottom: 10px;
            }

            .categories ul li a {
                text-decoration: none;
                color: #333;
            }

            .static-links a {
                display: block;
                margin-bottom: 10px;
                text-decoration: none;
                color: #007bff;
            }

            .static-links a:hover {
                text-decoration: underline;
            }

            .footInfo,
            .footInfoH{
                color: white;
                font-size: 16px;
                list-style-type: none;
                text-decoration:none;
                padding-left: 10px;
                padding-right: 10px;
                padding-top: 15px;
            }

            .footH2{
                color: white;
                height: 80px;
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <!-- Nội dung blog -->
                <div class="blog-content">
                    <!-- Tiêu đề blog -->
                    <h1 class="blog-title">${blog.blogTitle}</h1>

                <!-- Thông tin meta (tác giả, ngày) -->
                <div class="blog-meta">
                    <p>Tác giả: ${author} | Ngày: ${blog.blogTime} | Thể loại: ${brand}</p>
                </div>

                <!-- Câu chủ đạo blog -->
                <div class="blog-body">
                    <h2>${blog.blogInfo1}</h2>
                    <!-- Hình ảnh minh họa -->
                    <img src="${blog.blogImage}" class="blog-image">
                    <strong class="textImage mb-5">${blog.blogImageText}</strong>
                    <h5>${blog.blogInfo2}</h5> 
                </div>
            </div>

            <!-- Thanh bên (sider) -->
            <div class="sidebar">

                <!-- Hộp tìm kiếm bài viết -->
                <div class="search-box">
                    <form action="searchblog" method="get">
                        <input type="text" name="name" placeholder="Tìm kiếm bài viết theo tên.">
                        <input type="submit" value="Tìm kiếm">
                    </form>
                </div>

                <!-- Các thể loại bài viết -->
                <div class="categories">
                    <h3>Danh Mục Bài Viết</h3>
                    <ul>
                        <c:forEach items="${requestScope.brands}" var="b">
                            <li><a href="#">${b.brandName}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div class="footer" style="background-color: #333; color: #fff; padding: 20px; text-align: center">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-footer-widget">
                        <div class="footer-logo">
                            <a href="index.html" target="_blank" style="color: black"> <img class="headerLogo" src="img/logoWnoBG.png" alt="" style="height: 80px;"></a>
                        </div>
                        <p class="footInfo" style="color: white; font-size: 16px">
                            Công ty chúng tôi chuyên phân phối các hãng xe của Đức.
                        </p>
                        <div class="footer-contact">
                            <ul>
                                <a href="mailto:carpipi@gmail.com" style="text-decoration: none; color: white; font-size: 16px">
                                    <i class="fa fa-envelope"></i>
                                    carpipi@gmail.com
                                </a>
                            </ul>
                            <ul style="color: white; font-size: 16px">
                                <i class="fa fa-phone"></i>
                                0987654321
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-sm-6">
                    <div class="single-footer-widget" style="color: white; font-size: 16px">
                        <h2 class="footH2" style=" font-size: 20px; height: 80px">Về Carpipi</h2>
                        <ul class="footInfoH">
                            <li><a class="footInfo" href="#">Về chúng tôi</a></li>
                            <li><a class="footInfo" href="#">Sự nghiệp</a></li>
                            <li><a class="footInfo" href="#">Điều khoản dịch vụ</a></li>
                            <li><a class="footInfo" href="#">Chính sách bảo mật </a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12">
                    <div class="single-footer-widget">
                        <h2 class="footH2" style="font-size: 22px; margin-bottom: 20px;">Thương Hiệu Hàng Đầu</h2>
                        <div class="row">
                            <div class="col-md-6 col-xs-6" style="padding-right: 5px;">
                                <ul class="footInfoH" style="padding: 0; list-style: none;">
                                    <li><a class="footInfo" href="#" style="color: white; transition: color 0.3s;">BMW</a></li>
                                    <li><a class="footInfo" href="#" style="color: white; transition: color 0.3s;">Audi</a></li>
                                    <li><a class="footInfo" href="#" style="color: white; transition: color 0.3s;">Mercedes</a></li>
                                </ul>
                            </div>
                            <div class="col-md-6 col-xs-6" style="padding-left: 5px;"> 
                                <ul class="footInfoH" style="padding: 0; list-style: none;">
                                    <li><a class="footInfo" href="#" style="color: white; transition: color 0.3s;">Volkswagen</a></li>
                                    <li><a class="footInfo" href="#" style="color: white; transition: color 0.3s;">Porsche</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
