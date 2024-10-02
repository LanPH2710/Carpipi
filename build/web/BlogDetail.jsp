<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
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

            .comment-section {
                background-color: #f9f9f9;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 30px;
            }

            .comment-item {
                border-bottom: 1px solid #ddd;
                padding: 10px 0;
                margin-bottom: 10px;
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
                <div class="blog-content">
                    <h1 class="blog-title">${blog.blogTitle}</h1>
                <div>
                    <p>Tác giả: ${author} | Ngày: ${blog.blogTime} | Thể loại: ${brand}</p>
                </div>
                <div class="blog-body">
                    <h2>${blog.blogInfo1}</h2>
                    <img src="${blog.blogImage}" class="blog-image">
                    <strong class="textImage mb-5">${blog.blogImageText}</strong>
                    <h5 style="margin-bottom: 100px">${blog.blogInfo2}</h5> 
                </div>
                <div class="comment-section">
                    <h3>Bình luận và Đánh giá</h3>
                    <div class="comments-list mb-5">
                        <c:forEach items="${comment}" var="comment">
                            <div class="comment-item">
                                <div class="comment-info">     
<!--                                    <small>${comment.commentDate}</small>-->
                                </div>
                                <div class="rating-stars">
                                    <c:forEach begin="1" end="${comment.rating}">
                                        &#9733;
                                    </c:forEach>
                                </div>
                                <p>${comment.commentInfor}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.account != null}">
                            <form action="blogdetail?blogId=${blog.blogId}" method="post">
                                <textarea name="commentInfor" rows="4" class="form-control mb-3" placeholder="Nhập bình luận của bạn" required></textarea>
                                <label for="rating">Đánh giá:</label>
                                <select name="rating" class="form-control mb-3" required>
                                    <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733;</option>
                                    <option value="4">&#9733;&#9733;&#9733;&#9733;</option>
                                    <option value="3">&#9733;&#9733;&#9733;</option>
                                    <option value="2">&#9733;&#9733;</option>
                                    <option value="1">&#9733;</option>
                                </select>
                                <%
                                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                                    String formattedDate = LocalDateTime.now().format(dtf);
                                %>
                                <input type="hidden" name="commentDate" value="<%= LocalDateTime.now() %>">
                                <input type="submit" value="Gửi bình luận" class="btn btn-primary">
                            </form>
                        </c:when>
                        <c:otherwise>
                            <p>Bạn cần <a href="login.jsp">đăng nhập</a> để bình luận.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="sidebar">
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
