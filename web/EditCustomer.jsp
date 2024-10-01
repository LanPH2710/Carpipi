<%-- 
    Document   : EditCustomer
    Created on : Sep 27, 2024, 10:27:53 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Customer</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <style>
            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8;
            }

            .form-control {
                margin-bottom: 10px;
            }

            .profile-button {
                background: rgb(99, 39, 120);
                box-shadow: none;
                border: none;
            }

            .profile-button:hover {
                background: #682773;
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none;
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none;
            }

            .back:hover {
                color: #682773;
                cursor: pointer;
            }

            .labels {
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <form action="viewcustomer" method="post" enctype="multipart/form-data">

            <div class="container rounded mt-5 mb-5">
                <a href="customerlist" class="btn btn-primary" style="margin-top: 20px;">
                    <span>X</span>
                </a>
                <div class="row">

                    <!-- Avatar and User Info -->
                    <div class="col-md-4 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="rounded-circle mt-5" width="300px" src="img/${acc.avatar}">                          
                            <span class="font-weight-bold">${acc.firstName} ${acc.lastName}</span>
                            <span class="text-black-50">${acc.email}</span>
                        </div>
                    </div>

                    <!-- Profile Form -->
                    <div class="col-md-8 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Edit Profile</h4>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">ID</label>
                                    <input name="userId" type="text" class="form-control" value="${acc.userId}" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Họ</label>
                                    <input name="firstName" type="text" class="form-control" value="${acc.firstName}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Tên</label>
                                    <input name="lastName" type="text" class="form-control" value="${acc.lastName}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Giới tính</label>
                                    <select name="gender" class="form-control" required>
                                        <option value="Nam" ${acc.gender == 'nam' ? 'selected' : ''}>Nam</option>
                                        <option value="Nữ" ${acc.gender == 'nữ' ? 'selected' : ''}>Nữ</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Số điện thoại</label>
                                    <input name="mobile" type="text" class="form-control" value="${acc.mobile}" required>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Địa chỉ</label>
                                    <input name="address" type="text" class="form-control" value="${acc.address}" required>
                                </div>
                                <!-- Role (Read-Only) -->
                                <div class="col-md-12">
                                    <label class="labels">Vai trò</label>
                                    <input name="role" type="text" class="form-control" value="${role1}" readonly>
                                </div>
                                <!-- Email (Read-Only) -->
                                <div class="col-md-12">
                                    <label class="labels">Email</label>
                                    <input name="email" type="text" class="form-control" value="${acc.email}" required>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Thay đổi ảnh đại diện</label>
                                    <input name="avatar" type="file" class="form-control" accept="image/*">
                                </div>

                            </div>
                            <!-- Save Button -->
                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" type="submit">Save Profile</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </form>
    </body>
</html>
