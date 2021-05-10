<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Đăng nhập</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="shortcut icon" href="assets/img/logo/logo.jpg">

	<!-- Toàn bộ css -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" href="lib/css/nivo-slider.css" type="text/css" />
	<link rel="stylesheet" href="lib/css/preview.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="assets/css/animate.css">
	<link rel="stylesheet" href="assets/css/meanmenu.min.css">
	<link rel="stylesheet" href="assets/css/bundle.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/responsive.css">
	<style type="text/css">
		.intro{
			background-image: url('admin/lib/images/hinhnen.png');
			width: 100%;
			height: 100%;
		}
	</style>
	<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>

	<!-- Thêm phần tiêu đề trang -->
	<jsp:include page="layout/header.jsp"></jsp:include>
	<!-- Xong phần tiêu đề trang -->


	<!-- Bắt đầu tiêu đề trang con -->
	<div class="intro ptb-100">
		<div class="container">
			<div class="breadcrumbs text-center">
				<h2 class="breadcrumb-title">Đăng nhập hệ thống</h2>
				<ul>
					<li><a class="active" href="/index.jsp">Trang chủ</a></li>
					<li>Đăng nhập</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Xong tiêu đề trang con-->
	<!-- Bắt đầu phần đăng nhập -->
	<div class="login-area ptb-100">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="login-content">
						<div class="login-title">
							<%
								if (session.getAttribute("SingupSuccess") != null) {
							%>
							<div class="alert alert-success">
								<%=session.getAttribute("SingupSuccess")%>
							</div>
							<%
								session.removeAttribute("SingupSuccess");
								}
							%>
							<h4>Đăng nhập</h4>
							<img src="assets/img/logo/logo.jpg" width="60%">
						</div>
						<div class="login-form">
							<form action="UsersLoginServlet" method="post">
								<input name="user-name" placeholder="Tên tài khoản hoặc email" type="text" required> 
								<input name="user-password" placeholder="Mật khẩu" type="password" required>
								<%
									if (session.getAttribute("errorlogin") != null) {
								%>
								<div class="alert alert-danger">
									<center><%=session.getAttribute("errorlogin")%></center>
								</div>
								<%
									session.removeAttribute("errorlogin");
									}
								%>
								<input name="link-back" hidden value="<%=request.getHeader("referer")%>">
								<div class="button-remember">
									<button class="login-btn" type="submit">Đăng nhập</button>
								</div>
								<div class="new-account">
									<p>
										<i class="pe-7s-add-user"></i> 
										<a href="register.jsp">Tạo mới một tài khoản.</a><br> 
											<i class="pe-7s-add-user"></i> 
											<a onclick="QuenMatKhau()">Quên mật khẩu?</a>
									</p>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Xong phần đăng nhập -->

	<jsp:include page="layout/chatbox.jsp"></jsp:include>
	<!-- Thêm chân trang -->
	<jsp:include page="layout/footer.jsp"></jsp:include>
	<!-- Xong thêm chân trang -->

	
	<!-- Toàn bộ js -->
	<script>
		function QuenMatKhau() {
			Swal.fire(
				'Nhat Huy Bakery chưa hỗ trợ chức năng này!',
				'',
				'error'
			)
		}
		
	</script>
	<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.meanmenu.js"></script>
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/isotope.pkgd.min.js"></script>
	<script src="assets/js/imagesloaded.pkgd.min.js"></script>
	<script src="assets/js/jquery.validate.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="lib/js/jquery.nivo.slider.js"></script>
	<script src="lib/home.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
	
	<!-- https://github.com/sweetalert2/sweetalert2 -->
	<!-- https://www.youtube.com/watch?v=1uqjQ7IovcQ -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
	
	
</body>
</html>