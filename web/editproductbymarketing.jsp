
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <title>Admin</title>

        <style>
            .modal-dialog {
                display: flex;
                flex-direction: column;
                justify-content: center; /* Căn dọc */
                height: 100vh; /* Đặt chiều cao của khung là 100% chiều cao màn hình */
            }

            .modal-content {
                margin: auto;
                width: 100%;
                max-width: 600px; /* Giới hạn chiều rộng của modal */
            }

            .form-group-image image{
                display: flex;
                align-content: center;
                justify-content: space-between;
            }

            .form-group{
                margin-bottom: 3px;
            }

            .image {
                display: flex;
                flex-wrap: wrap; /* Cho phép các phần tử xuống dòng khi hết chỗ */
                list-style-type: none; /* Loại bỏ dấu chấm đầu dòng của danh sách */
                padding: 0;
                margin: 0;
            }

            .image li {
                flex: 1 0 30%; /* Chia mỗi phần tử chiếm 30% chiều rộng, đảm bảo 3 phần tử trong mỗi hàng */
                margin: 5px; /* Thêm khoảng cách giữa các phần tử */
                text-align: center;
            }


            .form-select{
                display: flex;
                align-content: center;
                justify-content: space-evenly;

            }


        </style>
    </head>
    <body>
    <div class="modal-content">
        <form id="productForm" action="addbymarketing" method="post" onsubmit="return validateForm()">
            <div class="modal-header">						
                <h4 class="modal-title">Sửa sản phẩm </h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">	
                <div class="form-group-image">
                    <input type="hidden" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Tên xe</label>
                    <input type="text" placeholder="Tên xe" name="name" class="form-control" required>
                </div>
                <div class="form-group form-group-image">
                    <label>Ảnh</label>
                    <ul class="image">
                        <c:forEach items="${requestScope.imageList}" var="imageList">
                            <li>
                                <img style="width: 200px; cursor: pointer;" src="${imageList.imageUrl}" alt="Xe" onclick="openModal('${imageList.imageUrl}')"/>
                            </li>
                        </c:forEach>
                       
                        <li>
                            <label>Enter Image URL</label>
                            <input type="text" name="imageUrl" placeholder="Nhập link ảnh" class="form-control">
                        </li>
                    </ul>
                </div>
                <div class="form-select">
                    <div class="form-group">
                        <label>Thương hiệu</label>
                        <select name="brand" required>
                            <c:forEach items="${requestScope.brandList}" var="brandList">
                                <option value="${brandList.brandId}">${brandList.brandName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Kiểu dáng</label>
                        <select name="style" required>
                            <c:forEach items="${requestScope.styleList}" var="style">
                                <option value="${style.styleId}">${style.styleName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-select">
                    <div class="form-group">
                        <label>Phân khúc</label>
                        <select name="segment" required>
                            <c:forEach items="${requestScope.segmentList}" var="segmentList">
                                <option value="${segmentList.segmentId}">${segmentList.segmentName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Nhà cung cấp</label>
                        <select name="supply" required>
                            <c:forEach items="${requestScope.supplyList}" var="supplyList">
                                <option value="${supplyList.supplyId}">${supplyList.supplyName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>Số chỗ ngồi</label>
                    <input type="number" name="seatNumber" placeholder="Số chỗ" class="form-control" required min="1" oninput="validity.valid || (value='')">
                </div>
                <div class="form-group">
                    <label>Giá</label>
                    <input type="number" name="price" placeholder="Giá" class="form-control" required min="0" oninput="validity.valid || (value='')">
                </div>
                <div class="form-group">
                    <label>Nhiên liệu</label>
                    <input type="text" name="fuel" placeholder="Nhiên liệu" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Số lượng</label>
                    <input type="number" name="stock" placeholder="Số lượng" class="form-control" required min="1" oninput="validity.valid || (value='')">
                </div>
                <div class="form-group">
                    <label>Mô tả</label>
                    <textarea name="des" rows="4" class="form-control" placeholder="Nhập mô tả" required></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <a href="proformarketing">Cancel</a>
                <input type="submit" class="btn btn-info" value="Save">
            </div>
        </form>
    </div>

    <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="imageModalLabel">Image Preview</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <img id="modalImage" src="" alt="Image" style="width: 100%; height: auto;">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openModal(imageUrl) {
            document.getElementById('modalImage').src = imageUrl;
            $('#imageModal').modal('show');
        }

        function validateForm() {
            const form = document.getElementById('productForm');
            const inputs = form.querySelectorAll('input, textarea, select');
            for (let input of inputs) {
                if (input.required && input.value.trim() === '') {
                    alert(`Vui lòng điền ${input.previousElementSibling.innerText}`);
                    return false; // Ngăn không cho gửi form
                }
                // Kiểm tra nếu là input số
                if ((input.name === 'seatNumber' || input.name === 'price' || input.name === 'stock') && (isNaN(input.value) || input.value < 0)) {
                    alert(`${input.previousElementSibling.innerText} phải là số và không được âm.`);
                    return false; // Ngăn không cho gửi form
                }
            }
            return true; // Cho phép gửi form nếu tất cả kiểm tra thành công
        }
    </script>
</body>
</html>
