<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi Tiết Bài Viết Blog</title>
        <!-- For logo png -->
        <link rel="shortcut icon" type="image/icon" href="img/logo3.png"/>
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
                margin: 20px auto;
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
                text-align: center; /* Thêm dòng này */
                display: block; /* Đảm bảo nó là block để căn giữa */
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
                margin-bottom: 20px;
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
        <jsp:include page="footerDemo.jsp"></jsp:include>
    </body>
</html>
