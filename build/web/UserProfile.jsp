<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <style>
            body {
                background-color: #682773;
            }

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
        <jsp:include page="header.jsp"></jsp:include>

            <form action="userprofile" method="post">
                <div class="container rounded mt-5 mb-5">
                    <div class="row">
                        <!-- Avatar and User Info -->
                        <div class="col-md-4 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                <img class="rounded-circle mt-5" width="150px" src="https://cellphones.com.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg">
                                <span class="font-weight-bold">${user1.firstName} ${user1.lastName}</span>
                            <span class="text-black-50">${user1.email}</span>
                        </div>
                    </div>

                    <!-- Profile Form -->
                    <div class="col-md-8 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Edit Profile</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">First Name</label>
                                    <input name="firstName" type="text" class="form-control" value="${user1.firstName}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Last Name</label>
                                    <input name="lastName" type="text" class="form-control" value="${user1.lastName}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Gender</label>
                                    <input name="gender" type="text" class="form-control" value="${user1.gender}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Phone Number</label>
                                    <input name="mobile" type="text" class="form-control" value="${user1.mobile}" required>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Address</label>
                                    <input name="address" type="text" class="form-control" value="${user1.address}" required>
                                </div>
                                <!-- Role (Read-Only) -->
                                <div class="col-md-12">
                                    <label class="labels">Role</label>
                                    <input name="role" type="text" class="form-control" value="${role}" readonly>
                                </div>
                                <!-- Email (Read-Only) -->
                                <div class="col-md-12">
                                    <label class="labels">Email</label>
                                    <input name="email" type="text" class="form-control" value="${user1.email}" readonly>
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
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
