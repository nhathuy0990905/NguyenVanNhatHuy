<%@page import="model.bean.Category"%>
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
</head>
<body>
	<%
		Category category = (Category) request.getAttribute("category");
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
                                <h1><b>LOẠI SẢN PHẨM</b></h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="javascript:void(0)">Trang chủ</a></li>
                                    <li><a href="javascript:void(0)">Loại sản phẩm</a></li>
                                    <li class="active">Chỉnh sửa</li>
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
                            <div class="card-header"><strong>Chỉnh sửa</strong><small> ID = <%= category.getId() %></small></div>
                            <div class="card-body card-block">
                                <form action="AdminEditCategory" method="post" enctype="application/x-www-form-urlencoded" class="form-horizontal">
                                <input type="hidden" id="" class="form-control" value="<%=category.getId() %>" name="id">
                                   <div class="row">
                                    <div class="col-md-6">
                                    	<div class="form-group">
                                        	<label class="form-control-label">Tên loại sản phẩm</label>
                                        	<input type="text" placeholder="Nhập tên loại sản phẩm" class="form-control" value=" <%=category.getTenLoaiSanPham()%>" name="tenloai">
                                    	</div>
                                     	<div class="form-actions form-group">
                                        	<button type="submit" class="btn btn-success">Lưu lại</button>
                                       		<button type="submit" class="btn btn-danger"name="huy" onclick="history.go(-1);">Hủy bỏ</button>
                                    	</div>
                                    </div>
                                   </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
		<div class="clearfix"></div>
    </div><!-- /#right-panel -->

    <!-- Right Panel -->
    
     <!-- Scripts -->
    <jsp:include page="../include/js.jsp"></jsp:include>
</body>
</html>