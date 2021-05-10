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
	<link rel="stylesheet" href="admin/lib/bower_components/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
</head>
<body>

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
									<b>TRANG CHỦ</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li>
										<a href="javascript:void(0)" class="active">Trang chủ</a>
									</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="animated fadeIn">
				<!-- Widgets  -->
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="card text-white bg-warning">
							<div class="card-body">
								<div class="card-left pt-1 float-left">
									<h3 class="mb-0 fw-r">
										<span class="currency float-left mr-1"></span> 
										<span class="count"><%=request.getAttribute("countDatHang")%></span>
									</h3>
									<p class="text-light mt-1 m-0">
										<a href="#" style="color: white">Đặt hàng</a>
									</p>
								</div>
								<!-- /.card-left -->

								<div class="card-right float-right text-right">
									<i class="icon fade-5 icon-lg pe-7s-cart"></i>
								</div>
								<!-- /.card-right -->

							</div>

						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card text-white bg-flat-color-3">
							<div class="card-body">
								<div class="card-left pt-1 float-left">
									<h3 class="mb-0 fw-r">
										<span class="currency float-left mr-1"></span> 
										<span class="count"><%=request.getAttribute("countDangShip")%></span>
									</h3>
									<p class="text-light mt-1 m-0">Đang ship</p>
								</div>
								<!-- /.card-left -->

								<div class="card-right float-right text-right">
									<i class="icon fade-5 icon-lg pe-7s-cart"></i>
								</div>
								<!-- /.card-right -->

							</div>

						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card text-white bg-flat-color-6">
							<div class="card-body">
								<div class="card-left pt-1 float-left">
									<h3 class="mb-0 fw-r">
										<span class="count"><%=request.getAttribute("sumProduct")%></span>
									</h3>
									<p class="text-light mt-1 m-0">Tổng sản phẩm</p>
								</div>
								<!-- /.card-left -->

								<div class="card-right float-right text-right">
									<i class="icon fade-5 icon-lg pe-7s-browser"></i>
								</div>
								<!-- /.card-right -->

							</div>

						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card text-white bg-flat-color-2">
							<div class="card-body">
								<div class="card-left pt-1 float-left">
									<h3 class="mb-0 fw-r">
										<span class="count"><%=request.getAttribute("sumUser")%></span>
									</h3>
									<p class="text-light mt-1 m-0">Tổng User</p>
								</div>
								<!-- /.card-left -->

								<div class="card-right float-right text-right">
									<i class="icon fade-5 icon-lg pe-7s-users"></i>
								</div>
								<!-- /.card-right -->

							</div>

						</div>
					</div>
				</div>
				<!-- /Widgets -->

				<!-- Thanh toan -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<h4 class="box-title">Thu nhập 30 ngày gần nhất</h4>
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										<canvas id="myChart"></canvas>
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- /# column -->
				</div>
				<!-- /Thanh toan -->
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->
		<form>
			<input type="hidden" value="<%=request.getAttribute("valueNgay")%>" id="valueNgay"> 
			<input type="hidden" value="<%=request.getAttribute("valueTongTien")%>" id="valueTongTien">
		</form>
		<div class="clearfix"></div>
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<jsp:include page="../include/js.jsp"></jsp:include>
	<script src="admin/lib/bower_components/jquery/dist/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>

	<script type="text/javascript">
		$(document).ready(function($) {
			var valueNgay = $('#valueNgay').val();
			valueNgay = valueNgay.replace(/'/g, '"');
			valueNgay = JSON.parse(valueNgay);
			var valueTongTien = $('#valueTongTien').val();
			valueTongTien = JSON.parse(valueTongTien);
			
			var canvas = document.getElementById('myChart');
			canvas.height = 110;
			var data = {
				labels : valueNgay,
				datasets : [ {
					label : "Tổng tiền",
					backgroundColor : "rgba(255,99,132,0.2)",
					borderColor : "rgba(255,99,132,1)",
					borderWidth : 2,
					hoverBackgroundColor : "rgba(255,99,132,0.4)",
					hoverBorderColor : "rgba(255,99,132,1)",
					data : valueTongTien
				} ]
			};
			var option = {
				scales : {
					yAxes : [ {
						stacked : true,
						gridLines : {
							display : true,
							color : "rgba(255,99,132,0.2)"
						}
					} ],
					xAxes : [ {
						gridLines : {
							display : false
						}
					} ]
				}
			};

			var myBarChart = new Chart(canvas, {
				type : 'bar',
				data : data,
				options : option
			});
		});
	</script>
</body>
</html>