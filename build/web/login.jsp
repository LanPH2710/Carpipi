<%-- 
    Document   : login
    Created on : Sep 22, 2024, 12:44:06 PM
    Author     : Sonvu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style_login.css">
        <title>Login</title>
    </head>
    <body>

        <div class="login-box">
            <div class="login-header">
                <header>Login</header>

            </div>
            
                <div class="login-google">
                    <section class="gg">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/Iter1_Test/login&response_type=code&client_id=425567804160-tpdr9so617et1ijjcp3oqe7d35tl6n07.apps.googleusercontent.com&approval_prompt=force"> 
                            Sign in by Google account
                        </a>


                    </section>
                </div>
            <form action="byaccount" method="post">

                <div class="input-box">
                    <input type="text" name="username" class="input-field" placeholder="User name" autocomplete="off" required>

                </div>
                <div class="input-box">
                    <input type="password" name="password" class="input-field" placeholder="Password" autocomplete="off" required>
                </div>
                <div class="input-submit">
                    <button class="submit-btn" id="submit"></button>
                    <label for="submit">Sign In</label>
                </div>
            </form>

            <div class="forgot">
                <section>
                    <input name="remember" type="checkbox" checked="checked"/>
                    <label for="check">Remember me</label>
                </section>
                <section>
                    <a href="forgotPassword">Forgot password</a>
                </section>
            </div>

            <div class="sign-up-link">
                <p>Don't have account? <a href="register">Sign Up</a></p>
            </div>
        </div>
    </body>
</html>
