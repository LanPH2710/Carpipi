<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${blog.blogTitle}</title>
        <style>
            body {
                font-family: 'Helvetica Neue', Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                color: #333;
            }

            .container1 {
                display: flex;
                margin: 50px auto;
                max-width: 1600px;
                justify-content: center;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }

            .blog-content {
                width: 65%;
                padding: 40px;
                background-color: #fff;
                box-shadow: 5px 0 15px rgba(0, 0, 0, 0.05);
            }

            .blog-title {
                font-size: 2.5em;
                margin-bottom: 20px;
                color: #333;
                text-align: center;
                border-bottom: 2px solid #00aaff;
                padding-bottom: 10px;
            }

            .blog-meta {
                font-size: 1em;
                color: #888;
                text-align: center;
                margin-bottom: 40px;
            }

            .blog-image-container {
                text-align: center;
                margin-bottom: 40px;
            }

            .blog-image {
                max-width: 100%;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }

            .textImage {
                display: block;
                margin-top: 10px;
                font-size: 0.85em;
                color: #666;
                text-align: center;
            }

            .blog-section {
                margin-bottom: 30px;
            }

            .blog-section h5 {
                font-size: 1.5em;
                margin-bottom: 10px;
                color: #444;
            }

            .blog-section p {
                line-height: 1.7;
                color: #666;
            }

            .blog-conclusion {
                margin-top: 30px;
                padding: 20px;
                background-color: #f9f9f9;
                border-left: 5px solid #00aaff;
                font-style: italic;
            }

            /* Comment Section Styles */
            .comment-section {
                margin-top: 50px;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .comment-item {
                padding: 15px;
                border-bottom: 1px solid #ddd;
                margin-bottom: 15px;
            }

            .comment-info {
                font-size: 0.8em;
                color: #888;
                margin-bottom: 5px;
            }

            .rating-stars {
                color: #ffcc00; /* Gold color for stars */
            }

            .comment-sort-form {
                margin-bottom: 20px;
            }

            /* Sidebar Styles */
            .sidebar {
                width: 35%;
                padding: 40px;
                background-color: #fafafa;
                box-shadow: -5px 0 15px rgba(0, 0, 0, 0.1);
                border-radius: 10px; /* Thêm bo tròn cho sidebar */
                margin-right: 20px; /* Khoảng cách bên phải */
            }

            .categories {
                background-color: #f4f4f4;
                padding: 20px;
                border-radius: 10px;
            }

            .categories h3 {
                font-size: 1.6em; /* Tăng kích thước chữ */
                margin-bottom: 20px;
                color: #333;
                text-align: center; /* Căn giữa tiêu đề */
            }

            .latest-post-item {
                display: flex;
                margin-bottom: 15px; /* Giảm khoảng cách giữa các mục */
                border-bottom: 1px solid #ddd;
                padding-bottom: 15px;
                padding-top: 15px; /* Thêm khoảng cách trên cùng */
            }

            .latest-post-image {
                max-width: 120px;
                height: auto;
                margin-right: 15px; /* Giảm khoảng cách bên phải hình ảnh */
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Thêm đổ bóng cho hình ảnh */
            }

            .latest-post-info {
                flex: 1; /* Đảm bảo thông tin chiếm hết không gian còn lại */
            }

            .latest-post-info h4 {
                font-size: 1.2em; /* Tăng kích thước chữ tiêu đề */
                margin-bottom: 5px; /* Giảm khoảng cách dưới tiêu đề */
                color: #333;
                transition: color 0.3s;
            }

            .latest-post-info h4 a {
                color: inherit; /* Sử dụng màu sắc của h4 */
                text-decoration: none; /* Xóa gạch chân */
            }

            .latest-post-info h4 a:hover {
                color: #00aaff; /* Đổi màu khi hover */
            }

            .post-date {
                color: #666; /* Màu sắc cho ngày đăng */
                font-size: 0.9em; /* Giảm kích thước chữ cho ngày */
            }

            .footer {
                background-color: #333;
                color: #fff;
                padding: 40px 0;
                text-align: center;
                margin-top: 50px;
            }

            .footer-contact a {
                color: #fff;
                text-decoration: none;
                font-size: 16px;
                transition: color 0.3s;
            }

            .footer-contact a:hover {
                color: #00aaff;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <!-- Main Content Section -->
            <div class="container1">
                <!-- Blog Content -->

                <div class="blog-content">
                    <div class="comment-section" style="margin-top: 10px">
                        <h3>Cài đặt bài viết</h3>      
                        <!-- Comment List -->
                        <div class="comments-list mb-5">
                            
                        </div>
                        <!-- Post a Comment Section -->
                        
                        <form action="changestatusblog" method="get" class="comment-form">
                            <h5>Trạng thái</h5>
                            <input type="hidden" name="blogId" value="${blog.blogId}">
                        <select name="status" class="form-control form-control mb-3" style="width: 100px" required>
                            <option value="1" ${blog.status == 1 ? 'selected' : ''}>Hiện</option>
                            <option value="0" ${blog.status == 0 ? 'selected' : ''}>Ẩn</option>
                        </select>
                        <input type="submit" value="Lưu" class="btn btn-primary">
                    </form>


                </div>
                <form action="editblogbymarketing" method="post">
                    <h1>Tiêu đề: </h1>
                    <h1 class="blog-title"><textarea name="title" rows="4" class="form-control" placeholder="Nhập mô tả" required>${blog.blogTitle}</textarea></h1>
                    <div class="blog-meta"><b>Tác giả: </b>${author} | <b>Ngày: </b>${blog.blogTime} | <b>Thể loại: </b>${topic}</div>

                    <div class="blog-section">
                        <h1>Đầu bài: </h1>
                        <p><textarea name="open" rows="6" class="form-control" placeholder="Nhập mô tả" required>${blog.openBlog}</textarea></p>
                    </div>

                    <div class="blog-image-container">
                        <img src="${blog.images[0].imageUrl}" class="blog-image" alt="Blog Image">
                        <h2>Tiêu đề hình ảnh: </h2>
                        <strong class="textImage"><textarea name="imageText1" rows="2" class="form-control" placeholder="Nhập mô tả" required>${blog.images[0].imageText}</textarea></strong>
                    </div>

                    <div class="blog-section">
                        <h1>Luận điểm 1: </h1>
                        <h5 style="border: 0px;"><textarea name="main1" rows="2" class="form-control" placeholder="Nhập mô tả" required>${blog.bodyMain1}</textarea></h5>
                        <p><textarea name="sp1" rows="6" class="form-control" placeholder="Nhập mô tả" required>${blog.bodySp1}</textarea></p>
                    </div>

                    <div class="blog-image-container">
                        <img src="${blog.images[1].imageUrl}" class="blog-image" alt="Blog Image">
                        <h2>Tiêu đề hình ảnh: </h2>
                        <strong class="textImage"><textarea name="imageText2" rows="2" class="form-control" placeholder="Nhập mô tả" required>${blog.images[1].imageText}</textarea></strong>
                    </div>

                    <div class="blog-section">
                        <h1>Luận điểm 2: </h1>
                        <h5><textarea name="main2" rows="2" class="form-control" placeholder="Nhập mô tả" required>${blog.bodyMain2}</textarea></h5>
                        <p><textarea name="sp2" rows="6" class="form-control" placeholder="Nhập mô tả" required>${blog.bodySp2}</textarea></p>
                    </div>

                    <div class="blog-image-container">
                        <img src="${blog.images[2].imageUrl}" class="blog-image" alt="Blog Image">
                        <strong class="textImage"><textarea name="imageText3" rows="2" class="form-control" placeholder="Nhập mô tả" required>${blog.images[2].imageText}</textarea></strong>
                    </div>

                    <div class="blog-section">
                        <h1>Luận điểm 3: </h1>
                        <h5><textarea name="main3" rows="4" class="form-control" placeholder="Nhập mô tả" required>${blog.bodyMain3}</textarea></h5>
                        <p><textarea name="sp3" rows="6" class="form-control" placeholder="Nhập mô tả" required>${blog.bodySp3}</textarea></p>
                    </div>

                    <div class="blog-conclusion">
                        <h1>Kết luận: </h1>
                        <h5><textarea name="end" rows="6" class="form-control" placeholder="Nhập mô tả" required>${blog.endBlog}</textarea></h5>
                    </div>
                    </br>
                    <button type="submit" class="btn btn-success">Lưu bài viết</button>
                </form>
                <!-- Comment Section -->
                <div class="comment-section">
                    <h3>Bình luận và Đánh giá</h3>

                    <!-- Sorting Comments by Rating -->
                    <form action="blogdetail" method="get" class="comment-sort-form">
                        <label for="rating">Sắp xếp theo đánh giá:</label>
                        <select name="rating" class="form-control mb-3" required>
                            <option value="5" <c:if test="${rating == 5}">selected</c:if>>&#9733;&#9733;&#9733;&#9733;&#9733;</option>
                            <option value="4" <c:if test="${rating == 4}">selected</c:if>>&#9733;&#9733;&#9733;&#9733;</option>
                            <option value="3" <c:if test="${rating == 3}">selected</c:if>>&#9733;&#9733;&#9733;</option>
                            <option value="2" <c:if test="${rating == 2}">selected</c:if>>&#9733;&#9733;</option>
                            <option value="1" <c:if test="${rating == 1}">selected</c:if>>&#9733;</option>
                            </select>
                            <input type="hidden" name="blogId" value="${blog.blogId}">
                        <button type="submit" class="btn btn-primary">Sắp xếp</button>
                    </form>




                    <!-- Comment List -->
                    <div class="comments-list mb-5">
                        <c:forEach items="${comment}" var="comment">
                            <div class="comment-item">
                                <!-- Display Comment Author -->
                                <c:set var="userDisplayed" value="false" />
                                <c:forEach items="${listacc}" var="acc"> 
                                    <c:if test="${acc.userId == comment.userId && !userDisplayed}">
                                        <div class="user-info mt-3 d-flex align-items-center">
                                            <img class="avatar rounded-circle mr-3" width="40px" height="40px" src="img/${acc.avatar}" alt="${acc.firstName} ${acc.lastName}">&nbsp&nbsp 
                                            <div>
                                                <strong class="user-name">${acc.firstName} ${acc.lastName}</strong>
                                            </div>
                                        </div>
                                        <c:set var="userDisplayed" value="true" />
                                    </c:if>
                                </c:forEach>

                                <!-- Comment Info and Rating -->
                                <div class="comment-info">
                                    <small>${comment.commentDate}</small>
                                </div>
                                <div class="rating-stars">
                                    <c:forEach begin="1" end="${comment.commentRating}">
                                        &#9733;
                                    </c:forEach>
                                </div>

                                <!-- Comment Content -->
                                <p>${comment.commentInfor}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="clearfix">
                        <div class="hint-text text-muted">Showing <b>${comment.size()}</b> out of <b>${size}</b> comments</div>
                        <ul class="pagination justify-content-center">
                            <!-- Điều hướng về trang trước -->
                            <c:if test="${page > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="blogdetail?blogId=${blog.blogId}&page=${page - 1}&rating=${commentRating}">
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
                                            <a href="blogdetail?blogId=${blog.blogId}&page=${i}&rating=${commentRating}" class="page-link">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <!-- Điều hướng về trang sau -->
                            <c:if test="${page < num}">
                                <li class="page-item">
                                    <a class="page-link" href="blogdetail?blogId=${blog.blogId}&page=${page + 1}&rating=${commentRating}">
                                        <i class="fa fa-angle-double-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>

                    <!-- Post a Comment Section -->
                    <c:choose>
                        <c:when test="${sessionScope.account != null}">
                            <form action="blogdetail?blogId=${blog.blogId}" method="post" class="comment-form">
                                <textarea name="commentInfor" rows="4" class="form-control mb-3" placeholder="Nhập bình luận của bạn" required></textarea>
                                <label for="rating">Đánh giá:</label>
                                <select name="rating" class="form-control mb-3" required>
                                    <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733;</option>
                                    <option value="4">&#9733;&#9733;&#9733;&#9733;</option>
                                    <option value="3">&#9733;&#9733;&#9733;</option>
                                    <option value="2">&#9733;&#9733;</option>
                                    <option value="1">&#9733;</option>
                                </select>
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

            <!-- Sidebar -->

        </div>
        <jsp:include page="footerDemo.jsp"></jsp:include>
    </body>
</html>
