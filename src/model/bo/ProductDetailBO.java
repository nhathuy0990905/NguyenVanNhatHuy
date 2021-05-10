package model.bo;

import java.util.ArrayList;

import model.bean.ProductsDetail;
import model.dao.ProductDetailDAO;

public class ProductDetailBO {
	
	ProductDetailDAO s = new ProductDetailDAO();

	// hàm get hiển thị ra chi tiết sản phẩm giao diện Trang chủ và Quản lý
	public ArrayList<ProductsDetail> getProductDetailByProductID(long idSanPham) {
		return s.getProductDetailByProductID(idSanPham);
	}
	/*
	 * Xong phần trang chủ đến phần admin
	 */

	// hàm get hiển thị ra toàn bộ chi tiết sản phẩm giao diện quản lý
	public ArrayList<ProductsDetail> getProductDetail() {

		return s.getProductDetail();
	}

	// thêm mới 1 loại sản phẩm
	public boolean addDetailProducts(ProductsDetail pd) {
		return s.addDetailProducts(pd);
	}

	// hàm get hiển thị ra chi tiết sản phẩm theo mã id-
	public ProductsDetail getDetailproductByID(long id) {

		return s.getDetailproductByID(id);
	}

	// sửa loại sản phẩm
	public boolean editdetailProducts(ProductsDetail pd) {

		return s.editdetailProducts(pd);
	}

	// xóa chi tiết sản phẩm theo mã id
	public boolean deleteDetailProduct(long id) {

		return s.deleteDetailProduct(id);
	}

}
