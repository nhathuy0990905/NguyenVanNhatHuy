<%@page import="model.bo.ProductsBO"%>
<%@page import="model.bean.Products"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="utf-8"%>
<%@ page import="java.text.DecimalFormat"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Sản phẩm</title>
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
				<h2 class="breadcrumb-title">SẢN PHẨM TẠI NHAT HUY BAKERY</h2>
				<ul>
					<li><a class="active" href="index.jsp">Trang chủ</a></li>
					<li>Sản phẩm</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Xong tiêu đề trang con -->
	<!-- Bắt đầu nội dung trang danh sách sản phẩm -->
	<div class="shop-page-area ptb-100">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="blog-sidebar">
						<div class="single-sidebar">
							<h3 class="sidebar-title">Loại sản phẩm</h3>
							<div class="sidebar-list">
								<ul>
									<%
										ArrayList<Category> category =(ArrayList<Category>)request.getAttribute("lstCategory");
										for (Category ls : category) {
									%>
											<li>
												
												<a href="HomeProductsServlet?id_category=<%=ls.getId()%>">
													<%=ls.getTenLoaiSanPham()%>
												</a>
											</li>
									<%
										}
									%>
								</ul>
							</div>
						</div>
						<div class="single-sidebar">
							<h3 class="sidebar-title">Lựa chọn theo vị</h3>
							<div class="sidebar-list">
								<ul>
									<li>
										<a href="#">Dâu (3)</a>
									</li>
									<li>
										<a href="#">Cam (1)</a>
									</li>
									<li>
										<a href="#">Ngọt (5)</a>
									</li>
									<li>
										<a href="#">Chanh (1)</a>
									</li>
									<li>
										<a href="#">Socola (3)</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="single-sidebar">
							<h3 class="sidebar-title">Hàng bán chạy</h3>
							<div class="tag">
								<ul>
									<li><a href="#">Bánh ngọt</a></li>
									<li><a href="#">Trà sữa</a></li>
									<li><a href="#">Bánh mặn</a></li>
									<li><a href="#">Nước chanh</a></li>
									<li><a href="#">Nước cam</a></li>
									<li><a href="#">Trà sữa Đài Loan</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="blog-wrapper shop-page-mrg">
						<div class="tab-menu-product">
							<div class="tab-menu-sort">
								<div class="tab-menu">
									<ul role="tablist">
										<li class="active">
											<a href="#grid" data-toggle="tab">
												<i class="fa fa-th-large"></i> Danh mục
											</a>
										</li>
									</ul>
								</div>
								<div class="tab-sort">
									<label>Sắp xếp : </label> <select>
										<option value="">Giá từ thấp đến cao</option>
										<option value="">Giá từ cao đến thấp</option>
									</select>
								</div>
							</div>
							<!-- Thông báo đặt hàng -->
						<%-- 	<%							
									if(session.getAttribute("paid") != null){
							%>
							<div class="alert alert-info">
								<center>									
									<strong><%out.print("Đặt hàng thành công, mời bạn tiếp tục mua sắm!"); %></strong> 
								</center>
							</div>
							<%
								}
							%> --%>
							<!-- Thông báo đặt hàng -->
							
							<div class="tab-product">
								<div class="tab-content">
									<div class="tab-pane active" id="grid">
										<div class="row">
										<%
											/* 	int first = 0, last = 0, pages = 1;

												if (request.getParameter("pages") != null) {
													pages = (int) Integer.parseInt(request.getParameter("pages"));
												}
												ProductsBO s = new ProductsBO();
												//Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
												int total = s.getCount();

												if (total <= 4) {
													first = 0;
													last = total;
												} else {
													first = (pages - 1) * 4;
													last = first+4;
												} */
												DecimalFormat numformat = new DecimalFormat("#,###,###");
												//Lấy ra danh sách sản phẩm
												//ArrayList<Products> list = s.getAllProDuctsLimit(first, last);
												ArrayList<Products> list = (ArrayList<Products>) request.getAttribute("lstProducts");

												for (Products ls : list) {
											%>									
											<div class="col-md-6 col-lg-4 col-sm-6">
												<div class="single-shop mb-40">
													<div class="shop-img">
														<a href="#" data-toggle="modal"
																data-target="#quick-view<%=ls.getId()%>"
																title="Quick View">
															<img
															src="assets/img/shop/product/<%=ls.getAnhChinh()%>"
															alt="" /></a>
														<%
															if (ls.getTinhTrang() == 1) {
																		if (ls.getKhuyenMai() > 0) {
														%>
														<div class="price-up-down">
															<span class="sale-new">Giảm <%=ls.getKhuyenMai()%>%
															</span>
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
															<a href="HomeCartServlet?status=add&id_product=<%=ls.getId()%>" title="Add to Cart"> 
																<i class="pe-7s-cart"></i>
															</a> 
															<a class="wishlist" href="#" title="Wishlist"> 
																<i class="pe-7s-like" onclick="ThaTim()"></i>
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
																	<a href="#"><%=ls.getTenSanPham()%></a>
																</h3>
															</div>
															<%
																double price = ls.getGiaGoc();
																		int sale = ls.getKhuyenMai();
																		price = price - (price * sale / 100);
																		String price_nb = numformat.format(price);
															%>
															<div class="price f-right">
																<span class="new"><%=price_nb%> đ</span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<%
												}											
											%>																					
										</div>									
									</div>
									
									<!-- phân trang -->
									
									<div class="page-pagination text-center">
									<ul>
											<li><a class="active" href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
										</ul>
										<%-- <ul class="start">
											<%
												//Button Previous
												int back = 0;
												if (pages == 0 || pages == 1) {
													back = 1;//Luon la page 1
												} else {
													back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
												}
											%>
											<li><a href="HomeProductsServlet?pages=<%=back%>"><i><i class="fa fa-angle-double-left"></i></i></a></li>
											<%
												//Button Number pages
												int loop = 0, num = 0;
												if ((total / 4) % 2 == 0) {
													num = total / 4;
												} else {
													num = (total + 1) / 4;
												}
												//Nếu total lẻ thêm 1
												if (total % 2 != 0) {
													loop = (total / 4) + 1;

												} else {
													//Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
													if (total < (num * 4) + 4 && total != num * 4) {
														loop = (total / 4) + 1;
													} else {
														//Nếu bằng fullPage thì không thêm
														loop = (total / 4);
													}
												}
												//Lap so pages
												for (int i = 1; i <= loop; i++) {
											%>
											<%
												if (pages == i) {
											%>

											<li><span><a href="HomeProductsServlet?pages=<%=i%>"><%=i%></a></span></li>
											<%
												} else {
											%>
											<li class="arrow"><a href="HomeProductsServlet?pages=<%=i%>"><%=i%></a>
											</li>

											<%
												}
												}
											%>
											<%
												//Button Next
												int next = 0;
												//Nếu total lẻ
												if (total % 2 != 0) {
													if (pages == (total / 4) + 1) {
														next = pages;//Khong next
													} else {
														next = pages + 1;//Co next
													}
												} else {
													//Nếu total chẵn nhỏ hơn fullpage
													//Và không fullPage thì thêm 1
													if (total < (num * 4) + 4 && total != num * 4) {
														if (pages == (total / 4) + 1) {
															next = pages;//Khong next
														} else {
															next = pages + 1;//Co next
														}
													} else {
														//Nếu fullPage đến trang cuối dừng
														//Chưa tới trang cuối thì được next
														if (pages == (total / 4)) {
															next = pages;//Khong next
														} else {
															next = pages + 1;//Co next
														}
													}
												}
											%>
											<li><a href="HomeProductsServlet?pages=<%=next%>"><i
													class="next"><i class="fa fa-angle-double-right"></i></i></a></li>
										</ul> --%>
										
										<!-- /phân trang -->
										
									</div>
									
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Xong nội dung trang danh sách sản phẩm -->
		<!-- Bắt đầu xem nhanh chi tiết -->
	<jsp:include page="layout/detail_product.jsp"></jsp:include>
	<!-- Xong xem nhanh chi tiết -->
	<jsp:include page="layout/chatbox.jsp"></jsp:include>
	<!-- Thêm chân trang -->
	<jsp:include page="layout/footer.jsp"></jsp:include>
	<!-- Xong thêm chân trang -->
 

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