<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>User Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                box-shadow: 0 10px 40px rgba(38, 40, 64, .2);
                background-color: white;
                border-radius: 10px;
                overflow: hidden;
            }
            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8;
            }
            .form-control {
                margin-bottom: 10px;
            }
            .profile-button {
                background: #0480be;
                border: none;
            }
            .profile-button:hover {
                background: #5e35b1;
            }
            .profile-button:focus,
            .profile-button:active {
                background: #5e35b1;
                box-shadow: none;
            }
            .back:hover {
                color: #5e35b1;
                cursor: pointer;
            }
            .labels {
                font-size: 14px;
                font-weight: bold;
                color: #0480be;
            }
            .avatar {
                border-radius: 50%;
                border: 4px solid #0480be;
                transition: transform 0.3s;
            }
            .avatar:hover {
                transform: scale(1.05);
            }
            .header-title {
                font-size: 2rem;
                color: #0480be;
                font-weight: bold;
            }
            .error-message {
                color: red;
                font-weight: bold;
            }
            .success-message {
                color: green;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <form action="userProfileAdmin?userId=${accountProfile.userId}" method="post" enctype="multipart/form-data">
            <div class="container rounded mt-5 mb-5 p-4">
                <c:if test="${not empty errorMessage}">
                    <div class="error-message">${errorMessage}</div>
                </c:if>
                <c:if test="${not empty successMessage}">
                    <div class="success-message">${successMessage}</div>
                </c:if>
                <input name="firstName" type="hidden" class="form-control" value="${accountProfile.firstName}" >
                <div class="row">
                    <!-- Avatar and User Info -->
                    <div class="col-md-4 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="avatar mt-5" width="200px" height="200px" src="img/${accountProfile.avatar}">
                            <h3 class="font-weight-bold mt-3">${accountProfile.firstName} ${accountProfile.lastName}</h3>
                            <span class="text-black-50">${accountProfile.email}</span>
                        </div>
                    </div>

                    <!-- Profile Form -->
                    <div class="col-md-8 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h4 class="header-title">Thông tin cá nhân</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">Họ</label>
                                    <input name="firstName" type="text" class="form-control" value="${param.firstName == null ? accountProfile.firstName : param.firstName}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Tên</label>
                                    <input name="lastName" type="text" class="form-control" value="${param.lastName == null ? accountProfile.lastName : param.lastName}" required>
                                </div>
                                <div class="col-md-6">
                                    <c:if test="${param.gender != null}">
                                        <label for="genderSelect" class="form-label">Giới tính</label>
                                        <select class="form-select" style="margin-left: 10px" id="genderSelect" name="gender">
                                            <option value="0" ${param.gender == 1 ? "selected" : ""}>Nam</option>
                                            <option value="1" ${param.gender == 0 ? "selected" : ""}>Nữ</option>
                                            <option value="2" ${param.gender == -1 ? "selected" : ""}>N/A</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${param.gender == null}">
                                        <label for="genderSelect" class="form-label">Giới tính</label>
                                        <select class="form-select" style="margin-left: 10px" id="genderSelect" name="gender">
                                            <option value="0" ${accountProfile.gender == 1 ? "selected" : ""}>Nam</option>
                                            <option value="1" ${accountProfile.gender == 0 ? "selected" : ""}>Nữ</option>
                                            <option value="2" ${accountProfile.gender == -1 ? "selected" : ""}>N/A</option>
                                        </select>
                                    </c:if>
                                   
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">Số điện thoại</label>
                                        <input name="mobile" type="text" class="form-control" value="${param.mobile == null ? accountProfile.mobile : param.mobile}" required>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Địa chỉ</label>
                                    <input name="address" type="text" class="form-control" value="${param.mobile == null ? accountProfile.mobile : param.mobile}" required>
                                </div>
                                <!-- Role (Read-Only) -->
                                <div class="col-md-12">
                                    <c:if test="${param.role != null}">
                                        <label for="roleSelect" class="form-label">Role</label>
                                        <select class="form-select" id="roleSelect" name="role">
                                            <option value="1" ${param.role == 1 ? "selected" : ""}>admin</option>
                                            <option value="2" ${param.role == 2 ? "selected" : ""}>marketing</option>
                                            <option value="3" ${param.role == 3 ? "selected" : ""}>saleg</option>
                                            <option value="4" ${param.role == 4 ? "selected" : ""}>customer</option>
                                            <option value="5" ${param.role == 5 ? "selected" : ""}>shipper</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${param.role == null}">
                                        <label for="roleSelect" class="form-label">Vai trò</label>
                                        <select class="form-select" id="roleSelect" name="role">
                                            <option value="1" ${accountProfile.role == 1 ? "selected" : ""}>admin</option>
                                            <option value="2" ${accountProfile.role == 2 ? "selected" : ""}>marketing</option>
                                            <option value="3" ${accountProfile.role == 3 ? "selected" : ""}>sale</option>
                                            <option value="4" ${accountProfile.role == 4 ? "selected" : ""}>customer</option>
                                            <option value="5" ${accountProfile.role == 5 ? "selected" : ""}>shipper</option>
                                        </select>
                                    </c:if>
                                </div>
                                <!-- Email (Read-Only) -->
                                <div class="col-md-12">
                                    <label class="labels">Email</label>
                                    <input name="email" type="text" class="form-control" value="${accountProfile.email}" >
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Thay đổi ảnh đại diện</label>
                                    <input name="avatar" type="file" class="form-control" accept="image/*">
                                    <small class="form-text text-muted mb-2">Chỉ cần chọn ảnh mới nếu bạn muốn thay đổi ảnh đại diện.</small>
                                </div>
                            </div>
                            <!-- Save Button -->
                            <span class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" type="submit">Lưu Thông Tin</button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <jsp:include page="footerDemo.jsp"></jsp:include>
    </body>
</html>
