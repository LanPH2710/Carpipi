<%-- 
    Document   : register
    Created on : Sep 17, 2024, 1:26:16 PM
    Author     : ADMIN
--%>

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
        input.form-control {
            font-family: FontAwesome;
            font-style: normal;
            font-weight: normal;
            text-decoration: inherit;
        }

        .register {
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            border: solid black;
            border-radius: 25px;
            padding: 10px;
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
    </style>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="row">
<c:if test="${not empty errorMessage}">
    <div style="color:red;">${errorMessage}</div>
</c:if>
        <div class="col-4"></div>
        <div class="col-4">
            <div class="mb-4 registerH">
                <h1 class="font-weight-bold text-center mb-4">Đăng Ký</h1>
            </div>

            <div class="register">
                <form action="register" method="post">
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="&#xf0e0;  Email" id="email" name="email"
                            required>
                    </div>
                    <table>
                        <tr>
                            <th scope="col">
                                <div class="form-group">
                                    <!-- <i class="fa fa-id-card"></i> -->
                                    <input type="text" class="form-control" placeholder="Họ và Tên Đệm" id="firstName" name="firstName"
                                        required>
                                </div>
                            </th>
                            <th scope="col">
                                <div class="form-group">
                                    <!-- <i class="fa fa-id-card"></i> -->
                                    <input type="text" class="form-control" placeholder="Tên" id="lastName" name="lastName"
                                        required>
                                </div>
                            </th>
                        </tr>
                    </table>
                    
                    

                    <div class="form-group">
                        <!-- <i class="fa fa-venus-mars"></i> -->
                        <input type="text" class="form-control" placeholder="&#xf228;  Giới Tính" id="gender" name="gender"
                            required>
                    </div>
                    <div class="form-group">
                        <!-- <i class="fa fa-phone"></i> -->
                        <input type="text" class="form-control" placeholder="&#xf095;  Số Điện Thoại" id="mobile"
                            name="mobile" required>
                    </div>
                    <div class="form-group">
                        <!-- <i class="fa fa-map-marker"></i> -->
                        <input type="text" class="form-control" placeholder="&#xf041;  Địa Chỉ" id="address"
                            name="address" required>
                    </div>
                    <div class="form-group">
                        <!-- <i class="fa fa-user"></i> -->
                        <input type="text" class="form-control" placeholder="&#xf007;  Tên Đăng Nhập" id="userName"
                            name="userName" required>
                    </div>
                    <div class="form-group">
                        <!-- <i class="fa fa-key"></i> -->
                        <input type="password" name="password" placeholder="&#xf084;  Mật Khẩu" class="form-control"
                            id="password" required>
                    </div>

                    <input style="background-color: rgb(130, 7, 7)" type="submit" value="Đăng Ký" class="btn btn-block">

                </form>
            </div>

        </div>
    </div>
    <div class="col-4"></div>
    </div>
    <jsp:include page="footerDemo.jsp"></jsp:include>
</body>

</html>
