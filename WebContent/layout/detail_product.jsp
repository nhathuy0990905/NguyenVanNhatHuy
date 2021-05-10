<%@page import="model.bean.ProductsDetail"%>
<%@page import="model.bean.Products"%>
<%@page import="model.bo.ProductDetailBO"%>
<%@page import="model.bo.ProductsBO"%>
<%@ page pageEncoding="utf-8"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Chi tiết sản phẩm</title>
</head>
<body>

	<!-- Bắt đầu xem nhanh chi tiết -->
	<%
		ProductsBO products = new ProductsBO();
		ProductDetailBO detailproduct = new ProductDetailBO();
		for (Products ls : products.getListProducts()) {
	%>
	<div class="quick-view modal fade in" id="quick-view<%=ls.getId()%>">
		<div class="container">
			<div class="row">
				<div id="view-gallery">
					<div class="col-xs-12">
						<div class="d-table">
							<div class="d-tablecell">
								<div class="modal-dialog">
									<div class="main-view modal-content">
										<div class="modal-footer" data-dismiss="modal">
											<span>x</span>
										</div>
										<div class="row">
											<div class="col-xs-12 col-sm-5">
												<div class="quick-image">
													<div class="single-quick-image tab-content text-center">
														<%
															int index = -1;
															for (ProductsDetail list : detailproduct.getProductDetailByProductID(ls.getId())) {
																index++;
																if (index == 0) {
														%>
														<div class="tab-pane  fade in active"
															id="sin-pro-<%=list.getId()%>">
															<img src="assets/img/shop/DetailProduct/<%=list.getAnhChiTiet()%>" alt="" />
														</div>
														<%
																} else {
														%>
																	<div class="tab-pane fade in" id="sin-pro-<%=list.getId()%>">
																		<img src="assets/img/shop/DetailProduct/<%=list.getAnhChiTiet()%>" alt="" />
																	</div>
														<%
																}
															}
														%>

													</div>
													<div class="quick-thumb">
														<div class="nav nav-tabs">
															<ul>
																<%
																	for (ProductsDetail list : detailproduct.getProductDetailByProductID(ls.getId())) {
																%>
																		<li>
																			<a data-toggle="tab" href="#sin-pro-<%=list.getId()%>"> 
																				<img src="assets/img/shop/DetailProduct/<%=list.getAnhChiTiet()%>" alt="quick view" />
																			</a>
																	</li>
																<%
																	}
																%>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xs-12 col-sm-7">
												<div class="quick-right">
													<div class="quick-right-text">
														<h3>
															<strong><%=ls.getTenSanPham()%></strong>
														</h3>
														<div class="rating">
															<i class="fa fa-thumbs-o-up"> <b><%=ls.getLuotThich()%></b>
																lượt thích
															</i>
														</div>
														<div class="amount">
															<%
																DecimalFormat numformat = new DecimalFormat("#,###,###");
																double price = ls.getGiaGoc();
																int sale = ls.getKhuyenMai();
																price = price - (price * sale / 100);
																String price_nb = numformat.format(price);
															%>
															<h4>
																Giá bán <%=price_nb%> đ
															</h4>
														</div>
														<p><%=ls.getMoTa()%></p>
														<div class="dse-btn">
															<div class="row">
																<div class="col-sm-12 col-md-6">
																	<div class="por-dse clearfix">
																		<ul>
																			<li class="share-btn clearfix">
																				<span>Yêu thích</span> 
																				<a onclick="YeuThich()">
																					<i class="fa fa-thumbs-up"></i>
																				</a>
																			</li>
																		</ul>
																	</div>
																</div>
																<div class="col-sm-12 col-md-6">
																	<div class="por-dse add-to">
																		<a href="HomeCartServlet?status=add&id_product=<%=ls.getId()%>">
																			Mua ngay <i class="fa fa-cart-plus"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>

	<!-- Xong xem nhanh chi tiết -->

	<!-- https://github.com/sweetalert2/sweetalert2 -->
	<!-- https://www.youtube.com/watch?v=1uqjQ7IovcQ -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
	<script type="text/javascript">
	function YeuThich() {
		Swal.fire('Bạn đã yêu thích sản phẩm này!',
			      '',
			      'success'
		)
	}
	</script>
</body>
</html>