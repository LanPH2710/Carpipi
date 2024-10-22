<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Slider List</title>
    <jsp:include page="header.jsp"/>
    <style>
        .body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: fixed; /* Đảm bảo các cột có kích thước cố định */
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc !important;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        img {
            max-width: 150px; /* Điều chỉnh kích thước ảnh lớn hơn */
            height: auto;
            display: block;
            margin: 0 auto;
        }
        form {
            margin: 10px 0;
        }
        select, input[type="text"], button {
            margin-right: 10px;
            padding: 5px;
        }
        .pagination {
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            padding: 5px 10px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 3px;
        }
        .pagination a:hover {
            background-color: #0056b3;
        }

        /* Đặt kích thước cố định cho từng cột */
        th:nth-child(1), td:nth-child(1) { width: 50px; }
        th:nth-child(2), td:nth-child(2) { width: 200px; }
        th:nth-child(3), td:nth-child(3) { width: 300px; height: 100px; /* Chiều cao cố định cho cột Description */ }
        th:nth-child(4), td:nth-child(4) { width: 150px; } /* Tăng chiều rộng cột ảnh */
        th:nth-child(5), td:nth-child(5) { width: 150px; }
        th:nth-child(6), td:nth-child(6) { width: 100px; }
        th:nth-child(7), td:nth-child(7) { width: 150px; }

        /* Làm cho ô Description có thanh cuộn khi nội dung quá dài */
        td:nth-child(3) {
            overflow: auto;
            max-height: 150px; /* Chiều cao tối đa cho Description */
        }
    </style>
</head>
<body>
            

    <div class="body">
    <h1>Slider List</h1>
    <form action="SliderList" method="get">
        <!-- Filter by status -->
        <label for="status">Status:</label>
        <select name="status">
            <option value="">All</option>
            <option value="1" ${param.status == '1' ? 'selected' : ''}>Active</option>
            <option value="0" ${param.status == '0' ? 'selected' : ''}>Inactive</option>
        </select>
        
        <!-- Search by title or backlink -->
        <input type="text" name="search" placeholder="Search by title or backlink" value="${param.search}" />
        <button type="submit">Search</button>
    </form>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Image</th>
                <th>Backlink</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="slider" items="${sliders}">
                <tr>
                    <td>${slider.sliderId}</td>
                    <td>${slider.title}</td>
                    <td>${slider.description}</td>
                    <td><img src="${slider.imageUrl}" alt="${slider.title}" /></td>
                    <td><a href="${slider.backlink}">${slider.backlink}</a></td>
                    <td>${slider.status == 1 ? 'Active' : 'Inactive'}</td>
                    <td>
                        <form action="SliderList" method="POST" style="display: inline;">
                            <input type="hidden" name="sliderId" value="${slider.sliderId}" />
                            <select name="status" onchange="this.form.submit()">
                                <option value="1" ${slider.status == 1 ? 'selected' : ''}>Show</option>
                                <option value="0" ${slider.status == 0 ? 'selected' : ''}>Hide</option>
                            </select>
                        </form>
                        <a href="editSlider?id=${slider.sliderId}">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- Pagination -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/SliderList?page=${currentPage - 1}&search=${param.search}&status=${param.status}">Previous</a>
        </c:if>
        <span>Page ${currentPage}</span>
        <c:if test="${sliders.size() == 15}">
            <a href="${pageContext.request.contextPath}/SliderList?page=${currentPage + 1}&search=${param.search}&status=${param.status}">Next</a>
        </c:if>
    </div>
        </div>
        <jsp:include page="footerDemo.jsp"></jsp:include>
</body>
</html>
