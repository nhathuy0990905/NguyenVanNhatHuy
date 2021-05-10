package model.bo;

import java.util.ArrayList;

import model.bean.Products;
import model.dao.DBConnect;
import model.dao.ProductsDAO;

public class ProductsBO {
	
	ProductsDAO s = new ProductsDAO();

	// hàm get list sản phẩm ra
	public ArrayList<Products> getListProducts() {
		return s.getListProducts();
	}

	// hàm get hiển thị ra sản phẩm giao diện Trang chủ và Quản lý
	public ArrayList<Products> getListProductsTop8() {
		return s.getListProductsTop8();
	}

	// hàm get hiển thị ra sản phẩm theo loại sản phẩm giao diện Trang chủ
	public ArrayList<Products> getProductsByCategory(String maLoai) {
		return s.getProductsByCategory(maLoai);
	}

	// hàm get hiển thị ra sản phẩm khi nhập Tìm kiếm giao diện Trang chủ
	public ArrayList<Products> getProductsByName(String tenSanPham) {
		return s.getProductsByName(tenSanPham);
	}

	// hàm get hiển thị ra sản phẩm theo mã id- giao diện Trang chủ / giỏ hàng
	public Products getProductsByID(long idSanPham) {
		return s.getProductsByID(idSanPham);
	}

	// admin
	// hàm thêm sản phẩm
	public boolean addProducts(Products pr) {
		return s.addProduct(pr);
	}

	// sửa sản phẩm
	public boolean editProduct(Products pr) {
		return s.editProduct(pr);
	}

	// xóa sản phẩm theo mã id
	public boolean deleteProduct(long id) {
		return s.deleteProduct(id);
	}

	// hàm get toàn bộ sản phẩm giới hạn trang
	public ArrayList<Products> getAllProDuctsLimit(int a, int b) {
		return s.getAllProDuctsLimit(a, b);
	}

	// ĐẾM tổng số sản phẩm
	public int getCount() throws Exception {
			return s.getCount();
		}

}
