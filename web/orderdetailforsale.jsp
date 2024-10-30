<%-- 
    Document   : orderdetailforsale
    Created on : Oct 23, 2024, 2:44:52 PM
    Author     : Sonvu
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shop | E-Shopper</title>

        <link href="cssProList/bootstrap.min.css" rel="stylesheet">
        <link href="cssProList/font-awesome.min.css" rel="stylesheet">
        <link href="cssProList/price-range.css" rel="stylesheet">
        <link href="cssProList/animate.css" rel="stylesheet">
        <link href="cssProList/main.css" rel="stylesheet">
        <link href="cssProList/responsive.css" rel="stylesheet">

        <style>
            .infor-customer {
                display: grid; /* Sử dụng grid để chia cột */
                grid-template-columns: repeat(2, 1fr); /* Chia thành 2 cột */
                grid-auto-rows: minmax(0, 1fr); /* Giữ chiều cao mỗi dòng bằng nhau */
                height: 200px; /* Điều chỉnh chiều cao tổng thể để cắt phần còn lại */
                overflow: hidden; /* Ẩn phần còn lại */
                width: 600px;
            }

            .infor-customer-order {
                display: grid; /* Sử dụng grid để chia cột */
                grid-template-columns: repeat(2, 1fr); /* Chia thành 2 cột */
                grid-auto-rows: minmax(0, 1fr); /* Giữ chiều cao mỗi dòng bằng nhau */
                height: 290px; /* Điều chỉnh chiều cao tổng thể để cắt phần còn lại */
                overflow: hidden; /* Ẩn phần còn lại */
                width: 500px;
            }

            .infor-customer {
                margin-bottom: 2px;
            }
            .infor-customer h5{
                margin-bottom: 3px;
            }

            .cart_menu td{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">

                            </div>
                        </div>

                    </div>
                </div>
            </div><!--/header_top-->


            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">

                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="home">Home</a></li>

                            </div>

                        </div>
                    </div>
                </div><!--/header-bottom-->
        </header><!--/header-->

        <section id="cart_items">
            <div class="container">

                <div class="shopper-informations">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="shopper-info">
                                <p>Thông tin người mua</p>

                                <ul class="infor-customer-order">

                                    <li>
                                        <h5>Họ tên</h5>
                                        <p>${accountOrder.firstName} ${accountOrder.lastName}</p>
                                    </li>
                                    <li>
                                        <h5>Emai</h5>
                                        <p>${accountOrder.email}</p>
                                    </li>
                                    <li>
                                        <h5>Số điện thoại</h5>
                                        <p>${accountOrder.mobile}</p>
                                    </li>
                                    <li>
                                        <h5>Ngày đặt hàng</h5>
                                        <p>${orderDetail.createDate}</p>
                                    </li>
                                    <li>
                                        <h5>Tổng chi phí</h5>
                                        <p><fmt:formatNumber value="${product.price}" type="number" pattern="#,###"/></p>
                                    </li>
                                    <li>
                                        <h5>Tên nhân viên sale</h5>
                                        <p>${saleInfo.firstName} ${saleInfo.lastName}</p>
                                    </li>
                                    <li>
                                        <h5>Trạng thái</h5>
                                        <% //   ${status.statusId == orderDetail.orderStatus ? 'selected' : ''}" %>

                                        
                                        <form action="orderdetailforsale" method="get" style="display: inline;">
                                            <select class="form-select" name="statusId" onchange="this.form.submit()">
                                                <c:forEach var="status" items="${requestScope.listStatusOrder}">
                                                    <option value="${status.statusId}">${status.statusName}</option>

                                                </c:forEach>
                                                <option value="0">aa</option>
                                            </select>
                                            <input type="hidden" name="orderId" value="${orderDetail.orderId}">


                                            <!-- Vòng lặp thêm input ẩn cho từng styleId đã chọn -->


                                        </form>

                                    </li>

                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="review-payment">
                    <h2>Thông tin sản phẩm</h2>
                </div>

                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Sản phẩm</td>
                                <td class="Mô tả"></td>
                                <td class="price"></td>
                                <td class="price" style="width: 150px;">Giá</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                        <trcart_menu>
                            <td class="cart_product">
                                <a href=""><img style="width: 100px"  src="${image.imageUrl}" alt=""></a>
                            </td>
                            <td class="cart_description">
                                <h4><a href="">${product.name}</a></h4>
                                <p>ID: ${product.productId}</p>
                            </td>

                            <td class="cart_price">

                            </td>
                            <td class="cart_price">
                                <p><fmt:formatNumber value="${product.price}" type="number" pattern="#,###"/></p>
                            </td>
                            <td class="cart_price">
                                <p>1</p>
                            </td>
                            <td class="cart_total">
                                <p class="cart_total_price"><fmt:formatNumber value="${product.price}" type="number" pattern="#,###"/></p>
                            </td>

                        </trcart_menu>
                        <tr>
                            <td colspan="4">&nbsp;</td>
                            <td colspan="2">
                                <table class="table table-condensed total-result">

                                    <tr class="shipping-cost">
                                        <td>Giá vận chuyển</td>
                                        <td>Miễn phí</td>										
                                    </tr>
                                    <tr>
                                        <td>Tổng</td>
                                        <td><span><fmt:formatNumber value="${product.price}" type="number" pattern="#,###"/></span></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="shopper-informations">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="shopper-info">
                                <p>Thông tin người nhận</p>

                                <ul class="infor-customer">
                                    <li>
                                        <h5>Họ tên</h5>
                                        <p>${accountOrder.firstName} ${accountOrder.lastName}</p>
                                    </li>
                                    <li>
                                        <h5>Emai</h5>
                                        <p>${accountOrder.email}</p>
                                    </li>
                                    <li>
                                        <h5>Số điện thoại</h5>
                                        <p>${accountOrder.mobile}</p>
                                    </li>
                                    <li>
                                        <h5>Địa chỉ người nhận</h5>
                                        <p>${orderDetail.shippingAddress}</p>
                                    </li>
                                </ul>

                            </div>
                        </div>

                    </div>
                </div>


                <!--                <div>
                                    <form action="proformarketing" method="get" style="display: inline;">
                
                                        <select name="choosesale" onchange="this.form.submit()">
                
                <c:forEach var="all" items="${sessionScope.allSaleName}">
                    <option value="${all.userId}">${all.firsName} ${all.lastName}</option>
                </c:forEach>
                
                
            </select>


        </form>
    </div>-->
            </div>
        </section> <!--/#cart_items-->





        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
