<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Settings List</title>
    <jsp:include page="header.jsp"/>
    <style>
        .body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1, h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        
        tr:hover {
            background-color: #f1f1f1;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"], select {
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .success {
            color: green;
            margin-bottom: 20px;
        }
        .error {
            color: red;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="body">
    <h1>Settings List</h1>

    <!-- Buttons to switch views -->
    <form action="settingsList" method="get">
        <button type="submit" name="view" value="brand">Thương hiệu</button>
        <button type="submit" name="view" value="fuel">Nhiên liệu</button>
        <button type="submit" name="view" value="style">Style</button>
        <button type="submit" name="view" value="segment">Segment</button>
        <button type="submit" name="view" value="supply">Supply</button>
    </form>

    <c:choose>
        <c:when test="${param.view == 'fuel'}">
            <h2>Danh sách Nhiên liệu</h2>
            <form action="settingsList" method="get">
                <input type="text" name="searchFuel" placeholder="Tìm Nhiên liệu...">
                <select name="statusFilter">
                    <option value="">Chọn trạng thái</option>
                    <option value="1" ${param.statusFilter == '1' ? 'selected' : ''}>Kích hoạt</option>
                    <option value="0" ${param.statusFilter == '0' ? 'selected' : ''}>Ngừng kích hoạt</option>
                </select>
                <button type="submit">Tìm</button>
            </form>
            <table>
                <tr>
                    <th>Tên Nhiên liệu</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
                <c:forEach var="entry" items="${fuelCounts.entrySet()}">
                    <tr>
                        <td>${entry.key}</td>
                        <td>
                            <c:choose>
                                <c:when test="${entry.value == 1}">Active</c:when>
                                <c:otherwise>Inactive</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <form action="settingsList" method="post">
                                <input type="hidden" name="fuel" value="${entry.key}">
                                <input type="hidden" name="status" value="${entry.value == 1 ? 0 : 1}">
                                <button type="submit" name="action" value="updateFuelStatus">
                                    <c:choose>
                                        <c:when test="${entry.value == 1}">Deactivate</c:when>
                                        <c:otherwise>Activate</c:otherwise>
                                    </c:choose>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${not empty errorMessage}">
                <div class="error">${errorMessage}</div>
            </c:if>
            <c:if test="${not empty message}">
                <div class="success">${message}</div>
            </c:if>
        </c:when>

        <c:when test="${param.view == 'brand'}">
            <h2>Danh sách Thương hiệu</h2>
            <form action="settingsList" method="get">
                <input type="text" name="searchBrand" placeholder="Tìm Thương hiệu...">
                <select name="statusFilter">
                    <option value="">Chọn trạng thái</option>
                    <option value="1" ${param.statusFilter == '1' ? 'selected' : ''}>Kích hoạt</option>
                    <option value="0" ${param.statusFilter == '0' ? 'selected' : ''}>Ngừng kích hoạt</option>
                </select>
                <button type="submit">Tìm</button>
            </form>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Số lượng sản phẩm</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
                <c:forEach var="brand" items="${brandList}">
                    <tr>
                        <td>${brand.brandId}</td>
                        <td>${brand.name}</td>
                        <td>${brand.productCount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${brand.status == 1}">Kích hoạt</c:when>
                                <c:otherwise>Ngừng kích hoạt</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <form action="settingsList" method="post">
                                <input type="hidden" name="brandId" value="${brand.brandId}">
                                <input type="hidden" name="status" value="${brand.status == 1 ? 0 : 1}">
                                <button type="submit">${brand.status == 1 ? 'Ngừng kích hoạt' : 'Kích hoạt'}</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>

        <c:when test="${param.view == 'style'}">
            <h2>Danh sách Style</h2>
            <form action="settingsList" method="get">
                <input type="text" name="searchStyle" placeholder="Tìm Style...">
                <select name="statusFilter">
                    <option value="">Chọn trạng thái</option>
                    <option value="1" ${param.statusFilter == '1' ? 'selected' : ''}>Kích hoạt</option>
                    <option value="0" ${param.statusFilter == '0' ? 'selected' : ''}>Ngừng kích hoạt</option>
                </select>
                <button type="submit">Tìm</button>
            </form>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Số lượng sản phẩm</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
                <c:forEach var="style" items="${styleList}">
                    <tr>
                        <td>${style.styleId}</td>
                        <td>${style.styleName}</td>
                        <td>${style.styleProductCount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${style.status == 1}">Kích hoạt</c:when>
                                <c:otherwise>Ngừng kích hoạt</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <form action="settingsList" method="post">
                                <input type="hidden" name="styleId" value="${style.styleId}">
                                <input type="hidden" name="status" value="${style.status == 1 ? 0 : 1}">
                                <button type="submit" name="action" value="updateStyleStatus">${style.status == 1 ? 'Ngừng kích hoạt' : 'Kích hoạt'}</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>

        <c:when test="${param.view == 'segment'}">
            <h2>Danh sách Segment</h2>
            <form action="settingsList" method="get">
                <input type="text" name="searchSegment" placeholder="Tìm Segment...">
                <select name="statusFilter">
                    <option value="">Chọn trạng thái</option>
                    <option value="1" ${param.statusFilter == '1' ? 'selected' : ''}>Kích hoạt</option>
                    <option value="0" ${param.statusFilter == '0' ? 'selected' : ''}>Ngừng kích hoạt</option>
                </select>
                <button type="submit">Tìm</button>
            </form>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Số lượng sản phẩm</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
                <c:forEach var="segment" items="${segmentList}">
                    <tr>
                        <td>${segment.segmentId}</td>
                        <td>${segment.segmentName}</td>
                        <td>${segment.segmentProductCount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${segment.status == 1}">Kích hoạt</c:when>
                                <c:otherwise>Ngừng kích hoạt</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <form action="settingsList" method="post">
                                <input type="hidden" name="segmentId" value="${segment.segmentId}">
                                <input type="hidden" name="status" value="${segment.status == 1 ? 0 : 1}">
                                <button type="submit" name="action" value="updateSegmentStatus">${segment.status == 1 ? 'Ngừng kích hoạt' : 'Kích hoạt'}</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>

        <c:when test="${param.view == 'supply'}">
            <h2>Danh sách Supply</h2>
            <form action="settingsList" method="get">
                <input type="text" name="searchSupply" placeholder="Tìm Supply...">
                <select name="statusFilter">
                    <option value="">Chọn trạng thái</option>
                    <option value="1" ${param.statusFilter == '1' ? 'selected' : ''}>Kích hoạt</option>
                    <option value="0" ${param.statusFilter == '0' ? 'selected' : ''}>Ngừng kích hoạt</option>
                </select>
                <button type="submit">Tìm</button>
            </form>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Số lượng sản phẩm</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
                <c:forEach var="supply" items="${supplyList}">
                    <tr>
                        <td>${supply.supplyId}</td>
                        <td>${supply.supplyName}</td>
                        <td>${supply.supplyProductCount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${supply.status == 1}">Kích hoạt</c:when>
                                <c:otherwise>Ngừng kích hoạt</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <form action="settingsList" method="post">
                                <input type="hidden" name="supplyId" value="${supply.supplyId}">
                                <input type="hidden" name="status" value="${supply.status == 1 ? 0 : 1}">
                                <button type="submit" name="action" value="updateSupplyStatus">${supply.status == 1 ? 'Ngừng kích hoạt' : 'Kích hoạt'}</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>
    </c:choose>
    </div>
</body>
</html>
