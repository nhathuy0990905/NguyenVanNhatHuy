<%@page import="model.bean.Users"%>
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
									<b>TÀI KHOẢN</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)">Trang chủ</a></li>
									<li><a href="javascript:void(0)">Tài khoản</a></li>
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
								<!-- 								<a class="btn btn-primary float-right" href="add"><span><i class="fa fa-plus-square"></i></span> Thêm</a> -->
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên tài khoản</th>
											<th>Email</th>
											<th>Tên hiển thị</th>
											<th>Hình đại diện</th>
											<th>Phân quyền</th>
											<th>ResetPass</th>
											<th>Xóa</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<Users> list = (ArrayList<Users>) request.getAttribute("lstUser");
											for (Users l : list) {
										%>
										<tr>
											<td><%=l.getId()%></td>
											<td><%=l.getTenTaiKhoan()%></td>
											<td><%=l.getEmail()%></td>
											<td><%=l.getTenHienThi()%></td>
											<td style="min-width: 100px;">
												<%
													if (l.getAnhChinh() != "") {
												%> 
														<a href="admin/../assets/img/testimonial/<%=l.getAnhChinh()%>">
															<img alt="" src="admin/../assets/img/testimonial/<%=l.getAnhChinh()%>" style="width: 100%">
														</a> 
												<%
 													} else {
 												%> 		<img alt="" src="https://placehold.it/270x270" style="width: 100%"> <%
 													}
 												%>
											</td>
											<%
												if (l.getPhanQuyen().equals("0")) {
											%>
													<td>
														<button class="btn btn-warning"
																onclick="ThayDoiPhanQuyen(<%=l.getId()%>,'<%=l.getPhanQuyen()%>')"
																id="trangthai<%=l.getId()%>">
																	User
														</button>
													</td>
													<td>
														<button class="btn btn-danger"
																onclick="ResetPass(<%=l.getId()%>)">
																	ResetPass
														</button>
													</td>
													<td>
														<button class="btn btn-secondary"
																onclick="Delete(<%=l.getId()%>)">
															<span><i class="fa fa-trash-o"></i></span> Xóa
														</button>
													</td>
											<%
												} else {
											%>
													<td>
														<button class="btn btn-primary"
																onclick="swal('Vui lòng chọn quyền User');"
																id="trangthai<%=l.getId()%>">
																	Admin
														</button>
													</td>
													<td>
														<button class="btn btn-danger"
																onclick="ResetPass(<%=l.getId()%>)">
																	ResetPass
														</button>
													</td>
													<td>
														<button class="btn btn-secondary"
																onclick="swal('404');">
															<span><i class="fa fa-trash-o"></i></span> Xóa
														</button>
													</td>
											<%
												}
											%>											
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
	<script>
	$('body').addClass("open");
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>
	<script>
	function ThayDoiPhanQuyen(id, phanquyen){
		swal("Chức năng chưa cập nhật!");
		/* swal({
			  title: 'Bạn chắc chắn muốn đổi phân quyền?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  if (result.value) {
				   $.ajax({
					   url: "editquyen",
					   type: "POST",
					   data: {
						   id: id, phanquyen: phanquyen
					   }
				   }).done(function(ketqua){
					   if(ketqua){
						   if(phanquyen == 'user'){
								$("#trangthai" + id).removeClass("btn-warning").addClass("btn-primary");
								$("#trangthai" + id).text("admin");
								phanquyen = 'admin'
								$("#trangthai" + id).attr("onclick","ThayDoiPhanQuyen("+ id + ",'" + phanquyen+ "')");
							} else{
								$("#trangthai" + id).removeClass("btn-primary").addClass("btn-warning");
								$("#trangthai" + id).text("user");
								phanquyen = 'user'
								$("#trangthai" + id).attr("onclick","ThayDoiPhanQuyen("+ id + ",'" + phanquyen + "')");
							}
						  alertify.success('Thay đổi phân quyền thành công!');
					   }
				   }).error(function(){
					   console.log("Lỗi");
				   });
			  } else alertify.error('Dữ liệu không thay đổi!');
			}) */
	}
	</script>

	<script>
	function ResetPass(id){
		swal("Chức năng chưa cập nhật!");
		/* swal({
			  title: 'Bạn chắc chắn muốn Reset Password?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  if (result.value) {
				   $.ajax({
					   url: "resetpass",
					   type: "POST",
					   data: {
						   id: id
					   }
				   }).done(function(ketqua){
					   if(ketqua){
						  alertify.success('reset password successfully!');
					   }
				   }).error(function(){
					   console.log("Lỗi");
				   });
			  } else alertify.error('Dữ liệu không thay đổi!');
			}) */
	} 
	</script>


	<%
		if ((String) session.getAttribute("Edit") == "Success") {
	%>
	<script>
		swal('Sửa dữ liệu thành công');
	</script>
	<%
		session.removeAttribute("Edit");
		}
	%>

	<%
		if ((String) session.getAttribute("Add") == "Success") {
	%>
	<script>
		swal('Thêm dữ liệu thành công');
	</script>
	<%
		session.removeAttribute("Add");
		}
	%>

	<%
		if ((String) session.getAttribute("Delete") == "Success") {
	%>
	<script>
		swal('Xóa dữ liệu thành công');
	</script>
	<%
		session.removeAttribute("Delete");
		}
	%>

	<script>
    function Delete(id) {
    	swal({
  		  title: "Bạn có chắc chắn muốn xóa tài khoản này?",
  		  text: "Sau khi xóa, bạn sẽ không thể phục hồi dữ liệu này!",
  		  type: 'warning',
  		  showCancelButton: true,
  		  confirmButtonColor: '#3085d6',
  		  cancelButtonColor: '#d33',
  		  confirmButtonText: 'Yes'
  		}).then((result) => {
  		  if (result.value) {
  			  window.location.href = "AdminDeleteUser?id=" + id;
  		  } else {
  			  swal("Dữ liệu của bạn không thay đổi!");
  		  }
  		});
    }
  </script>
</body>
</html>
