package model.bo;

import java.util.ArrayList;

import model.bean.Category;
import model.dao.CategoryDAO;

public class CategoryBO {
	
	CategoryDAO s = new CategoryDAO();

	// hàm get hiển thị ra LOẠI sản phẩm giao diện Trang chủ và Quản lý
	public ArrayList<Category> getListCategory() {
		return s.getListCategory();
	}

	// thêm mới 1 loại sản phẩm
	public boolean addCategory(Category ca) {
		return s.addCategory(ca);
	}

	// hàm get hiển thị ra loại sản phẩm theo mã id-
	public Category getCategoryByID(long id) {
		return s.getCategoryByID(id);
	}

	// sửa loại sản phẩm
	public boolean editCategory(Category ca) {
		return s.editCategory(ca);
	}

	// xóa loại sản phẩm theo mã id
	public int deleteCategory(long id) {
		return s.deleteProduct(id);
	}

}
