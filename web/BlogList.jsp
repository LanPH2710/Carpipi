<%-- 
    Document   : BlogList
    Created on : Oct 1, 2024, 3:44:28 AM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>PHPJabbers.com | Free Blog Website Template</title>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/style_blog.css">

    </head>
    <body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

        <!-- PRE LOADER -->
        <section class="preloader">
            <div class="spinner">

                <span class="spinner-rotate"></span>

            </div>
        </section>

        <jsp:include page="header.jsp"/>

        <section>
            <div class="container">
                <div class="text-center">
                    <h1>Blog posts</h1>
                </div>
            </div>
        </section>

        <section class="section-background">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 pull-right col-xs-12">
                        <div class="form">
                            <form action="#">
                                <div class="form-group">
                                    <label class="control-label">Blog Search</label>

                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search for...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Go!</button>
                                        </span>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <br>

                        <label class="control-label">Danh mục bài viết</label>

                        <ul class="list">
                            <li><a href="blogdetail">Mercedes</a></li>
                            <li><a href="blogdetail">Audi</a></li>
                            <li><a href="blogdetail">BMW</a></li>
                            <li><a href="blogdetail">Porsche</a></li>
                            <li><a href="blogdetail">Volkswagen</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-9 col-xs-12">
                        <div class="row">
                            <c:forEach var="blog" items="${blogList}">
                                <div class="col-sm-6">
                                    <div class="courses-thumb courses-thumb-secondary">
                                        <div class="courses-top">
                                            <div class="courses-image">
                                                <img src="${blog.blogImage}" class="img-responsive" alt="${blog.blogInfo1}">
                                            </div>
                                            <div class="courses-date">
                                                <span title="Brand"><i class="fa fa-user"></i>${blog.brandId}</span>
                                                <span title="Date"><i class="fa fa-calendar"></i> ${blog.blogTime}</span>
                                                <span title="Views"><i class="fa fa-eye"></i> 114</span>
                                            </div>
                                        </div>
                                        <div class="courses-detail">
                                            <h3><a href="blogdetail?blogId=${blog.blogId}">${blog.blogTitle}</a></h3>
                                        </div>
                                        <div class="courses-info">
                                            <a href="blogdetail?blogId=${blog.blogId}" class="section-btn btn btn-primary btn-block">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- FOOTER -->
        <footer id="footer">
            <div class="container">
                <div class="row">

                    <div class="col-md-4 col-sm-6">
                        <div class="footer-info">
                            <div class="section-title">
                                <h2>Headquarter</h2>
                            </div>
                            <address>
                                <p>212 Barrington Court <br>New York, ABC 10001</p>
                            </address>

                            <ul class="social-icon">
                                <li><a href="#" class="fa fa-facebook-square" attr="facebook icon"></a></li>
                                <li><a href="#" class="fa fa-twitter"></a></li>
                                <li><a href="#" class="fa fa-instagram"></a></li>
                            </ul>

                            <div class="copyright-text"> 
                                <p>Copyright &copy; 2020 Company Name</p>
                                <p>Template by: <a href="https://www.phpjabbers.com/">PHPJabbers.com</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="footer-info">
                            <div class="section-title">
                                <h2>Contact Info</h2>
                            </div>
                            <address>
                                <p>+1 333 4040 5566</p>
                                <p><a href="mailto:contact@company.com">contact@company.com</a></p>
                            </address>

                            <div class="footer_menu">
                                <h2>Quick Links</h2>
                                <ul>
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="about-us.html">About Us</a></li>
                                    <li><a href="terms.html">Terms & Conditions</a></li>
                                    <li><a href="contact.html">Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-12">
                        <div class="footer-info newsletter-form">
                            <div class="section-title">
                                <h2>Newsletter Signup</h2>
                            </div>
                            <div>
                                <div class="form-group">
                                    <form action="#" method="get">
                                        <input type="email" class="form-control" placeholder="Enter your email" name="email" id="email" required>
                                        <input type="submit" class="form-control" name="submit" id="form-submit" value="Send me">
                                    </form>
                                    <span><sup>*</sup> Please note - we do not spam your email.</span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </footer>

        <div class="modal fade bs-example-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="gridSystemModalLabel">Book Now</h4>
                    </div>

                    <div class="modal-body">
                        <form action="#" id="contact-form">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Pick-up location" required>
                                </div>

                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Return location" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Pick-up date/time" required>
                                </div>

                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Return date/time" required>
                                </div>
                            </div>
                            <input type="text" class="form-control" placeholder="Enter full name" required>

                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Enter email address" required>
                                </div>

                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Enter phone" required>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="section-btn btn btn-primary">Book Now</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- SCRIPTS -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>
