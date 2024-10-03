
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            
            .form-group-image{
                
            }
        </style>
    </head>
    <body>
        <div class="modal-content">
            <form action="edit" method="post">
                <div class="modal-header">						
                    <h4 class="modal-title">Add Product</h4>
                </div>
                <div class="modal-body">	
                     <div class="form-group-image">
                         <input type=button value="${car.productId}"  class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" value="${car.name}" placeholder="Tên xe" name="name" class="form-control" required>
                        
                    </div>
                    <div class="form-group form-group-image">
                        <label>Image</label>
                        <input type="text" name="image" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Brand</label>
                        <select name="brand">
                            <c:forEach items="${requestScope.brandList}" var="brandList">
                                <option>${brandList.brandName}</option>

                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Segment</label>
                        <select name="category">
                            <c:forEach items="${requestScope.segmentList}" var="segmentList">
                                <option${segmentList.segmentName}</option>
                                </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input type="text" value="${o.price}" name="price" placeholder="Giá" class="form-control" required>
                    </div>
                    <div class="form-group">
                        
                        <input type="number"value="${o.stock}" name="stock" placeholder="Số lượng" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input name="description" value="${o.description}" placeholder="Mô tả" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="proformarketing">Cancel</a>
                    <input type="submit" class="btn btn-info" value="Save">
                </div>
            </form>
        </div>
    </body>
</html>
