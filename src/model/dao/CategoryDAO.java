package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.Category;

public class CategoryDAO {
	// hàm get hiển thị ra LOẠI sản phẩm giao diện Trang chủ và Quản lý
	public ArrayList<Category> getListCategory() {
		DBConnect cs = new DBConnect();
		ArrayList<Category> lst = new ArrayList<Category>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM loaisanpham";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				Category category = new Category();
				category.setId(rs.getLong("id"));
				category.setTenLoaiSanPham(rs.getString("tenloai"));

				lst.add(category);
			}

			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	/* Xong phần hiển thị trang chủ */

	/* Phần quản lý admin */

	// thêm mới 1 loại sản phẩm
	public boolean addCategory(Category ca) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "INSERT INTO loaisanpham VALUES(?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, ca.getTenLoaiSanPham());
			cmd.executeQuery();
			cs.cn.close();
			cmd.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// hàm get hiển thị ra loại sản phẩm theo mã id-
	public Category getCategoryByID(long id) {
		DBConnect cs = new DBConnect();
		Category lst = new Category();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM LOAISANPHAM WHERE id=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, id);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {				
				long id_loaiSanPham = rs.getLong("id");
				String tenLoaiSanPham = rs.getString("tenloai");			
				lst = new Category(id_loaiSanPham, tenLoaiSanPham);
			}
			rs.close();
			cs.cn.close();
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		return lst;
	}	

	// sửa loại sản phẩm
	public boolean editCategory(Category ca) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "UPDATE loaisanpham SET tenloai = ? where id=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, ca.getTenLoaiSanPham());
			cmd.setLong(2, ca.getId());
			cmd.executeQuery();
			cs.cn.close();
			cmd.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// xóa sản phẩm theo mã id
	public int deleteProduct(long id) {
		DBConnect cs = new DBConnect();
		int kq=0;
		try {
			cs.KetNoi();
			String sql = "DELETE FROM loaisanpham WHERE id = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, id);
			kq =cmd.executeUpdate();
			cs.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}

}
