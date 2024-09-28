<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- meta data -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <style>
            * {
                box-sizing: border-box;
            }
            .headerN {
                text-transform: uppercase;
                font-weight: 500;

                font-family: "Poppins", "Helvetica Neue", Helvetica, sans-serif;
                font-size: 16px;
                margin: 20px;

            }

            .headerLogo {
                margin-left: 50px;
            }

            .menu,
            .logo
            {
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .navHeader {
                z-index: 5;
                position: sticky;
                top: 0;
                padding-left: 0;
                padding-right: 0;
                background-color: black;
                height: 78px;
                box-shadow: 5px 5px rgb(225, 227, 228);
            }

        </style>
    </head>
    <body>
        <div class="row navHeader container-fluid">
            <div class="col-3 logo">

                <a href="home" style="text-decoration:none; color: black"> <img class="headerLogo"
                                                                                src="img/logoWhite.png" alt="" style="height: 78px;"></a>
            </div>
            <div class="col-1"></div>
            <div class="col-8 menu">
                <span class="headerN"><a href="home" style="text-decoration:none; color: white">Xe tiêu biểu</a></span>
                <span class="headerN"><a href="HomePage.jsp" style="text-decoration:none; color: white">Mẫu mới</a></span>
                <span class="headerN"><a href="HomePage.jsp" style="text-decoration:none; color: white">Hãng</a></span>
                <span class="headerN"><a href="HomePage.jsp" style="text-decoration:none; color: white">Tin xe</a></span>
                <span class="headerN"><a href="HomePage.jsp" style="text-decoration:none; color: white">Liên lạc</a></span>
                
                        <c:if test="${sessionScope.account == null}">
                            <!-- Hiển thị nút "Đăng Nhập" khi chưa đăng nhập -->
                            <span class="headerN"><a style="text-decoration:none; color: white" href="login.jsp">Đăng Nhập</a></span>
                            </c:if>

                        <!-- Kiểm tra nếu người dùng đã đăng nhập -->
                        <c:if test="${sessionScope.account != null}">
                            <!-- Đặt "Welcome" trong thẻ <li> giống như nút "Đăng Nhập" -->

                            <span class="headerN"><a style="text-decoration:none; color: white" href="userprofile">Profile</a></span>
                            <span class="headerN"><a style="text-decoration:none; color: white" href="logout">Đăng xuất</a></span>
                            </c:if>
                    </a>
                </span>

            </div>

        </div>


    </body>
</html>
