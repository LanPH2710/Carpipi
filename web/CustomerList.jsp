<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css" />
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }
            .list{
                margin: 0;
                padding: 20px;
            }



            .container {
                max-width: 1200px;
                margin: 30px 0px 50px 0px;
                background: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .actions a {
                margin-right: 10px;
            }
            .pagination {
                margin-top: 20px;
                text-align: center;
            }

            .pagination a {
                display: inline-block;
                padding: 8px 16px;
                text-decoration: none;
                color: #000;
                background-color: #f2f2f2;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin: 0 4px;
            }

            .pagination a.active {
                background-color: #4CAF50;
                color: white;
                border: 1px solid #4CAF50;
            }

            .pagination a:hover:not(.active) {
                background-color: #ddd;
            </style>
        </head>
        <body>
            <jsp:include page="header.jsp"></jsp:include>
                <div class="container list">
                    <a href="home" class="btn btn-primary" style="margin-top: 20px;">
                        <span>X</span>
                    </a>
                    <h1>Customer List</h1>
                <c:if test="${not empty errorMessage}">
                    <div style="color:red;">${errorMessage}</div>
                </c:if>
                <!-- Search Form -->
                <form action="searchcustomer" method="get">
                    <div class="form-row">
                        <div class="form-group col-md-5">
                            <input type="text" name="search" class="form-control" placeholder="Search by Email" value="${search}">
                        </div> 
                        <div class="form-group col-md-3">
                            <button type="submit" class="btn btn-primary">Sreach</button>
                        </div>
                    </div>
                </form>

                <form action="customerlist" method="get">
                    <div class="form-row">
                        <div class="form-group col-md-5">
                            <select name="sort" class="form-control" onchange="this.form.submit()">
                                <option value="">-- Sort By --</option>
                                <option value="name">Name </option>
                                <option value="email">Email</option>
                                <option value="phone">Phone</option>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="col-sm-6">
                    <a href="#addCustomerModal" class="btn btn-success btn-sm mb-3" data-toggle="modal">Add New</a>
                </div>
                <!-- Customer Table -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Họ</th>
                            <th>Tên</th>
                            <th>Giới tính</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.customerList}" var="customer">
                            <tr>
                                <td>${customer.userId}</td>
                                <td>${customer.firstName}</td>
                                <td>${customer.lastName}</td>
                                <td>${customer.gender}</td>
                                <td>${customer.email}</td>
                                <td>${customer.mobile}</td>
                                <td>${customer.address}</td>
                                <th class="actions">
                                    <a href="viewcustomer?userId=${customer.userId}" class="btn btn-info btn-sm">Xem/Sửa</a>
                                </th>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="pagination">
                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                        <c:choose>
                            <c:when test="${i == page}">
                                <a href="customerlist?page=${i}" class="active">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="customerlist?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>

                <div id="addCustomerModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <c:if test="${not empty errorMessage}">
                                <div style="color:red;">${errorMessage}</div>
                            </c:if>
                            <form action="addcustomer" method="get">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Add Customer</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>Tên đăng ký</label>
                                        <input name="userName" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Mật khẩu</label>
                                        <input name="password" type="password" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Họ</label>
                                        <input name="firstName" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên</label>
                                        <input name="lastName" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Giới tính</label>
                                        <select name="gender" aria-label="Select your gender">
                                            <option value="Nam">Nam</option>
                                            <option value="Nữ">Nữ</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input name="email" type="email" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Số điện thoại</label>
                                        <input name="mobile" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Địa chỉ</label>
                                        <textarea name="address" class="form-control" required></textarea>
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
            </div>
            <jsp:include page="footerDemo.jsp"></jsp:include>
        </body>
    </html>
