<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Chi tiết sản phẩm</h2>
    <form action="editproductbymarketing" method="post">
        <input type="hidden" name="id" value="${car.productId}">
        
        <div class="form-group">
            <label>Tên xe</label>
            <input type="text" name="name" class="form-control" value="${car.name}" required>
        </div>
        
        <div class="form-group">
            <label>Số chỗ ngồi</label>
            <input type="number" name="seatNumber" class="form-control" value="${car.seatNumber}" required min="1">
        </div>
        
        <div class="form-group">
            <label>Giá</label>
            <input type="number" name="price" class="form-control" value="${car.price}" required min="0">
        </div>
        
        <div class="form-group">
            <label>Nhiên liệu</label>
            <input type="text" name="fuel" class="form-control" value="${car.fuel}" required>
        </div>
        
        <div class="form-group">
            <label>Số lượng</label>
            <input type="number" name="stock" class="form-control" value="${car.stock}" required min="1">
        </div>
        
        <div class="form-group">
            <label>Mô tả</label>
            <textarea name="des" rows="4" class="form-control" required>${car.description}</textarea>
        </div>

        <div class="form-group">
            <label>Thương hiệu</label>
            <select name="brandId" class="form-control" required>
                <c:forEach items="${brandList}" var="brand">
                    <option value="${brand.brandId}" <c:if test="${brand.brandId == car.brandId}">selected</c:if>>${brand.brandName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Nhà cung cấp</label>
            <select name="supply" class="form-control" required>
                <c:forEach items="${supplyList}" var="supply">
                    <option value="${supply.supplyId}" <c:if test="${supply.supplyId == car.supplyId}">selected</c:if>>${supply.supplyName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Phân khúc</label>
            <select name="segmentId" class="form-control" required>
                <c:forEach items="${segmentList}" var="segment">
                    <option value="${segment.segmentId}" <c:if test="${segment.segmentId == car.segmentId}">selected</c:if>>${segment.segmentName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Kiểu dáng</label>
            <select name="styleId" class="form-control" required>
                <c:forEach items="${styleList}" var="style">
                    <option value="${style.styleId}" <c:if test="${style.styleId == car.styleId}">selected</c:if>>${style.styleName}</option>
                </c:forEach>
            </select>
        </div>
        
        <h3>Hình ảnh sản phẩm</h3>
        <div class="form-group">
            <c:forEach items="${imageList}" var="image">
                <div>
                    <img src="${image.imageUrl}" alt="Image" style="width: 100px; height: auto;">
                    <input type="text" name="imageUrls" value="${image.imageUrl}" class="form-control">
                </div>
            </c:forEach>
        </div>

        <div class="modal-footer">
            <a href="proformarketing">Hủy</a>
            <input type="submit" class="btn btn-info" value="Lưu">
        </div>
    </form>
</div>
</body>
</html>
