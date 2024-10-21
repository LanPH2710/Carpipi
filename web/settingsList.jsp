<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Settings List</title>
    </head>
    <body>
        <h1>Brand Settings List</h1>
        <table border="1">
            <tr>
                <th>Brand ID</th>
                <th>Name</th>
                <th>Status</th>
                <th>Product Count</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="brand" items="${brandList}">
                <tr>
                    <td>${brand.brandId}</td>
                    <td>${brand.name}</td>
                    <td>
                        <c:choose>
                            <c:when test="${brand.status == 1}">Active</c:when>
                            <c:otherwise>Inactive</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${brand.productCount}</td>
                    <td>
                        <form action="settingsList" method="post">
                            <input type="hidden" name="brandId" value="${brand.brandId}">
                            <input type="hidden" name="status" value="${brand.status == 1 ? 0 : 1}">
                            <button type="submit">
                                <c:choose>
                                    <c:when test="${brand.status == 1}">Deactivate</c:when>
                                    <c:otherwise>Activate</c:otherwise>
                                </c:choose>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <h1>Fuel Settings List</h1>
        <table border="1">
            <tr>
                <th>Fuel Type</th>
                <th>Product Count</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="entry" items="${fuelCounts}">
                <tr>
                    <td>${entry.key}</td>
                    <td>${entry.value}</td>
                    <td>
                        <c:choose>
                            <c:when test="${entry.value > 0}">Active</c:when>
                            <c:otherwise>Inactive</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <form action="settingsList" method="post">
                            <input type="hidden" name="fuel" value="${entry.key}">
                            <input type="hidden" name="status" value="${entry.value > 0 ? 0 : 1}">
                            <button type="submit" name="action" value="updateFuelStatus">
                                <c:choose>
                                    <c:when test="${entry.value > 0}">Deactivate</c:when>
                                    <c:otherwise>Activate</c:otherwise>
                                </c:choose>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
