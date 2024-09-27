<%-- 
    Document   : footer
    Created on : Sep 17, 2024, 6:16:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--font-family-->

        <style>
            .contact {
                background: #2a2d54;
            }
            .footInfo,
            .footInfoH{
                color: white;
                font-size: 16px;
                    list-style-type: none;
                    text-decoration:none;
                    padding-left: 10px;
                    padding-right: 10px;
                    padding-top: 15px;

            }
            .footH2{
                text-transform: uppercase;
                color: white;
                height: 80px;
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
                
            }
        </style>
    </head>
    <body>


        <!--contact start-->
        <footer id="contact"  class="contact">
            <div class="container">
                <div class="footer-top">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="single-footer-widget">
                                <div class="footer-logo">
                                    <a href="index.html" target="_blank" style="text-decoration:none; color: black"> <img class="headerLogo"
                                                                                                                          src="img/logoWnoBG.png" alt="" style="height: 80px;"></a>
                                </div>
                                <p class="footInfo" style="color: white; font-size: 16px">
                                    Công ty chúng tôi chuyên phân phối các hãng xe của Đức.
                                </p>
                                <div class="footer-contact">
                                    <ul>
                                        <a href="mailto:carpipi@gmail.com" target="_blank" style="text-decoration:none; color: white; font-size: 16px">
                                            <i class="fa fa-envelope"></i>
                                            carpipi@gmail.com
                                        </a>
                                    </ul>
                                    <ul style="color: white; font-size: 16px">
                                        <i class="fa fa-phone"></i>
                                        0987654321
                                    </ul>




                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="single-footer-widget" style="color: white; font-size: 16px">
                                <h2 class="footH2" style=" font-size: 20px; height: 80px">về carpipi</h2>
                                <ul class="footInfoH">
                                    <li><a class="footInfo" href="#">về chúng tôi</a></li>
                                    <li><a class="footInfo" href="#">sự nghiệp</a></li>
                                    <li><a class="footInfo" href="#">điều khoản dịch vụ</a></li>
                                    <li><a class="footInfo" href="#">chính sách bảo mật </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-xs-12">
                            <div class="single-footer-widget">
                                <h2 class="footH2" style=" font-size: 20px; height: 80px">thương hiệu hàng đầu</h2>
                                <div class="row">
                                    <div class="col-md-7 col-xs-6">
                                        <ul class="footInfoH">
                                            <li><a class="footInfo" href="#">BMW</a></li>
                                            <li><a class="footInfo" href="#">Audi</a></li>
                                            <li><a class="footInfo" href="#">Mercedes</a></li>

                                        </ul>
                                    </div>
                                    <div class="col-md-5 col-xs-6">
                                        <ul class="footInfoH">
                                            <li><a class="footInfo" href="#">Wolkswagen</a></li>
                                            <li><a class="footInfo" href="#">Porsche</a></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-offset-1 col-md-3 col-sm-6">
                            <div class="single-footer-widget">
                                <h2 class="footH2" style=" font-size: 20px; height: 80px">THÔNG TIN MỚI</h2>
                                <div class="footer-newsletter">
                                    <p class="footInfo" style="color:white">
                                        Đăng ký thông tin và ưu đãi mới nhất của chúng tôi 
                                    </p>
                                </div>
                                <div class="hm-foot-email">
                                    <div class="foot-email-box">
                                        <input type="text" class="form-control" placeholder="Nhập Email">
                                    </div><!--/.foot-email-box-->
                                    <div class="foot-email-subscribe">
                                        <span><i class="fa fa-arrow-right"></i></span>
                                    </div><!--/.foot-email-icon-->
                                </div><!--/.hm-foot-email-->
                            </div>
                        </div>
                    </div>
                </div>
<!--                <div class="footer-copyright">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>
                                &copy; copyright.designed and developed by <a href="https://www.themesine.com/">themesine</a>.
                            </p>/p
                        </div>
                        <div class="col-sm-6">
                            <div class="footer-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>	
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>	
                            </div>
                        </div>
                    </div>
                </div>/.footer-copyright-->
            </div><!--/.container-->

            <div id="scroll-Top">
                <div class="return-to-top">
                    <i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
                </div>

            </div><!--/.scroll-Top-->

        </footer><!--/.contact-->
    </body>
</html>
