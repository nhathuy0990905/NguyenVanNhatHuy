<%@page import="model.bean.Users"%>
<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Admin</title>
	<meta name="description" content="Admin - Bán hàng">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="assets/img/logo/logo.jpg">
	<jsp:include page="../include/css.jsp"></jsp:include>
	<link rel="stylesheet" href="admin/lib/bower_components/alertifyjs/css/alertify.css">
	<link rel="stylesheet" href="admin/lib/bower_components/alertifyjs/css/themes/default.css">
</head>
<body>
	<%
		Users user = new Users();
		user = (Users) session.getAttribute("uslogin");
	%>
	<jsp:include page="../include/leftmenu.jsp"></jsp:include>

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="../include/header.jsp"></jsp:include>

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>
									<b>TRANG CÁ NHÂN</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)" class="active">Trang chủ</a></li>
									<li><a href="javascript:void(0)" class="active">Trang cá nhân</a></li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<strong>Tài khoản : <%=user.getTenTaiKhoan()%></strong>
							</div>
							<div class="card-body card-block">
								<div class="container bootstrap snippet">
									<div class="row">
										<div class="col-sm-3">
											<!--left col-->
											<div class="text-center">
												<%
													if (user.getAnhChinh() != "") {
												%>
														<img src="admin/lib/images/nhathuy.jpg"
													 		 class="avatar img-circle img-thumbnail" alt="avatar" style="width: 100%; height: 100%;">
												<%
													} else {
												%>
														<img src="admin/lib/images/nhathuy.jpg"
															 class="avatar img-circle img-thumbnail" alt="avatar" style="width: 100%; height: 100%;">
												<%
													}
												%>
												<h6 class="mt-4">Chọn ảnh đại diện khác</h6>
												<input type="file" class="text-center center-block file-upload">
											</div>

											<ul class="list-group mt-4">
												<li class="list-group-item text-muted">Hoạt động <i
													class="fa fa-dashboard fa-1x"></i></li>
												<li class="list-group-item text-right"><span
													class="float-left"><strong>Bài viết</strong></span> 125</li>
												<li class="list-group-item text-right"><span
													class="float-left"><strong>Bình luận</strong></span> 13</li>
											</ul>

										</div>
										<!--/col-3-->
										<div class="col-sm-9">
											<div class="card border-dark mb-3" >
												<div class="card-header font-weight-bold">Tên tài khoản</div>
												<div class="card-body text-dark">
													<h5 class="card-title" style="margin-left:10px;"><%=user.getTenTaiKhoan()%></h5>
												</div>
											</div>

											<div class="card border-dark mb-3">
												<div class="card-header font-weight-bold">email</div>
												<div class="card-body text-dark">
													<h5 class="card-title"><%=user.getEmail()%></h5>
												</div>
											</div>

											<div class="card border-dark mb-3">
												<div class="card-header font-weight-bold">Tên hiển thị</div>
												<div class="card-body text-dark">
													<div class="card-title" id="tenhienthi">
														<div class="row">
															<div class="col-sm-10">
																<%=user.getTenHienThi()%>
															</div>
															<div class="col-sm-2">
																<button class="float-right btn btn-outline-primary btn-sm font-weight-bold"
																		onclick="EditTenHienThi(<%=user.getId()%>,'<%=user.getTenHienThi()%>')">
																	Thay đổi
																</button>
															</div>
														</div>

													</div>
												</div>
											</div>
											<div class="card border-dark mb-3">
												<div class="card-header font-weight-bold">Thay đổi mật khẩu</div>
												<input type="hidden" value="<%=user.getId() %>" name="id">
												<div class="card-body text-dark">
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group">
																<label class="form-control-label">Nhập mật khẩu mới </label> 
																<input type="password" placeholder="Nhập mật khẩu mới" class="form-control" id="password" required>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="form-group">
																<label class="form-control-label">Nhập lại mật khẩu mới </label> 
																<input type="password" placeholder="Nhập mật lại khẩu mới" class="form-control" id="passwordagain" required>
															</div>
														</div>
														<div class="col-sm-4"></div>
														<div class="col-sm-4">
															<div class="form-group">
																<button class="form-control btn btn-outline-primary btn-sm font-weight-bold" onclick="ThayDoiMatKhau(<%=user.getId()%>)">
																	LƯU THAY ĐỔI
																</button>
															</div>
														</div>
														<div class="col-sm-4"></div>
														<div class="col-sm-2 hien"></div>
														<div class="col-sm-8 hien">
															<div class="alert alert-danger text-center" role="alert">
																Nhập mật khẩu không khớp. Vui lòng nhập lại!</div>
														</div>
														<div class="col-sm-2 hien"></div>


													</div>

												</div>
												<!--/col-9-->
											</div>
											<!-- /.row -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- .animated -->
				</div>
				<!-- .content -->
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<jsp:include page="../include/js.jsp"></jsp:include>
	<script src="admin/lib/bower_components/jquery/dist/jquery.min.js"></script>
	<script src="admin/lib/bower_components/alertifyjs/alertify.js"></script>
	<script>
		$(document).ready(function() {
			$('.hien').css("display", "none");
			var readURL = function(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						$('.avatar').attr('src', e.target.result);
					}

					reader.readAsDataURL(input.files[0]);
				}
			}

			$(".file-upload").on('change', function() {
				readURL(this);
			});
		});
	</script>

	<script>
	function EditTenHienThi(id, displayName){
		alertify.defaults.glossary.title = 'Chỉnh sửa';
		alertify.prompt("Nhập tên hiển thị mới", displayName,
		  function(evt, displayName){
			if(displayName == "") return;
			$.ajax({
		        url: 'AdminEditDisplayNameUser',
		        type: 'POST',
		        data: {
		        	id: id, displayName: displayName
		        }
		    }).done(function(ketqua) {
		    	$("#tenhienthi .col-sm-10").text(displayName);
		    	$("#tenhienthi button").attr("onclick", "EditTenHienThi(" + id + ",'" + displayName  + "')")

				alertify.success('Cập nhật tên hiển thành công');
		    });

		  },
		  function(){
		    alertify.error('Dữ liệu không thay đổi');
		  });
	}
	</script>

	<script>
	function ThayDoiMatKhau(id){
		var regex1 = RegExp(/^[A-Za-z0-9_]{3,20}$/);
		var password = $('#password').val();
		var passwordagain = $('#passwordagain').val();
		
		if(password == "" || passwordagain == ""){
			$('.hien').css("display", "")
			$('.hien .alert').text("Bạn chưa nhập đầy đủ thông tin");
			$('#password').val("");
			$('#passwordagain').val("");
		} else {
			if(regex1.test(password) && regex1.test(passwordagain)){
				if(password === passwordagain){
					$.ajax({
		 		        url: 'AdminEditPasswordUser',
		 		        type: 'POST',
		 		        data: {
		 		        	password: password, id: id
		 		        }
		 		    }).done(function(ketqua) {
		 		    	
		 				alertify.success('Mật khẩu đã được thay đổi');
		 				console.log("ok");
		 		    });
					console.log("ajax")
				} else {
					$('.hien').css("display", "")
					$('.hien .alert').text("Nhập mật khẩu không khớp. Vui lòng nhập lại");
					$('#password').val("");
					$('#passwordagain').val("");
				}
			}else {
				$('.hien').css("display", "")
				$('.hien .alert').text("Mật khẩu dài 3 - 20 ký tự và chỉ chứa các ký từ 0-9, A-Z, a-z");
				$('#password').val("");
				$('#passwordagain').val("");
			}
		}
	}
	</script>
</body>
</html>