<%-- 
    Document   : login
    Created on : Sep 22, 2024, 12:44:06 PM
    Author     : Sonvu
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- For logo png -->
        <link rel="shortcut icon" type="image/icon" href="img/logo3.png"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style_login.css">
        <title>Login</title>
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <div class="body">

            <div class="login-box">

                <div class="login-header">
                    <header>Đăng nhập</header>

                </div>

                <div class="login-google">
                    <section class="gg">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/Iter1_Test/login&response_type=code&client_id=425567804160-tpdr9so617et1ijjcp3oqe7d35tl6n07.apps.googleusercontent.com&approval_prompt=force"> 
                            Đăng nhập bằng tài khoản Google
                        </a>


                    </section>
                </div>
                <form action="byaccount" method="post">
                    <p style="color: red;">${mess}</p>
                    <div class="input-box">
                        <input type="text" value="${userName}" name="username" class="input-field" placeholder="Tên đăng nhập" autocomplete="off" required>

                    </div>
                    <div class="input-box">
                        <input type="password" value="${passWord}" name="password" class="input-field" placeholder="Mật khẩu" autocomplete="off" required>
                    </div>
                    <div class="input-submit">
                        <button class="submit-btn" id="submit"></button>
                        <label for="submit">Đăng nhập</label>
                    </div>
                    <div class="forgot">
                        <section>
                            <input name="remember" type="checkbox" checked="checked"/>
                            <label for="check">Nhớ mật khẩu</label>
                        </section>
                        <section>
                            <a href="forgotPassword.jsp">Bạn quên mật khẩu ?</a>
                        </section>
                    </div>

                    <div class="sign-up-link">
                        <p>Bạn chưa có tài khoản ?<a href="register">    Tạo tài khoản</a></p>
                    </div>

                </form>

            </div>

        </div>
        <jsp:include page="footerDemo.jsp"></jsp:include>
    </body>
</html>
