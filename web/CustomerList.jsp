<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
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
                font-family: 'Helvetica Neue', Arial, sans-serif;
                background-color: #f7f9fc; /* Màu nền sáng hơn */
                color: #343a40; /* Màu chữ tối */
            }
            .container {
                max-width: 1200px;
                margin: 30px auto;
                background: #ffffff;
                padding: 30px; /* Tăng padding để tạo không gian */
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Làm mềm bóng */
                border-radius: 15px; /* Góc cạnh mềm mại */
            }
            h1 {
                text-align: center;
                margin-bottom: 30px;
                font-size: 2.5em;
                color: #007BFF; /* Màu xanh chủ đạo */
                font-weight: bold; /* Đậm hơn */
            }
            .table {
                margin-top: 20px;
                border-radius: 10px;
                overflow: hidden; /* Thêm để loại bỏ góc cạnh */
            }
            th {
                background-color: #007BFF; /* Màu nền cho tiêu đề bảng */
                color: white; /* Màu chữ cho tiêu đề */
                font-weight: bold;
                text-align: center; /* Canh giữa chữ */
            }
            td {
                background-color: #ffffff; /* Màu nền sáng cho ô dữ liệu */
                text-align: center; /* Canh giữa chữ */
            }
            .btn {
                border-radius: 5px; /* Đường viền tròn cho nút */
            }
            .pagination {
                display: flex;
                justify-content: center; /* Canh giữa các nút phân trang */
                margin-top: 20px; /* Khoảng cách phía trên */
            }
            .pagination a {
                padding: 10px 15px; /* Khoảng cách bên trong cho các liên kết */
                margin: 0 5px; /* Khoảng cách giữa các nút */
                border: 1px solid #007BFF; /* Đường viền cho nút */
                border-radius: 5px; /* Đường viền tròn */
                color: #007BFF; /* Màu chữ cho liên kết */
                text-decoration: none; /* Bỏ gạch chân */
                transition: background-color 0.3s, color 0.3s; /* Hiệu ứng chuyển động */
                font-weight: bold; /* Đậm chữ */
            }
            .pagination a:hover {
                background-color: #0056b3; /* Màu nền khi di chuột */
                color: white; /* Màu chữ khi di chuột */
            }
            .pagination a.active {
                background-color: #007BFF; /* Màu nền cho nút đang chọn */
                color: white; /* Màu chữ cho nút đang chọn */
                pointer-events: none; /* Vô hiệu hóa sự kiện click cho nút đang chọn */
            }
            .modal-header {
                background-color: #007BFF; /* Màu nền cho tiêu đề modal */
                color: white; /* Màu chữ cho tiêu đề modal */
                border-top-left-radius: 10px; /* Bo góc trên bên trái */
                border-top-right-radius: 10px; /* Bo góc trên bên phải */
            }
            .modal-footer .btn {
                border-radius: 5px; /* Đường viền tròn cho nút modal */
            }
            .actions a {
                margin-right: 10px;
            }
            .actions a.btn {
                background-color: #28a745; /* Màu nền cho nút hành động */
                color: white; /* Màu chữ cho nút hành động */
            }
            .actions a.btn-info {
                background-color: #17a2b8; /* Màu nền cho nút xem/sửa */
            }
            .btn-primary {
                background-color: #007BFF; /* Màu xanh chủ đạo */
                border-color: #007BFF; /* Đường viền cho nút */
            }
            .btn-success {
                background-color: #28a745; /* Màu xanh lá */
                border-color: #28a745; /* Đường viền cho nút */
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="container list">
            <a href="marketing.jsp" class="btn btn-primary" style="margin-top: 20px;">
                <span>X</span>
            </a>
            <h1>Danh Sách Khách Hàng</h1>
            <c:if test="${not empty errorMessage}">
                <div style="color:red;">${errorMessage}</div>
            </c:if>

            <!-- Form tìm kiếm -->
            <form action="searchcustomer" method="get">
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <input type="text" name="search" class="form-control" placeholder="Tìm kiếm theo Email" value="${search}">
                    </div>
                    <div class="form-group col-md-3">
                        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                    </div>
                </div>
            </form>

            <form action="customerlist" method="get">
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <select name="sort" class="form-control" onchange="this.form.submit()">
                            <option value="">-- Sắp xếp theo --</option>
                            <option value="name">Tên</option>
                            <option value="email">Email</option>
                            <option value="phone">Điện thoại</option>
                        </select>
                    </div>
                </div>
            </form>

            <div class="col-sm-6">
                <a href="#addCustomerModal" class="btn btn-success btn-sm mb-3" data-toggle="modal">Thêm Mới</a>
            </div>

            <!-- Bảng khách hàng -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Họ</th>
                        <th>Tên</th>
                        <th>Giới tính</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.customerList}" var="customer">
                        <tr>
                            <td>${customer.userId}</td>
                            <td>${customer.firstName}</td>
                            <td>${customer.lastName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${customer.gender == 0}">Nam</c:when>
                                    <c:when test="${customer.gender == 1}">Nữ</c:when>
                                    <c:otherwise>Giới tính khác</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${customer.email}</td>
                            <td>${customer.mobile}</td>
                            <td>${customer.address}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${customer.status == 0}">Inactive</c:when>
                                    <c:when test="${customer.status == 1}">Active</c:when>
                                    <c:otherwise>Unknown Status</c:otherwise>
                                </c:choose>
                            </td>
                            <th class="actions">
                                <a href="viewcustomer?userId=${customer.userId}" class="btn btn-info btn-sm">Xem/Sửa</a>
                            </th>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="pagination">
                <c:if test="${page > 1}">
                    <a href="customerlist?page=1">First</a>
                </c:if>
                <c:forEach begin="${(page - 1) <= 1 ? 1 : (page - 1)}" end="${page + 1 > totalPages ? totalPages : page + 1}" var="i">
                    <c:choose>
                        <c:when test="${i == page}">
                            <a class="active">${i}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="customerlist?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${page < totalPages}">
                    <a href="customerlist?page=${totalPages}">Last</a>
                </c:if>
            </div>
        </div>

        <!-- Modal Thêm Khách Hàng -->
        <div class="modal fade" id="addCustomerModal" tabindex="-1" role="dialog" aria-labelledby="addCustomerModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addCustomerModalLabel">Thêm Khách Hàng Mới</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="addcustomer" method="post">
                            <div class="form-group">
                                <label for="firstName">Họ</label>
                                <input type="text" class="form-control" id="firstName" name="firstName" required>
                            </div>
                            <div class="form-group">
                                <label for="lastName">Tên</label>
                                <input type="text" class="form-control" id="lastName" name="lastName" required>
                            </div>
                            <div class="form-group">
                                <label for="gender">Giới tính</label>
                                <select class="form-control" id="gender" name="gender">
                                    <option value="0">Nam</option>
                                    <option value="1">Nữ</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label for="mobile">Số điện thoại</label>
                                <input type="text" class="form-control" id="mobile" name="mobile" required>
                            </div>
                            <div class="form-group">
                                <label for="address">Địa chỉ</label>
                                <input type="text" class="form-control" id="address" name="address" required>
                            </div>
                            <div class="form-group">
                                <label for="status">Trạng thái</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="0">Inactive</option>
                                    <option value="1">Active</option>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footerDemo.jsp"></jsp:include>
    </body>
</html>
