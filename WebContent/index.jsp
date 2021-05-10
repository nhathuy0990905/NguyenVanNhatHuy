<%@page import="model.bean.Category"%>
<%@page import="model.bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.Writer"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page pageEncoding="utf-8"%>
<%@ page import="java.text.DecimalFormat"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Nhat Huy Bakery</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- icon cho trang -->
	<link rel="shortcut icon" href="assets/img/logo/logo.jpg">
	<!-- Toàn bộ link css -->
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
	<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<%
		ArrayList<Products> products = (ArrayList<Products>) request.getAttribute("lstProducts");
		ArrayList<Products> productstop8 = (ArrayList<Products>) request.getAttribute("lstProductstop8");
		ArrayList<Category> category = (ArrayList<Category>) request.getAttribute("lstCategory");
	%>
	<!-- Thêm phần tiêu đề trang -->
	<jsp:include page="layout/header.jsp"></jsp:include>
	<!-- Xong phần tiêu đề trang -->

	<!-- Bắt đầu slide -->
	<div class="slider-area">
		<div class="bend niceties preview-2" style="width: 100%;height: 810px">

			<div id="ensign-nivoslider" class="slides" style="width: 100%;height: 810px">
				<img src="assets/img/slider/slide3.jpg" alt=""title="#slider-direction-1" /> 
				<img src="assets/img/slider/slide4.jpg" alt=""title="#slider-direction-2" />
			</div>
			<!-- Hình ảnh 1 -->
			<div id="slider-direction-1" class="t-cn slider-direction">
				<div class="container">
					<div class="slider-content t-lfl s-tb slider-1">
						<div class="title-container s-tb-c title-compress">
							<h1 class="title1" style="color : white">NHAT HUY BAKERY</h1>
							<h2 class="title2" style="color : white">Thiên đường bánh ngọt !</h2>
							<h3 class="title3" style="color : white">
								Đến với Nhat Huy Bakery, thỏa sức chọn lựa những loại bánh <br>hot
								nhất với giá rẻ bất ngờ và khuyến mãi cực tốt
							</h3>
							<a class="btn btn-success" style="border-radius: 20%" href="HomeProductsServlet?id_product=0">
								Mua ngay <i class="fa fa-shopping-cart"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Hình ảnh 2 -->
			<div id="slider-direction-2" class="slider-direction">
				<div class="container">
					<div class="slider-content t-lfl s-tb slider-1">
						<div class="title-container s-tb-c title-compress">
							<h1 class="title1">mở cửa mọi ngày</h1>
							<h2 class="title2">6h đến 23h</h2>
							<h3 class="title3">
								Không gian đẹp, phù hợp cho mọi lứa tuổi <br> đặt biệt các
								bạn trẻ có sở thích chụp hình.
							</h3>
							<a class="btn btn-success" style="border-radius: 20%" href="HomeProductsServlet?id_product=0">
								Mua ngay <i class="fa fa-shopping-cart"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Xong slider -->
	
	<!-- Bắt đầu sản phẩm nỗi bật -->
	<div class="container">
		<div class="section-title text-center mb-50">
			<h2>
				Sản phẩm nổi bật<i class="fa fa-shopping-cart"></i>
			</h2>
		</div>
		<div class="shop-menu portfolio-left-menu text-center mb-50">
			<button class="active" data-filter="*">Mọi thứ</button>
			<%
				for (Category ls : category) {
			%>
				<button data-filter=".mix<%=ls.getId()%>">
					<%=ls.getTenLoaiSanPham()%>
				</button>
			<%
				}
			%>

		</div>
		<div class="row portfolio-style-2">
			<!-- Hiển thị sản phẩm -->
			<div class="grid">
				<!--(Bánh ngọt)1  -->
				<%
					int max = 33;
					int numb = products.size();
					DecimalFormat numformat = new DecimalFormat("#,###,###");
					if (numb < max) {
						for (Products ls : productstop8) {
				%>
				<div
					class="col-md-3 col-sm-6 col-xs-12 grid-item mix<%=ls.getId_loaiSanPham()%> mb-50">
					<div class="single-shop">
						<div class="shop-img">
							<a href="javascript:void(0)">
							<img src="assets/img/shop/product/<%=ls.getAnhChinh()%>" alt="" width="345px" height="345px" /></a>
							<%
								if (ls.getTinhTrang() == 1) {
									if (ls.getKhuyenMai() > 0) {
							%>
									<div class="price-up-down">
										<span class="sale-new">
											Giảm <%=ls.getKhuyenMai()%>%
										</span>
									</div>
							<%
									}
								} else {
							%>
									<div class="price-up-down">
										<span class="sale-new">Hot </span>
									</div>
							<%
								}
							%>

							<div class="button-group">
								<a href="HomeCartServlet?status=add&id_product=<%=ls.getId()%>" title="Add to Cart"> 
									<i class="pe-7s-cart"></i>
								</a> 
								<a class="wishlist" href="#" title="Wishlist"> 
									<i onclick="ThaTim()" class="pe-7s-like"></i>
								</a> 
								<a href="#" data-toggle="modal" data-target="#quick-view<%=ls.getId()%>" title="Quick View">
									<i class="pe-7s-look"></i>
								</a>
							</div>
						</div>
						<div class="shop-text-all">
							<div class="title-color fix">
								<div class="shop-title f-left">
									<h3>
										<a href="#" data-toggle="modal" data-target="#quick-view<%=ls.getId()%>"> <%=ls.getTenSanPham()%></a>
									</h3>
								</div>
								<div class="price f-right">
									<%
										double price = ls.getGiaGoc();
										int sale = ls.getKhuyenMai();
										price = price - (price * sale / 100);
										String price_nb = numformat.format(price);
									%>
									<span class="new"> <%=price_nb%>đ </span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
						}
					} else {
						for (int i = 0; i < max; i++) {
				%>
				<div class="col-md-3 col-sm-6 col-xs-12 grid-item mix<%=products.get(i).getId_loaiSanPham()%> mb-50">
					<div class="single-shop">
						<div class="shop-img">
							<a href="javascript:void(0)">
								<img src="assets/img/shop/product/<%=products.get(i).getAnhChinh()%>" alt="" width="345px" height="345px" /></a>
							<%
								if (products.get(i).getTinhTrang() == 1) {
									if (products.get(i).getKhuyenMai() > 0) {
							%>
										<div class="price-up-down">
											<span class="sale-new">Giảm <%=products.get(i).getKhuyenMai()%>% </span>
										</div>
							<%
									}
								} else {
							%>
									<div class="price-up-down">
										<span class="sale-new">Hết bán </span>
									</div>
							<%
								}
							%>
							<div class="button-group">
								<a href="HomeCartServlet?status=add&id_product=<%=products.get(i).getId()%>" title="Add to Cart"> 
									<i class="pe-7s-cart"></i>
								</a> 
								<a class="wishlist" href="#" title="Wishlist"> 
									<i onclick="ThaTim()" class="pe-7s-like"></i>
								</a> 
								<a href="#" data-toggle="modal" data-target="#quick-view" title="Quick View"> 
									<i class="pe-7s-look"></i>
								</a>
							</div>
						</div>
						<div class="shop-text-all">
							<div class="title-color fix">
								<div class="shop-title f-left">
									<h3>
										<a href="#" data-toggle="modal" data-target="#quick-view<%=products.get(i).getId()%>"> 
											<%=products.get(i).getTenSanPham()%>
										</a>
									</h3>
								</div>
								<div class="price f-right">
									<%
										double price = products.get(i).getGiaGoc();
										int sale = products.get(i).getKhuyenMai();
										price = price - (price * sale / 100);
										String price_nb = numformat.format(price);
									%>
									<span class="new"> <%=price_nb%> đ </span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
					}
					}
				%>
			</div>
			<!-- Xong hiển thị sản phẩm -->
		</div>
		<div class="text-center">
			<a class="hvr-shutter-out-horizontal" href="HomeProductsServlet?id_product=0">
				Xem thêm <i class="fa fa-angle-double-right"></i>
			</a>
		</div>
	</div>
	</div>
	<!-- Xong sản phẩm nổi bật -->
	<!-- Bắt đầu khu vực khuyến mãi -->

	<!-- Xong khu vực khuyến mãi -->
	<!-- Bắt đầu sản phẩm mới -->
	<div class="container">
		<div class="section-title text-center mb-50">
			<h2>
				Sản phẩm mới <i class="fa fa-shopping-cart"></i>
			</h2>
		</div>
		<div class="row">
			<%
				int index = -1;
				for (Products ls : products) {
					index++;
					if (index == 0) {
			%>
			<div class="special-slider-active owl-carousel">
				<div class="single-special-slider">
					<div class="col-lg-12 col-md-12 col-xs-12">
						<div class="single-shop">
							<div class="shop-img">
								<a href="javascript:void(0)">
									<img src="assets/img/shop/product/<%=ls.getAnhChinh()%>" alt="" width="345px" height="345px"/>
								</a>
								<div class="price-up-down">
									<span class="sale-new">Mới</span>
								</div>
								<div class="button-group">
									<a href="HomeCartServlet?status=add&id_product=<%=ls.getId()%>" title="Add to Cart"> 
										<i class="pe-7s-cart"></i>
									</a> 
									<a class="wishlist" href="#" title="Wishlist"> 
										<i onclick="ThaTim()" class="pe-7s-like"></i>
									</a> 
									<a href="#" data-toggle="modal" data-target="#quick-view<%=ls.getId()%>" title="Quick View">
										<i class="pe-7s-look"></i>
									</a>
								</div>
							</div>
							<div class="shop-text-all">
								<div class="title-color fix">
									<div class="shop-title f-left">
										<h3>
											<a href="#" data-toggle="modal" data-target="#quick-view<%=ls.getId()%>">
												<%=ls.getTenSanPham()%>
											</a>
										</h3>
									</div>
									<div class="price f-right">
										<%
											double price = ls.getGiaGoc();
											int sale = ls.getKhuyenMai();
											price = price - (price * sale / 100);
											String price_nb = numformat.format(price);
										%>
										<span class="new"> <%=price_nb%>đ </span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
					} else {
				%>

				<div class="single-special-slider">
					<div class="col-lg-12 col-md-12 col-xs-12">
						<div class="single-shop">
							<div class="shop-img">
								<a href="javascript:void(0)">
									<img src="assets/img/shop/product/<%=ls.getAnhChinh()%>" alt="" width="345px" height="345px" />
								</a>
								<div class="price-up-down">
									<span class="sale-new">Mới</span>
								</div>
								<div class="button-group">
									<a href="HomeCartServlet?status=add&id_product=<%=ls.getId()%>" title="Add to Cart"> 
										<i class="pe-7s-cart"></i>
									</a> 
									<a class="wishlist" href="#" title="Wishlist"> 
										<i onclick="ThaTim()" class="pe-7s-like"></i>
									</a> 
									<a href="#" data-toggle="modal" data-target="#quick-view<%=ls.getId()%>" title="Quick View">
										<i class="pe-7s-look"></i>
									</a>
								</div>
							</div>
							<div class="shop-text-all">
								<div class="title-color fix">
									<div class="shop-title f-left">
										<h3>
											<a href="#" data-toggle="modal" data-target="#quick-view<%=ls.getId()%>"> 
												<%=ls.getTenSanPham()%>
											</a>
										</h3>
									</div>
									<div class="price f-right">
										<%
											double price = ls.getGiaGoc();
											int sale = ls.getKhuyenMai();
											price = price - (price * sale / 100);
											String price_nb = numformat.format(price);
										%>
										<span class="new"> <%=price_nb%>đ </span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
					}
					}
				%>
			</div>
		</div>
	</div>
	</div>
	<!-- Xong sản phẩm mới -->
	<!-- Bắt đầu dịch vụ - giao hàng  -->
	
	<jsp:include page="layout/chatbox.jsp"></jsp:include>
	<!-- Xong dịch vụ - giao hàng -->
	<!-- Bắt đầu phần bài viết -->

	<!-- Xong phần bài viết -->

	<!-- Thêm chân trang -->
	<jsp:include page="layout/footer.jsp"></jsp:include>
	<!-- Xong thêm chân trang -->

	<!-- Thêm xem chi tiết sản phẩm -->
	<jsp:include page="layout/detail_product.jsp"></jsp:include>
	<!-- Xong xem chi tiết sản phẩm  -->


	<!-- Toàn bộ js -->
	<script type="text/javascript">
	function ThaTim() {
		Swal.fire({
			'Bạn đã thả tim sản phẩm này',
		      '',
		      'error'
		})
	}
	</script>
	<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.meanmenu.js"></script>
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/isotope.pkgd.min.js"></script>
	<script src="assets/js/imagesloaded.pkgd.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/jquery.validate.min.js"></script>
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