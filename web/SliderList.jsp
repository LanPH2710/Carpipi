<%-- 
    Document   : SliderList
    Created on : Oct 19, 2024, 7:38:05 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Slider List</title>
</head>
<body>
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
    
    <table border="1">
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
                    <td><img src="${slider.imageUrl}" alt="${slider.title}" width="100" /></td>
                    <td><a href="${slider.backlink}">${slider.backlink}</a></td>
                    <td>${slider.status == 1 ? 'Active' : 'Inactive'}</td>
                    <td>
                        <form action="SliderList" method="POST">
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
    
    <!-- Phân trang -->
<!-- Phân trang -->
<form action="SliderList" method="get">
<div>
    
    <c:if test="${currentPage > 1}">
        <a href="${pageContext.request.contextPath}/SliderList?page=${currentPage - 1}&search=${param.search}&status=${param.status}">Previous</a>
    </c:if>
    <span>Page ${currentPage}</span>
    <c:if test="${sliders.size() == 15}">
        <a href="${pageContext.request.contextPath}/SliderList?page=${currentPage + 1}&search=${param.search}&status=${param.status}">Next</a>
    </c:if>
</div>
</form>


    
</body>
</html>


