<%-- 
    Document   : enterOTP
    Created on : Sep 25, 2024, 11:55:15 PM
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

        <style type="text/css">
            .form-gap {
                padding-top: 70px;
            }
            .form-group{
                margin: 10px;
            }
            .full-height {
                height: 100vh; /* Chiều cao bằng 100% chiều cao của viewport */

            }
            .otp{
                margin:100px 0px 100px 0px ;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="form-gap"></div>
            <div class="container full-height">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4"></div>
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="text-center otp">
                                    <h3>
                                        <i class="fa fa-lock fa-4x"></i>
                                    </h3>
                                    <h2 class="text-center">Nhập OTP</h2>
                                <% if(request.getAttribute("message") != null) { 
        out.print("<p class='text-danger ml-1'>" + request.getAttribute("message") + "</p>");
    } %>


                                <div class="panel-body">

                                    <form id="register-form" action="valiOtpServlet" role="form" autocomplete="off"
                                          class="form" method="post">

                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-envelope color-blue"></i></span>
                                                <input id="opt" name="otp" placeholder="Nhập OTP" class="form-control"
                                                       type="text" required="required">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input name="recover-submit" class="btn btn-lg btn-primary btn-block"
                                                   value="Đổi Mật Khẩu" type="submit">
                                        </div>

                                        <input type="hidden" class="hide" name="token" id="token" value="">
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-md-offset-4"></div>

            </div>
        </div>
        <jsp:include page="footerDemo.jsp"></jsp:include>

    </body>
</html>
