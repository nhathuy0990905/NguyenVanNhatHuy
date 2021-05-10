<%@page import="model.bean.BillDetailsFull"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
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
</head>
<body>
	<jsp:include page="../include/leftmenu.jsp"></jsp:include>
	<%-- 	<% long idHoaDon = (long) request.getAttribute("idHoaDon"); %> --%>
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
									<b>CHI TIẾT HÓA ĐƠN ĐÃ HỦY</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)">Trang chủ</a></li>
									<li><a href="javascript:void(0)">Chi tiết hóa đơn</a></li>
									<li class="active">Danh sách</li>
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
								<strong class="card-title">Danh sách</strong>
								<button type="submit" class="btn btn-danger float-right"name="huy" onclick="history.go(-1);">Trở về</button>
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên sản phẩm</th>
											<th>Giá gốc</th>
											<th>Số lượng</th>
											<th>Khuyến mãi</th>
											<th>Thành tiền</th>
											<th>Hình ảnh</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<BillDetailsFull> list = (ArrayList<BillDetailsFull>) request.getAttribute("list");
											for (BillDetailsFull l : list) {
										%>
										<tr>
											<td><%=l.getId()%></td>
											<td><%=l.getTensanpham()%></td>
											<td><%=l.getGiagoc()%></td>
											<td><%=l.getSoluong()%></td>
											<td><%=l.getKhuyenmai()%></td>
											<td><%=l.getGiagoc() * l.getSoluong() - (l.getSoluong() * l.getGiagoc() * l.getKhuyenmai() / 100)%></td>
											<td style="min-width: 120px;">
												<%
													if (l.getAnhchinh() != "") {
												%> 
												<a href="admin/../assets/img/shop/product/<%=l.getAnhchinh()%>">
													<img alt="" src="admin/../assets/img/shop/product/<%=l.getAnhchinh()%>"style="width: 100%">
												</a> 
												<%
											 		} else {
											 	%> 
											 		<img alt="" src="https://placehold.it/270x270" style="width: 100%">
												<%
													}
												%>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->
		<div class="clearfix"></div>
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->

	<jsp:include page="../include/js.jsp"></jsp:include>

	<script src="admin/lib/assets/js/lib/data-table/datatables.min.js"></script>
	<script
		src="admin/lib/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script
		src="admin/lib/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script
		src="admin/lib/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script src="admin/lib/assets/js/lib/data-table/jszip.min.js"></script>
	<script src="admin/lib/assets/js/lib/data-table/vfs_fonts.js"></script>
	<script src="admin/lib/assets/js/lib/data-table/buttons.html5.min.js"></script>
	<script src="admin/lib/assets/js/lib/data-table/buttons.print.min.js"></script>
	<script src="admin/lib/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	<script src="admin/lib/assets/js/init/datatables-init.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>
</body>
</html>
