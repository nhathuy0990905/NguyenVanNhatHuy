package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.ProductsDetail;

public class ProductDetailDAO {
	// hàm get hiển thị ra chi tiết sản phẩm giao diện Trang chủ và Quản lý
	public ArrayList<ProductsDetail> getProductDetailByProductID(long idSanPham) {
		DBConnect cs = new DBConnect();
		ArrayList<ProductsDetail> lst = new ArrayList<ProductsDetail>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM chitietsanpham WHERE id_sanpham=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, idSanPham);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				ProductsDetail detail = new ProductsDetail();
				detail.setId(rs.getLong("id"));
				detail.setId_sanPham(rs.getLong("id_sanpham"));
				detail.setAnhChiTiet(rs.getString("anhchitiet"));
				
				lst.add(detail);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	/*
	 * Xong phần trang chủ đến phần admin
	 */

	// hàm get hiển thị ra toàn bộ chi tiết sản phẩm giao diện quản lý
	public ArrayList<ProductsDetail> getProductDetail() {
		DBConnect cs = new DBConnect();
		ArrayList<ProductsDetail> lst = new ArrayList<ProductsDetail>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM chitietsanpham ";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				ProductsDetail detail = new ProductsDetail();
				detail.setId(rs.getLong("id"));
				detail.setId_sanPham(rs.getLong("id_sanpham"));
				detail.setAnhChiTiet(rs.getString("anhchitiet"));
				
				lst.add(detail);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	// thêm mới 1 loại sản phẩm
	public boolean addDetailProducts(ProductsDetail pd) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "INSERT INTO chitietsanpham(anhchitiet, id_sanpham) VALUES(?,?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, pd.getAnhChiTiet());
			cmd.setLong(2, pd.getId_sanPham());
			cmd.executeQuery();
			cs.cn.close();
			cmd.close();
			System.out.println(pd.getAnhChiTiet()+"dao");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// hàm get hiển thị ra chi tiết sản phẩm theo mã id-
	public ProductsDetail getDetailproductByID(long id) {
		DBConnect cs = new DBConnect();
		ProductsDetail lst = new ProductsDetail();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM CHITIETSANPHAM WHERE id=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, id);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				long id_chitietSanPham = rs.getLong("id");
				String anhSanPham = rs.getString("anhchitiet");
				long id_SanPham = rs.getLong("id_sanpham");
				lst = new ProductsDetail(id_chitietSanPham, id_SanPham, anhSanPham);
			}
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lst;
	}

	// sửa loại sản phẩm
	public boolean editdetailProducts(ProductsDetail pd) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "UPDATE chitietsanpham SET anhchitiet = ? WHERE id = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, pd.getAnhChiTiet());
			cmd.setLong(2, pd.getId());
			cmd.executeQuery();
			cs.cn.close();
			cmd.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// xóa chi tiết sản phẩm theo mã id
	public boolean deleteDetailProduct(long id) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "DELETE FROM chitietsanpham WHERE id = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, id);
			cmd.executeUpdate();
			cs.cn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
