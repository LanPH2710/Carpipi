<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Marketing</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/styleoze.css">

        <style>
            .table-responsive {
                margin: 3px 100px;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 2px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 20px;
                min-height: 30px;
                color: #000;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }


            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }

            body {
                min-height: 100vh;
                background: #F0F4FF;
            }

            .sidebarr{
                margin-top: 50px;
            }

            .sidebar{
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                width: 260px;
                display: flex;
                overflow-x: hidden;
                flex-direction: column;
                background: none;
                padding: 2px 10px;
                margin-top: 140px;
                transition: all 0.4s ease;
            }

            .sidebar:hover {



            }

            .sidebar .sidebar-header {
                display: flex;
                align-items: center;
            }

            .sidebar .logo {
                width: 40px;

                border-radius: 50%;
            }

            .sidebar .sidebar-header h2 {
                color: #fff;
                font-size: 1.25rem;
                font-weight: 600;
                white-space: nowrap;
                margin-left: 23px;
            }

            .sidebar-links h4 {
                color: #161a2d;
                font-weight: 500;
                white-space: nowrap;
                margin: 10px 10px;
                position: relative;
            }

            .sidebar-links h4 span {

            }

            .sidebar:hover .sidebar-links h4 span {
                opacity: 1;
            }



            .sidebar:hover .sidebar-links .menu-separator {
                transition-delay: 0s;
                transform: scaleX(0);
            }

            .sidebar-links {
                list-style: none;
                margin-top: 10px;

                height: 80%;
                overflow-y: auto;
                scrollbar-width: none;
            }

            .sidebar-links::-webkit-scrollbar {
                display: none;
            }

            .sidebar-links li a {
                display: flex;
                align-items: center;
                gap: 0 20px;
                color: 161a2d;
                font-weight: 500;
                white-space: nowrap;
                padding: 15px 1px;

                text-decoration: none;
                transition: 0.2s ease;
            }

            .sidebar-links li a:hover {
                color: #161a2d;
                background: #fff;
                border-radius: 4px;
            }

            .user-account {
                margin-top: auto;
                padding: 12px 10px;
                margin-left: -10px;
            }

            .user-profile {
                display: flex;
                align-items: center;
                color: #161a2d;
                cursor: pointer;
            }

            .user-profile img {
                width: 40px;

                border-radius: 50%;

                border: 1px solid #fff;
            }


            .user-profile a{
                text-decoration: none;

            }

            .user-profile h3 {
                font-size: 1rem;
                font-weight: 600;
            }

            .user-profile span {
                font-size: 0.775rem;
                font-weight: 600;
            }

            .user-detail {
                margin-left: 23px;
                white-space: nowrap;
            }

            .sidebar:hover .user-account {
                background: #fff;
                border-radius: 4px;
            }
        </style>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <a href="home"><b style="background-color:  #DA0835; color: white;">Back to Home</b></a><h2>Manage <b>Products</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="addbymarketing" class="btn btn-success"><i class="material-icons"></i><span>Add New Product</span></a>
                            </div>
                            <div class="col-sm-2">
                                <form action="proformarketing" method="get"  style="margin: 2px 2px">
                                    <input type="text" placeholder="Tìm kiếm sản phẩm" name="searchse">
                                    </br>
                                    <input type="submit" value="Tìm">
                                </form>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                            <tr class="heading">
                        <form action="proformarketing" method="get">  
                                <th>
                                    ID
                                    <select name="orderId">
                                        <option value="1">
                                        <p>Bé nhất</p>
                                        </option>
                                        <option value="2">
                                        <p>Lớn nhất</p>
                                        </option>
                                    </select>
                                </th>
                                <th>
                                    Ảnh
                                    
                                </th>
                                <th>
                                    Tên xe     
                                    <select name="orderName">
                                        <option value="1">
                                        <p>Bé nhất</p>
                                        </option>
                                        <option value="2">
                                        <p>Lớn nhất</p>
                                        </option>
                                    </select>
                                </th>
                                <th>Số chỗ</th>
                                <th>
                                    Giá
                                    <select name="orderPrice">
                                        <option value="1">
                                        <p>Bé nhất</p>
                                        </option>
                                        <option value="2">
                                        <p>Lớn nhất</p>
                                        </option>
                                    </select>
                                </th>
                                <th>Thương hiệu</th>              
                                <!--                                <th>Kiểu dáng</th>-->
                                <!--                                <th>Nhà cung cấp</th>-->
                                <th>Phân khúc</th>

                                <th>Số lượng</th>
                                <th>Chi tiết</th>
                                <th><input type="submit" value="Lọc"></th>
                            </tr>
                            </form>
                        </thead>

                        <tbody>


                            <c:if test="${chooseBrand == null}">
                                <c:forEach items="${listProduct}" var="product">
                                    <tr>
                                        <td>${product.productId}</td>
                                        <td>
                                            <c:forEach items="${imageList}" var="image">
                                                <c:if test="${image.productId == product.productId}">
                                                    <img style="width: 80px" src="${image.imageUrl}" alt="Xe">
                                                </c:if>

                                            </c:forEach>
                                        </td>
                                        <td>${product.name}</td>
                                        <td>${product.seatNumber}</td>
                                        <td><fmt:formatNumber value="${product.price}" type="number" pattern="#,###"/></td>
                                        <td>
                                            <c:forEach items="${requestScope.brandList}" var="brandList">
                                                <c:if test="${brandList.brandId == product.brandId}">
                                                    ${brandList.brandName}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${requestScope.segmentList}" var="segmentList">
                                                <c:if test="${segmentList.segmentId == product.segmentId}">
                                                    ${segmentList.segmentName}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>${product.stock}</td>
                                        <td>
                                            <a href="editproductbymarketing?id=${product.productId}" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                            <c:if test="${chooseBrand != null}">
                                <c:forEach items="${productListGetBrand}" var="productBrand">
                                    <tr>
                                        <td>${productBrand.productId}</td>
                                        <td>
                                            <c:forEach items="${imageList}" var="image">
                                                <c:if test="${image.productId == productBrand.productId}">
                                                    <img style="width: 80px" src="${image.imageUrl}" alt="Xe">                                                </c:if>

                                            </c:forEach>
                                        </td>
                                        <td>${productBrand.name}</td>
                                        <td>${productBrand.seatNumber}</td>
                                        <td><fmt:formatNumber value="${productBrand.getPrice()}" type="number" pattern="#,###"/></td>
                                        <td>
                                            <c:forEach items="${requestScope.brandList}" var="brandList">
                                                <c:if test="${brandList.brandId == productBrand.brandId}">
                                                    ${brandList.brandName}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${requestScope.segmentList}" var="segmentList">
                                                <c:if test="${segmentList.segmentId == productBrand.segmentId}">
                                                    ${segmentList.segmentName}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>${productBrand.stock}</td>
                                        <td>
                                            <a href="editbymarketing?id=${productBrand.productId}" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                            <a href="delete?id=${o.id}" class="delete"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </c:if>

                        </tbody>

                    </table>
                    <div class="clearfix">

                        <ul class="pagination">

                            <li class="page-item disabled"><a href="#">Previous</a></li>
                                <c:forEach begin="1" end="${endP}" var="i">
                                <li class="${tag == i?"page-item active":"page-item"}"><a class="page-link" href="proformarketing?index=${i}&brandId=${chooseBrand}">${i}</a></li>
                                </c:forEach>

                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div> 

                </div>
            </div>        
        </div>
        <div class="sidebarr">
            <aside class="sidebar">

                <ul class="sidebar-links">

                    <a href="proformarketing">
                        <h4>
                            <span>Brand</span>
                            <div class="menu-separator"></div>
                        </h4>
                    </a>
                    <li>
                        <a href="proformarketing?brandId=ME"><span class="logo"><img class="logo" src="https://clipground.com/images/benz-logo-png-17.png" alt="profile-img"></span>Mercedes</a>
                    </li>
                    <li>
                        <a href="proformarketing?brandId=PO"><span class="logo"><img class="logo" src="https://logos-world.net/wp-content/uploads/2021/04/Porsche-Logo.png" alt="profile-img"></span>Posche</a>
                    </li>
                    <li>
                        <a href="proformarketing?brandId=AU"><span class="logo"><img class="logo" src="https://clipground.com/images/audi-logo-png-4.png" alt="profile-img"></span>Audi</a>
                    </li>
                    <li>
                        <a href="proformarketing?brandId=BM"><span class="logo"><img style="width: 35px" class="logo" src="assets/images/brand/BMW.png"></span>BMW</a>
                    </li>
                    <li>
                        <a href="proformarketing?brandId=VO"><span class="logo"><img style="width: 35px" class="logo" src="https://i.pinimg.com/736x/6f/f0/51/6ff0512fd6d6ccff695ba4bfcee36816.jpg" alt="profile-img"></span>Volkswagen</a>
                    </li>

                </ul>

            </aside>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="Post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="text" name="image" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Brand</label>
                                <select name="brand">
                                    <c:forEach var="o" items="${brand}">
                                        <option value="${o.id}">${o.name}</option>

                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category">
                                    <c:forEach var="o" items="${category}">
                                        <option value="${o.id}">${o.name}</option>

                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" name="price" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Stock</label>
                                <input type="number" name="stock" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->


    </body>
</html>
