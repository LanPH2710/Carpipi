<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>PHPJabbers.com | Free Blog Website Template</title>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/style_blog.css">
        <style>
            .multi-line-truncate {
                display: -webkit-box;
                -webkit-line-clamp: 3; /* Giới hạn 3 dòng */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: normal;
            }

        </style>
    </head>
    <body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

        <!-- PRE LOADER -->
        <section class="preloader">
            <div class="spinner">

                <span class="spinner-rotate"></span>

            </div>
        </section>

        <jsp:include page="header.jsp"/>

        <section>
            <div class="container">
                <div class="text-center">
                    <h1>Post List</h1>
                </div>
            </div>
        </section>

        <section class="section-background">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 pull-right col-xs-12">
                        <div class="form">
                            <div class="form-group">
                                <label class="control-label">Blog Search</label>
                                <form action="postlist" method="get">
                                    <div class="input-group">
                                        <input type="text" name="search" class="form-control" placeholder="Search for...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit">Go!</button>
                                        </span>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <br>

                        <label class="control-label">Danh mục bài viết</label>
                        <ul class="list">
                            <li><a href="postlist">Tất cả bài viết</a></li>
                                <c:forEach items="${topic}" var="t">
                                <li><a href="postlist?topic=${t.blogTopicId}">${t.toppicName}</a></li>
                                </c:forEach>
                        </ul>

                        <br>
                        <label class="control-label">Bài viết theo ẩn/hiện</label>

                        <ul class="list">
                            <li><a href="postlist?status=0">Ẩn</a></li>
                            <li><a href="postlist?status=1">Hiện</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-9 col-xs-12">
                        <div class="row">
                            <c:forEach var="blog" items="${blogList}">
                                <div class="col-sm-6">
                                    <div class="courses-thumb courses-thumb-secondary">
                                        <div class="courses-top">
                                            <div class="courses-image">
                                                <img src="${blog.images[0].imageUrl}" class="img-responsive" alt="${blog.openBlog}" style="width: 470px; height: 300px; object-fit: cover;">
                                            </div>
                                            <div class="courses-date">
                                                <span title="Date"><i class="fa fa-calendar"></i> ${blog.blogTime}</span>
                                                <span title="Views">
                                                    <c:choose>
                                                        <c:when test="${blog.status == 1}">
                                                            <i class="fa fa-eye"></i> Hiện
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="fa fa-eye-slash"></i> Ẩn
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="courses-detail">
                                            <h3><a href="blogdetail?blogId=${blog.blogId}" class="multi-line-truncate">${blog.blogTitle}</a></h3>
                                        </div>
                                        <div class="courses-info">
                                            <a href="blogdetail?blogId=${blog.blogId}" class="section-btn btn btn-primary btn-block">Read More</a>
                                            <a href="editblog?blogId=${blog.blogId}" class="section-btn btn btn-primary btn-block">Edit</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
                <div class="clearfix">
                    <div class="hint-text text-muted">Showing <b>${blogList.size()}</b> out of <b>${size}</b> Blogs</div>
                    <ul class="pagination justify-content-center">
                        <!-- Điều hướng về trang trước -->
                        <c:if test="${page > 1}">
                            <li class="page-item">
                                <a class="page-link" href="postlist?page=${page - 1}&search=${search}&topic=${topicId}&status=${status}">
                                    <i class="fa fa-angle-double-left"></i>
                                </a>
                            </li>
                        </c:if>

                        <!-- Vòng lặp phân trang -->
                        <c:forEach begin="${(page - 1) <= 1 ? 1 : (page - 1)}" end="${page + 1 > num ? num : page + 1}" var="i">
                            <c:choose>
                                <c:when test="${i == page}">
                                    <!-- Trang hiện tại -->
                                    <li class="page-item active">
                                        <a class="page-link">${i}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <!-- Các trang khác -->
                                    <li class="page-item">
                                        <a href="postlist?page=${i}&search=${search}&topic=${topicId}&status=${status}" class="page-link">${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <!-- Điều hướng về trang sau -->
                        <c:if test="${page < num}">
                            <li class="page-item">
                                <a class="page-link" href="postlist?page=${page + 1}&search=${search}&topic=${topicId}&status=${status}">
                                    <i class="fa fa-angle-double-right"></i>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </section>
        <jsp:include page="footerDemo.jsp"></jsp:include>
        <!-- SCRIPTS -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>
