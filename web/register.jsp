<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- For logo png -->
        <link rel="shortcut icon" type="image/icon" href="img/logo3.png"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            body {
                background-color: #f8f9fb;
            }

            .full-height {
                min-height: 100vh; /* Đảm bảo body luôn có chiều cao tối thiểu bằng chiều cao viewport */
            }

            .register {
                margin: 100px 0 50px;
                justify-content: center;
                align-items: center;
                box-shadow: 0 10px 40px 0px rgba(38, 40, 64, .2);
                border-radius: 3px;
                padding: 10px;
                background-color: white;
            }

            .registerH {
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .form-group {
                margin: 10px;
            }

            .form-control {
                font-family: "Poppins", "Helvetica Neue", Helvetica, sans-serif;
                font-size: 16px;
                outline: 0!important;
                box-shadow: none;
                border: 1px solid #f8f8f8;
                background: #f8f8f8;
                color: #888f9d;
                text-transform: capitalize;
                text-transform: none; /* Prevent first letter capitalization */
            }

            .name-group {
                display: flex;
                justify-content: space-between; /* Căn giữa khoảng cách giữa hai trường */
            }

            .name-group .form-group {
                flex: 1; /* Mỗi trường chiếm 50% chiều rộng */
                margin-right: 10px; /* Khoảng cách giữa hai trường */
            }
             input.form-control {
                font-family: FontAwesome;
                font-style: normal;
                font-weight: normal;
                text-decoration: inherit;
            }
 
            .name-group .form-group:last-child {
                margin-right: 0; /* Không có khoảng cách cho trường cuối cùng */
            }

            .submit-button {
                background-color: blue;
                color: blue; /* Thay đổi màu chữ của nút đăng ký */
                width: 100%; /* Chiều rộng của nút bằng 100% */
                margin-top: 10px; /* Khoảng cách giữa nút và trường trên */
            }
        </style>
    </head>
    <body class="full-height">
        <jsp:include page="header.jsp" />

        <div class="row">
            <div class="col-4"></div>
            <div class="col-4 register">
                <div class="mb-4 registerH">
                    <h1 class="font-weight-bold text-center mb-4">Đăng Ký</h1>
                </div>

                <c:if test="${not empty errorMessage}">
                    <div style="color:red;">${errorMessage}</div>
                </c:if>
                <div class="form">
                    <form action="register" method="post">
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="&#xf0e0;  Email" id="email" name="email" required>
                        </div>
                        <div class="name-group">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Họ và Tên Đệm" id="firstName" name="firstName" required>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Tên" id="lastName" name="lastName" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="&#xf228;  Giới Tính" id="gender" name="gender" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="&#xf095;  Số Điện Thoại" id="mobile" name="mobile" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="&#xf041;  Địa Chỉ" id="address" name="address" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="&#xf007;  Tên Đăng Nhập" id="userName" name="userName" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="&#xf084;  Mật Khẩu" id="password" name="password" required>
                        </div>
                        <input type="submit" value="Đăng Ký" class="btn submit-button">
                    </form>
                </div>
            </div>
            <div class="col-4"></div>
        </div>

        <jsp:include page="footerDemo.jsp" />
    </body>
</html>
