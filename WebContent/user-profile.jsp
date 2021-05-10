<%@page import="model.bean.Users"%>
<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Trang cá nhân</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="shortcut icon" href="assets/img/logo/logo.jpg">

	<!-- Tất cả css -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" href="lib/css/nivo-slider.css" type="text/css" />
	<link rel="stylesheet" href="lib/css/preview.css" type="text/css"media="screen" />
	<link rel="stylesheet" href="assets/css/animate.css">
	<link rel="stylesheet" href="assets/css/meanmenu.min.css">
	<link rel="stylesheet" href="assets/css/bundle.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/responsive.css">
	<link rel="stylesheet" href="admin/lib/bower_components/sweetalert2/dist/sweetalert2.css">
	<style type="text/css">
		.intro{
			background-image: url('admin/lib/images/hinhnen.png');
			width: 100%;
			height: 100%;
		}
	</style>
	<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
<body>
	<!-- Thêm phần tiêu đề trang -->
	<jsp:include page="layout/header.jsp"></jsp:include>
	<!-- Xong phần tiêu đề trang -->

	<!-- Bắt đầu tiêu đề trang con -->
	<div class="intro ptb-100">
		<div class="container">
			<div class="breadcrumbs text-center">
				<h2 class="breadcrumb-title">Trang cá nhân</h2>
				<ul>
					<li><a class="active" href="Home">Trang chủ</a></li>
					<li>Thông tin cá nhân</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Xong tiêu đề trang con -->

	<%
		Users us = (Users) session.getAttribute("uslogin");
		if(us != null){
		// Giá trị session tồn tại 2 giờ
		session.setMaxInactiveInterval(2 * 60 * 60);
	%>
	<div style="margin-top: 50px;" class="container bootstrap snippet">
		<div class="row">
			<div class="col-sm-3">
				<!--left col-->
				<form method="POST" action="UserEditAvata" enctype="multipart/form-data">
					<div class="form-group">
						<div class="text-center">
							<img src="assets/img/testimonial/<%=us.getAnhChinh()%>" class="avatar img-circle img-thumbnail" alt="avatar" name="link-img">
							<h4>
								<br><%=us.getTenHienThi()%>
							</h4>
							<input id="file-up-avatar" type="file" class="text-center center-block file-upload" name="file">
							<input value="<%=us.getTenTaiKhoan()%>" name="user-name" type="hidden">
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12 text-center">
							<button class="btn btn-info" type="submit">
								<i class="fa fa-edit"></i> Thay hình đại diện
							</button>
						</div>
					</div>
				</form>

			</div>
			<!--/col-3-->
			<div class="col-sm-9">
				<div class="tab-content" style="margin-top: 60px;">
					<%
						if (session.getAttribute("SingupError") != null) {
					%>
					<div class="alert alert-danger text-center">
						<strong>Lỗi: </strong><%=session.getAttribute("SingupError")%>
					</div>
					<%
						session.removeAttribute("SingupError");
						}
					%>
					<%
						if (session.getAttribute("SussecfulEditAcc") != null) {
					%>
					<div class="alert alert-success text-center">
						<strong>Thông báo!</strong>
						<%=session.getAttribute("SussecfulEditAcc")%>
					</div>
					<%
						session.removeAttribute("SussecfulEditAcc");
						}
					%>

					<form class="form" action="HomeUserProfileServlet" method="post">
						<div class="form-group">
							<div class="col-xs-6">
								<label><h4>Tài khoản</h4></label> 
								<input type="text" class="form-control" placeholder="Tài khoản" title="Nhập vào tên tài khoản." value="<%=us.getTenTaiKhoan()%>" disabled>
							</div>
						</div>
						<input value="<%=us.getTenTaiKhoan()%>" name="user-name" hidden="">
						<input value="<%=us.getId()%>" name="id" type="hidden" >
						<div class="form-group">
							<div class="col-xs-6">
								<label for="email"><h4>Email</h4></label> 
								<input type="email" class="form-control" name="email" placeholder="Email" title="Nhập vào email." value="<%=us.getEmail()%>" disabled>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<label>
									<h4>
										<br>Tên hiển thị
									</h4>
								</label>
								<input type="text" class="form-control" name="view-name" placeholder="Tên hiển thị" title="Nhập vào tên hiển thị." value="<%=us.getTenHienThi()%>" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<br> <label><h4>Mật khẩu</h4></label> 
								<input type="password" class="form-control" name="password" placeholder="Mật khẩu" title="Nhập vào mật khẩu." value="" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12 text-center">
								<br>
								<button class="btn btn-success" type="submit">
									<i class="fa fa-edit"></i> Lưu lại
								</button>
								<button class="btn btn-lg" type="reset">
									<i class="fa fa-undo"></i> Nhập lại
								</button>
							</div>
						</div>
					</form>
				</div>
				<!--/tab-pane-->
			</div>
			<!--/tab-content-->
		</div>
		<!--/col-9-->
	</div>
	<% }
		else{
		%>
	<div class="alert alert-danger">
		<strong><center>Tài khoản đã được đăng xuất! </strong>Bạn vui lòng đăng nhập để dùng tính năng này.</center> 
	</div>
	<%} %>
	<br>
	<!--/row-->

	<jsp:include page="layout/chatbox.jsp"></jsp:include>
	<!-- Thêm chân trang -->
	<jsp:include page="layout/footer.jsp"></jsp:include>
	<!-- Xong thêm chân trang -->



	<!-- Toàn bộ js -->
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
	<script
		src="admin/lib/bower_components/sweetalert2/dist/sweetalert2.js"></script>

	<script>
		$(document).ready(function() {
			var readURL = function(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('.avatar').attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			var fileValidation = function() {
				var fileInput = document.getElementById('file-up-avatar');
				var filePath = fileInput.value;//lấy giá trị input theo id
				var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;//các tập tin cho phép
				//Kiểm tra định dạng
				if (!allowedExtensions.exec(filePath)) {
					swal({
						type : 'error',
						title : 'Rất tiết...',
						text : 'Tệp tải lên có định dạng không được hổ trợ!',
					});

					fileInput.value = '';
					return false;
				}
			}
			$(".file-upload").on('change', function() {
				fileValidation();
				readURL(this);
			});
		});
	</script>
</body>


</html>