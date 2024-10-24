<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slider List</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assetsSlider/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="assetsSlider/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assetsSlider/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assetsSlider/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assetsSlider/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assetsSlider/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <%--<jsp:include page="header.jsp"/>--%>
        <%--<jsp:include page="footerDemo.jsp"/>--%>
    </head>
    <body>
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->
        <div class="page-wrapper doctris-theme toggled">
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <div class="sidebar-brand">
                        <a href="index.html">
                            <img src="assetsSlider/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                            <img src="assetsSlider/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                        </a>
                    </div>
                    <ul class="sidebar-menu pt-3">
                        <li><a href="index.html"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                        <li><a href="customerlist"><i class="uil uil-user me-2 d-inline-block"></i>Customer List</a></li>
                        <li><a href="proformarketing"><i class="uil uil-dashboard me-2 d-inline-block"></i>Product List</a></li>
                        <li><a href="SliderList"><i class="uil uil-dashboard me-2 d-inline-block"></i>Slider List</a></li>
                        <li><a href="settingsList"><i class="uil uil-dashboard me-2 d-inline-block"></i>Setting List</a></li>
                        <li><a href="postlist"><i class="uil uil-dashboard me-2 d-inline-block"></i>Post List</a></li>
                    </ul>
                    <!-- sidebar-menu  -->
                </div>
                <!-- sidebar-content  -->
                <ul class="sidebar-footer list-unstyled mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <a href="#" class="btn btn-icon btn-pills btn-soft-primary">
                            <i class="uil uil-comment icons"></i>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- sidebar-wrapper  -->
            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="assetsSlider/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="assetsSlider/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="assetsSlider/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                            <!------------search----------------->
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form action="SliderList" role="search" method="get" id="searchform" class="searchform">
                                        <div class="search-container">
                                            <!-- Filter by status -->
                                            <span>
                                                <label for="status">Status:</label>
                                            </span>
                                            <span>
                                                <select name="status">
                                                    <option value="">All</option>
                                                    <option value="1" ${param.status == '1' ? 'selected' : ''}>Active</option>
                                                    <option value="0" ${param.status == '0' ? 'selected' : ''}>Inactive</option>
                                                </select>
                                            </span>
                                            <!-- Search by title or backlink -->
                                            <span>
                                                <input type="text" class="form-control border rounded-pill" id="s" name="search" placeholder="Search by title or backlink" value="${param.search}" />
                                            </span>
                                            <!-- Search button -->
                                            <span>
                                                <input type="submit" id="searchsubmit" value="Search">
                                            </span>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!------------------end search--------------------->
                        </div>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Patients List</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html">Doctris</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Patients</li>
                                </ul>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 180px;">Name</th>
                                                <th class="border-bottom p-3">Description</th>
                                                <th class="border-bottom p-3">Image</th>
                                                <th class="border-bottom p-3">backlink</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="slider" items="${sliders}">
                                                <tr>
                                                    <td class="p-3">${slider.sliderId}</td>
                                                    <td class="p-3">${slider.title}</td>
                                                    <td class="p-3">${slider.description}</td>
                                                    <td class="py-3">
                                                        <a href="#" class="text-dark">
                                                            <div class="d-flex align-items-center">
                                                                <img src="${slider.imageUrl}" class="avatar avatar-md-sm shadow" alt="${slider.title}" />
                                                            </div>
                                                        </a>
                                                    </td>
                                                    <td class="p-3">

                                                        <a href="${slider.backlink}">${slider.backlink}</a>

                                                    </td>
                                                    <td class="p-3">
                                                        <span class="badge bg-soft-success">
                                                            ${slider.status == 1 ? 'Active' : 'Inactive'}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <form action="SliderList" method="POST" style="display: inline;">
                                                            <input type="hidden" name="sliderId" value="${slider.sliderId}" />
                                                            <select name="status" onchange="this.form.submit()">
                                                                <option value="1" ${slider.status == 1 ? 'selected' : ''}>Show</option>
                                                                <option value="0" ${slider.status == 0 ? 'selected' : ''}>Hide</option>
                                                            </select>
                                                        </form>
                                                        <a href="editSlider?id=${slider.sliderId}">Edit</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--end row-->
                        <div class="row text-center">
                            <!-- Pagination -->
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <span class="text-muted me-3">Showing ${(currentPage - 1) * 15 + 1} - ${(currentPage - 1) * 15 + sliders.size()} out of ${totalItems}</span>
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <!-- Previous Button -->
                                        <c:if test="${currentPage > 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="${pageContext.request.contextPath}/SliderList?page=${currentPage - 1}&search=${param.search}&status=${param.status}" aria-label="Previous">Prev</a>
                                            </li>
                                        </c:if>

                                        <!-- Page Numbers -->
                                        <c:forEach begin="1" end="${totalPages}" var="page">
                                            <li class="page-item ${currentPage == page ? 'active' : ''}">
                                                <a class="page-link" href="${pageContext.request.contextPath}/SliderList?page=${page}&search=${param.search}&status=${param.status}">${page}</a>
                                            </li>
                                        </c:forEach>

                                        <!-- Next Button -->
                                        <c:if test="${sliders.size() == 15}">
                                            <li class="page-item">
                                                <a class="page-link" href="${pageContext.request.contextPath}/SliderList?page=${currentPage + 1}&search=${param.search}&status=${param.status}" aria-label="Next">Next</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
<!--                                                         PAGINATION END -->-->
                        </div><!--end row-->
                    </div>
                </div><!--end container-->
                `
                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">

                </footer><!--end footer-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- Offcanvas Start -->
        <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header p-4 border-bottom">
                <h5 id="offcanvasRightLabel" class="mb-0">
                    <img src="../assets/images/logo-dark.png" height="24" class="light-version" alt="">
                    <img src="../assets/images/logo-light.png" height="24" class="dark-version" alt="">
                </h5>
                <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
            </div>
            <div class="offcanvas-body p-4 px-md-5">
                <div class="row">
                    <div class="col-12">
                        <!-- Style switcher -->
                        <div id="style-switcher">
                            <div>
                                <ul class="text-center list-unstyled mb-0">
                                    <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="../assets/images/layouts/light-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="../assets/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="../assets/images/layouts/dark-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="../assets/images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="../assets/images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="../assets/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                                    <li class="d-grid"><a href="../landing/index.html" target="_blank" class="mt-4"><img src="../assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Landing Demos</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end Style switcher -->
                    </div><!--end col-->
                </div><!--end row-->
            </div>

            <div class="offcanvas-footer p-4 border-top text-center">
                <ul class="list-unstyled social-icon mb-0">
                    <li class="list-inline-item mb-0"><a href="https://1.envato.market/doctris-template" target="_blank" class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://dribbble.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://www.facebook.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://www.instagram.com/shreethemes/" target="_blank" class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://twitter.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="../../../index.html" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
                </ul><!--end icon-->
            </div>
        </div>
        <!-- Offcanvas End -->



        <!-- javascript -->
        <script src="assetsSlider/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assetsSlider/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assetsSlider/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assetsSlider/js/app.js"></script>

    </body>

</html>