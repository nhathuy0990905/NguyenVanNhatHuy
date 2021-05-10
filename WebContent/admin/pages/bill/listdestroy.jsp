<%@page import="model.bean.Bills"%>
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
	<link rel="stylesheet" href="admin/lib/bower_components/alertifyjs/css/alertify.css">
	<link rel="stylesheet" href="admin/lib/bower_components/alertifyjs/css/themes/default.css">
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
									<b>HÓA ĐƠN ĐÃ HỦY</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)">Trang chủ</a></li>
									<li><a href="javascript:void(0)">Hóa đơn</a></li>
									<li><a href="javascript:void(0)">Danh sách</a></li>
									<li class="active">Đã hũy</li>
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
								<a class="btn btn-primary float-right btn-sm" href="AdminListBills">
									DANH SÁCH HÓA ĐƠN
								</a>
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table"
									   class="table table-striped table-bordered"
								 	   style="font-size: 14px">
									<thead>
										<tr>
											<th>ID</th>
											<th>Họ tên</th>
											<th>Số nhà</th>
											<th>Địa chỉ</th>
											<th>Điện thoại</th>
											<th>Email</th>
											<th>Ghi chú</th>
											<th>Ngày đặt</th>
											<th>Xem chi tiết</th>
											<th>Tùy chọn thay đổi</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<Bills> list = (ArrayList<Bills>) request.getAttribute("listBillsDetroy");
											for (Bills l : list) {
										%>
										<tr>
											<td><%=l.getId()%></td>
											<td><%=l.getHoTen()%></td>
											<td><%=l.getSoNha()%></td>
											<td><%=l.getDiaChi()%></td>
											<td><%=l.getSoDienThoai()%></td>
											<td><%=l.getEmail()%></td>
											<td><%=l.getGhiChu()%></td>
											<td><%=l.getNgayDat()%></td>
											<td>
												<a class="btn btn-info btn-block btn-sm"
												   href="AdminListBillsDetail?idHoaDon=<%=l.getId()%>&huy=true">
												   	<span><i class="fa fa-edit"></i></span> 
												   	Chi tiết
												</a>
											</td>
											<td>
												<div>
													<button class="btn btn-warning btn-block btn-sm"
															onclick="ThayDoiTrangThai(<%=l.getId()%>, 0)">
														Đặt hàng
													</button>
												</div>
												<div>
													<button class="btn btn-primary btn-block btn-sm mt-1"
															onclick="ThayDoiTrangThai(<%=l.getId()%>, 1)">
														Đang ship
													</button>
												</div>
												<div>
													<button class="btn btn-danger mt-1 btn-block btn-sm"
															onclick="ThayDoiTrangThai(<%=l.getId()%>, 2)">
														Thanh toán
													</button>
												</div>
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

	<script src="admin/lib/bower_components/alertifyjs/alertify.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>

	<script>
	$('body').addClass("open");
	</script>
	<script>
function ThayDoiTrangThai(id, trangthai) {
    	
    	swal({
  		  title: "Bạn có chắc chắn muốn thay đổi trạng thái hóa đơn?",
  		  type: 'warning',
  		  showCancelButton: true,
  		  confirmButtonColor: '#3085d6',
  		  cancelButtonColor: '#d33',
  		  confirmButtonText: 'Yes'
  		}).then((result) => {
  		  if (result.value) {
  			 $.ajax({
				   url: "AdminEditStatusBill",
				   type: "POST",
				   data: {
					   id: id, trangthai: trangthai
				   }
			   }).done(function(ketqua){
				   if(ketqua){
					   $('#bootstrap-data-table tr').each(function(index){
							if($(this).find('td').first().text() == id) {
								$('#bootstrap-data-table').DataTable().rows(index-1).remove().draw();
							}
						});
					  alertify.success('Thay đổi dữ liệu thành công!');
				   }
			   }).error(function(){
				   alertify.error('Lỗi');
			   });
  		  } else {
  			 alertify.error('Dữ liệu không thay đổi');
  		  }
  		});
    }
	</script>
</body>
</html>
