<%-- 
    Document   : newPassword
    Created on : Sep 26, 2024, 12:24:40 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- For logo png -->
        <link rel="shortcut icon" type="image/icon" href="img/logo3.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            
            .placeicon {
                font-family: fontawesome;
            }

            /* Form alignment and styling */
            .reset-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh; /* Full viewport height */
                background-color: #f8f9fa;
            }

            .reset {
                padding: 30px;
                background-color: white;
                box-shadow: 0 10px 40px 0px rgba(38, 40, 64, .2);
                border-radius: 3px;
                width: 100%;
                max-width: 500px; /* Giới hạn chiều rộng tối đa của form */
            }

            .form-group {
                margin: 20px 0;
            }

            .resetBtn {
                text-align: center;
            }

            h1 {
                text-align: center;
            }

            .text-danger {
                color: red;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <!-- Reset Password Form Container -->
        <div class="container-fluid reset-container">
            <div class="reset">
                <!-- Main Heading -->
                <h1><strong>Đổi Mật Khẩu</strong></h1>

                <!-- Form -->
                <form class="form-horizontal" action="newPassword" method="POST">
                    <!-- New Password Input -->
                    <div class="form-group">
                        <input type="password" name="password" placeholder="&#xf084; &nbsp; Mật Khẩu Mới"
                               class="form-control border-info placeicon" required>
                    </div>
                    <!-- Confirm Password Input -->
                    <div class="form-group">
                        <input type="password" name="confPassword" placeholder="&#xf084; &nbsp; Nhập Lại Mật Khẩu Mới"
                               class="form-control border-info placeicon" required>
                    </div>
                    <!-- Submit Button -->
                    <div class="form-group resetBtn">
                        <input type="submit" value="Đặt Lại" class="btn btn-info btn-block">
                    </div>
                </form>

                <!-- Divider -->
                <hr>

                <!-- Alternative Option -->
                <div class="text-center">
                    <h5>
                        Không Có Tài Khoản? <a href="register" class="text-danger">Đăng Ký Ngay!</a>
                    </h5>
                </div>
            </div>
        </div>

        <jsp:include page="footerDemo.jsp"></jsp:include>
    </body>
</html>
