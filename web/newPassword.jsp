<%-- 
    Document   : newPassword
    Created on : Sep 26, 2024, 12:24:40 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.placeicon {
	font-family: fontawesome;
}
.resetH,
.resetF,
.resetBtn{
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
.inNew,
.resetBtn{
    margin-top: 20px;
}       
.reset{
    border: solid black;
            border-radius: 25px;
            padding: 10px;
            width: 600px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<!-- Container containing all contents -->
		<div class="container reset">
			<div class="row justify-content-center">
				<div class="col-12">
					<!-- White Container -->
					<div class="container ">
						<!-- Main Heading -->
						<div class="resetH">
							<h1>
								<strong>Đổi Mật Khẩu</strong>
							</h1>
						</div>
						<div class=" ">
							<form class="form-horizontal" action="newPassword" method="POST">
								<!-- User Name Input -->
								<div class="form-group row justify-content-center px-3 inNew">
									<div class="col-9">
										<input type="text" name="password" placeholder="&#xf084; &nbsp; Mật Khẩu Mới"
											class="form-control border-info placeicon">
									</div>
								</div>
								<!-- Password Input -->
								<div class="form-group row justify-content-center px-3 inNew">
									<div class="col-9">
										<input type="password" name="confPassword"
											placeholder="&#xf084; &nbsp; Nhập Lại Mật Khẩu Mới"
											class="form-control border-info placeicon">
									</div>
								</div>
							
								<!-- Log in Button -->
								<div class="form-group resetBtn">
									<div class="col-3">
										<input type="submit" value="Đặt Lại"
											class="btn btn-block btn-info">
									</div>
								</div>
							</form>
						</div>
						<!-- Alternative Login -->
						<div class="">
							
							<!-- Horizontal Line -->
							<div class="px-4 pt-5">
								<hr>
							</div>
							<!-- Register Now -->
							<div class="pt-2">
								<div class="resetF">
									<h5>
										Không Có Tài Khoản?<span><a href="#"
											class="text-danger"> Đăng Ký Ngay!</a></span>
									</h5>
								</div>
								<div
									class="">
									<div class="col-4">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footerDemo.jsp"></jsp:include>
</body>
</html>
