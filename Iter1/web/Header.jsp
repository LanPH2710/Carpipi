<%-- 
    Document   : header
    Created on : Sep 17, 2024, 6:16:48 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <style>
            .headerN {

                font-family: Inter, "Helvetica Neue", Helvetica, sans-serif;
                font-size: larger;
                margin: 20px;

            }

            .headerLogo {
                margin-left: 50px;
            }

            .menu {
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .navHeader {
                position: sticky;
                top: 0;
                z-index: 5;
                background: #fff;
                height: 60px;
                box-shadow: 5px 5px rgb(225, 227, 228);
            }
        </style>
    </head>
    <body>
        <div class="row navHeader">
            <div class="col-3">

                <a href="" target="_blank" style="text-decoration:none; color: black"> <img class="headerLogo"
                                                                                            src="img/logoHeader.png" alt="" style="width: 170px;"></a>

            </div>
            <div class="col-6 menu">
                <span class="headerN"><a href="" target="_blank" style="text-decoration:none; color: black">Trang
                        Chủ</a></span>
                <span class="headerN"><a href="" target="_blank" style="text-decoration:none; color: black">Về
                        Carpipi</a></span>
                <span class="headerN"><a href="" target="_blank" style="text-decoration:none; color: black">Liên
                        Hệ</a></span>
                <span class="headerN"><a href="" target="_blank" style="text-decoration:none; color: black">Đăng
                        Nhập</a></span>
            </div>
            <div class="col-3"></div>
        </div>
    </body>
</html>
