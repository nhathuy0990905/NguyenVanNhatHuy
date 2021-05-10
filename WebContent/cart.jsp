<%@page import="java.util.Map"%>
<%@page import="model.bean.Items"%>
<%@page import="model.dao.CartDAO"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.text.DecimalFormat"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Danh sách đặt hàng</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- icon hiển thị -->
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
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/meanmenu.min.css">
	<link rel="stylesheet" href="assets/css/bundle.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/responsive.css">
	<link rel="stylesheet" href="assets/css/introdure.css">
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
				<h2 class="breadcrumb-title">Danh sách đặt hàng</h2>
				<ul>
					<li><a class="active" href="Home">Trang chủ</a></li>
					<li>Đặt hàng</li>
				</ul>
			</div>
		</div>
	
	<!-- Xong tiêu đề trang con -->

	<!-- shopping-cart-area start -->
	<div class="cart-area ptb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<form action="#">
						<div class="table-content table-responsive">
							<table>
								<thead>
									<tr>
										<th class="product-price">Hình ảnh</th>
										<th class="product-name">Tên sản phẩm</th>
										<th class="product-price">Giá</th>
										<th class="product-quantity">Số lượng</th>
										<th class="product-subtotal">Thành tiền</th>
										<th class="product-name">Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<%
										CartDAO cart = (CartDAO) session.getAttribute("cart");
										if (cart.countItems() > 0) {
											for (Map.Entry<Long, Items> list : cart.getCartItems().entrySet()) {
									%>
									<tr>
										<td class="product-thumbnail">
											<a href="#">
												<img src="assets/img/shop/product/<%=list.getValue().getProducts().getAnhChinh()%>" alt="">
											</a>
										</td>
										<td class="product-name">
											<a href="#"><%=list.getValue().getProducts().getTenSanPham()%></a>
										</td>
										<%
											//xử lý giá bán
													DecimalFormat numformat = new DecimalFormat("#,###,###");
													double cost = list.getValue().getProducts().getGiaGoc();
													int discount = list.getValue().getProducts().getKhuyenMai();
													double total = cost - (cost * discount) / 100;
													double sum_price = total * (int) list.getValue().getQuantity();
													String price_nb = numformat.format(total);
													String sum_price_nb = numformat.format(sum_price);
										%>
										<td class="product-price">
											<span class="amount"><%=price_nb%> đ</span>
										</td>
										<td class="product-quantity">
											<input value="<%=list.getValue().getQuantity()%>" type="number" min="1" maxlength="4" id="quantity<%=list.getKey()%>" onkeypress="return keyPhone(event);">
										</td>
										<td class="product-subtotal"><%=sum_price_nb%> đ</td>
										<td class="product-remove">
											<a onclick="calleditcart(<%=list.getKey() %>);" title="Thay đổi số lượng">
												<i class="fa fa-refresh"></i>
											</a>
											<a href="HomeCartServlet?status=remove&id_product=<%=list.getKey()%>" title="Xóa bỏ mặt hàng">
												<i class="fa fa-times"></i>
											</a>
										</td>
									</tr>
									<%
											}
										} else {
									%>
									<tr>
										<div class="alert alert-info">
											<center>
												<strong>Giỏ hàng trống!</strong>
											</center>
										</div>
									</tr>
									<%
										}
									%>
									<!-- in ra thông báo đặt hàng thành công -->
									<% if(session.getAttribute("paid")!=null){ %>
									<tr>
										<div class="alert alert-success">
											<center>
												<%out.print(session.getAttribute("paid")); %>
												<!-- <strong>Đặt hàng thành công, mời bạn click vào <a href="HomeProductsServlet"><span style="color:blue">đây</span></a> để tiếp tục mua sắm!</strong> -->
											</center>
										</div>
									</tr><%session.removeAttribute("paid"); %>
									<!-- /in ra thông báo đặt hàng thành công -->
									<%}//session.removeAttribute("paid");x%>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
			<div class="row mt-50">
				<div class="col-md-7 col-sm-12 col-xs-12"></div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="cart-total">
						<ul>
							<li style="color: red">Số lượng<span><%=cart.countItems()%></span></li>
							<li class="cart-black" style="color: red">Tổng tiền<span><%=cart.totalCart()%> VND</span></li>
						</ul>
						<div class="cart-total-btn">
							<%
								if (cart.countItems() > 0) {
							%>
							<div class="cart-total-btn2 f-right">
								<a href="checkout.jsp">Tiến hành thanh toán</a>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- shopping-cart-area end -->
	<jsp:include page="layout/chatbox.jsp"></jsp:include>
	<!-- Thêm chân trang -->
	<jsp:include page="layout/footer.jsp"></jsp:include>
	<!-- Xong thêm chân trang -->

	<!-- Toàn bộ js -->
	<script>
		function calleditcart(id) {
			var quantity = document.getElementById("quantity"+id).value;
			window.location.href = "HomeCartServlet?status=edit&id_product="+id+"&quantity="+quantity+" ";
		}
		
		function keyPhone(e) {
			var keyword = null;
			if (window.event) {
				keyword = window.event.keyCode;
			} else {
				keyword = e.which;  
			}

			if (keyword<48 || keyword>57) {
				if (keyword == 8 || keyword == 48 || keyword == 127) { 
					return true;
				}
				return false;
			}
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
</body>

</html>
