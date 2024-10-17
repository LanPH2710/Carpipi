<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bootstrap Simple Data Table</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Roboto', sans-serif;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background:#e2dbdb;
                padding: 20px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 10px;
                margin: 0 0 10px;
                min-width: 100%;
            }
            .table-title h2 {
                margin: 8px 0 0;
                font-size: 22px;
            }
            .search-box {
                position: relative;
                float: right;
            }
            .search-box input {
                height: 34px;
                border-radius: 20px;
                padding-left: 35px;
                border-color: #ddd;
                box-shadow: none;
            }
            .search-box input:focus {
                border-color: #3FBAE4;
            }
            .search-box i {
                color: #a0a5b1;
                position: absolute;
                font-size: 19px;
                top: 8px;
                left: 10px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
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
            table.table td:last-child {
                width: 130px;
            }
            table.table td a {
                color: #a0a5b1;
                display: inline-block;
                margin: 0 5px;
            }
            table.table td a.view {
                color: #03A9F4;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #E34724;
            }
            table.table td i {
                font-size: 19px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 95%;
                width: 30px;
                height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 30px !important;
                text-align: center;
                padding: 0;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a {
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
                margin-top: 6px;
                font-size: 95%;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container-xl">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="container list">
                                <a href="marketing.jsp" class="btn btn-primary" style="margin-top: 20px;">
                                    <span>X</span>
                                </a>
                            </div>
                            <div class="row">
                                <div class="col-sm-8"><h2>Customer <b>List</b></h2></div>
                                <div class="col-sm-4">
                                    <form action="searchcustomer" method="get">
                                        <div class="search-box">
                                            <i class="material-icons">&#xE8B6;</i>
                                            <input type="text" name="search" class="form-control" placeholder="Search by email">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>
                                        <a class="text-decoration-none" href="customerlist?sort=userId&order=${order == 'asc' && sort == 'userId' ? 'desc' : 'asc'}">
                                        ID <i class="fa fa-sort"></i>
                                    </a>
                                    <th>
                                        <a class="text-decoration-none" href="customerlist?sort=name&order=${order == 'asc' && sort == 'name' ? 'desc' : 'asc'}">
                                        Họ và Tên <i class="fa fa-sort"></i>
                                    </a>
                                </th>
                                <th>Giới tính</th>
                                <th>
                                    <a class="text-decoration-none" href="customerlist?sort=email&order=${order == 'asc' && sort == 'email' ? 'desc' : 'asc'}">
                                        Email <i class="fa fa-sort"></i>
                                    </a>
                                </th>
                                <th>
                                    <a class="text-decoration-none" href="customerlist?sort=phone&order=${order == 'asc' && sort == 'phone' ? 'desc' : 'asc'}">
                                        Số điện thoại <i class="fa fa-sort"></i>
                                    </a>
                                </th>
                                <th>Địa chỉ</th>
                                <th>Trạng thái</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.customerList}" var="customer">
                                <tr>
                                    <td>${customer.userId}</td>
                                    <td>${customer.firstName} ${customer.lastName}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${customer.gender == 0}">Nam</c:when>
                                            <c:when test="${customer.gender == 1}">Nữ</c:when>
                                            <c:otherwise>Khác</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${customer.email}</td>
                                    <td>${customer.mobile}</td>
                                    <td>${customer.address}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${customer.status == 0}">Không hoạt động</c:when>
                                            <c:when test="${customer.status == 1}">Hoạt động</c:when>
                                            <c:otherwise>Không xác định</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>    
                                        <a href="viewcustomer?userId=${customer.userId}" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>        
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text text-muted">Showing <b>${numperpage}</b> out of <b>${size}</b> customers</div>
                        <ul class="pagination justify-content-center">
                            <!-- Điều hướng về trang trước -->
                            <c:if test="${page > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="customerlist?page=${page - 1}&sort=${sort}&order=${order}">
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
                                            <a href="customerlist?page=${i}&sort=${sort}&order=${order}" class="page-link">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <!-- Điều hướng về trang sau -->
                            <c:if test="${page < num}">
                                <li class="page-item">
                                    <a class="page-link" href="customerlist?page=${page + 1}&sort=${sort}&order=${order}">
                                        <i class="fa fa-angle-double-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>  
        </div>   
    </body>
</html>