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
                box-shadow: -5px 0 15px rgba(0, 0, 0, 0.05);
            }

            .categories {
                background-color: #f4f4f4;
                padding: 20px;
                border-radius: 10px;
            }

            .categories h3 {
                font-size: 1.5em;
                margin-bottom: 20px;
                color: #333;
            }

            .latest-post-item {
                display: flex;
                margin-bottom: 20px;
                border-bottom: 1px solid #ddd;
                padding-bottom: 15px;
            }

            .latest-post-image {
                max-width: 80px;
                height: auto;
                margin-right: 20px;
                border-radius: 8px;
            }

            .latest-post-info h4 {
                font-size: 1.1em;
                margin-bottom: 8px;
                color: #333;
                transition: color 0.3s;
            }

            .latest-post-info h4:hover {
                color: #00aaff;
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
                    <h1 class="blog-title">${blog.blogTitle}</h1>
                <div class="blog-meta">| Tác giả: ${author} | Ngày: ${blog.blogTime} |</div>

                <div class="blog-image-container">
                    <img src="${blog.images[0].imageUrl}" class="blog-image" alt="Blog Image">
                    <strong class="textImage">${blog.images[0].imageText}</strong>
                </div>

                <div class="blog-section">
                    <h5>${blog.bodyMain1}</h5>
                    <p>${blog.bodySp1}</p>
                </div>

                <div class="blog-image-container">
                    <img src="${blog.images[1].imageUrl}" class="blog-image" alt="Blog Image">
                    <strong class="textImage">${blog.images[1].imageText}</strong>
                </div>

                <div class="blog-section">
                    <h5>${blog.bodyMain2}</h5>
                    <p>${blog.bodySp2}</p>
                </div>

                <div class="blog-conclusion">
                    <h5>${blog.endBlog}</h5>
                </div>

                <!-- Comment Section -->
                <div class="comment-section">
                    <h3>Bình luận và Đánh giá</h3>

                    <!-- Sorting Comments by Rating -->
                    <form action="sortcomment" method="get" class="comment-sort-form">
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
                                        <strong>${acc.firstName} ${acc.lastName}</strong>
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
            <div class="sidebar">
                <div class="categories">
                    <h3>Bài Viết Mới Nhất</h3>
                    <c:forEach items="${requestScope.top5}" var="top5">
                        <div class="latest-post-item">
                            <c:if test="${not empty top5.images}">
                                <img src="${top5.images[0].imageUrl}" alt="Blog Image" class="latest-post-image">
                            </c:if>
                            <div class="latest-post-info">
                                <h4><a href="blogdetail?blogId=${top5.blogId}" class="text-decoration-none">${top5.blogTitle}</a></h4>
                                <p>Ngày: ${top5.blogTime}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
                            <jsp:include page="footerDemo.jsp"></jsp:include>
    </body>
</html>
