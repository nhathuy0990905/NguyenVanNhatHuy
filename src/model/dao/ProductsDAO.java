package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Products;

public class ProductsDAO {
	// hàm get hiển thị ra sản phẩm giao diện Trang chủ và Quản lý
	public ArrayList<Products> getListProducts() {
		DBConnect cs = new DBConnect();
		ArrayList<Products> lst = new ArrayList<Products>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM sanpham";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				Products products = new Products();
				products.setId(rs.getLong("id"));
				products.setAnhChinh(rs.getString("anhchinh"));
				products.setGiaGoc(rs.getDouble("giagoc"));
				products.setId_loaiSanPham(rs.getLong("id_loaisp"));
				products.setKhuyenMai(rs.getInt("khuyenmai"));
				products.setLuotThich(rs.getInt("luotthich"));
				products.setMoTa(rs.getString("mota"));
				products.setTenSanPham(rs.getString("tensanpham"));
				products.setTinhTrang(rs.getInt("tinhtrang"));
				
				lst.add(products);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	// get top 8 sản phẩm ra Trang chủ
	// hàm get hiển thị ra sản phẩm giao diện Trang chủ và Quản lý
	public ArrayList<Products> getListProductsTop8() {
		DBConnect cs = new DBConnect();
		ArrayList<Products> lst = new ArrayList<Products>();
		try {
			cs.KetNoi();
			String sql = " SELECT TOP(8)* FROM sanpham";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				Products products = new Products();
				products.setId(rs.getLong("id"));
				products.setAnhChinh(rs.getString("anhchinh"));
				products.setGiaGoc(rs.getDouble("giagoc"));
				products.setId_loaiSanPham(rs.getLong("id_loaisp"));
				products.setKhuyenMai(rs.getInt("khuyenmai"));
				products.setLuotThich(rs.getInt("luotthich"));
				products.setMoTa(rs.getString("mota"));
				products.setTenSanPham(rs.getString("tensanpham"));
				products.setTinhTrang(rs.getInt("tinhtrang"));
				
				lst.add(products);

			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	// hàm get hiển thị ra sản phẩm theo loại sản phẩm giao diện Trang chủ
	public ArrayList<Products> getProductsByCategory(String maLoai) {
		DBConnect cs = new DBConnect();
		ArrayList<Products> lst = new ArrayList<Products>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM SANPHAM WHERE id_loaisp=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, maLoai);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				Products products = new Products();
				products.setId(rs.getLong("id"));
				products.setAnhChinh(rs.getString("anhchinh"));
				products.setGiaGoc(rs.getDouble("giagoc"));
				products.setId_loaiSanPham(rs.getLong("id_loaisp"));
				products.setKhuyenMai(rs.getInt("khuyenmai"));
				products.setLuotThich(rs.getInt("luotthich"));
				products.setMoTa(rs.getString("mota"));
				products.setTenSanPham(rs.getString("tensanpham"));
				products.setTinhTrang(rs.getInt("tinhtrang"));
				
				lst.add(products);

			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	// hàm get hiển thị ra sản phẩm khi nhập Tìm kiếm giao diện Trang chủ
	public ArrayList<Products> getProductsByName(String name) {
		DBConnect cs = new DBConnect();
		ArrayList<Products> lst = new ArrayList<Products>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM SANPHAM WHERE TENSANPHAM LIKE '%"+name+"%' ";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				Products products = new Products();
				products.setId(rs.getLong("id"));
				products.setAnhChinh(rs.getString("anhchinh"));
				products.setGiaGoc(rs.getDouble("giagoc"));
				products.setId_loaiSanPham(rs.getLong("id_loaisp"));
				products.setKhuyenMai(rs.getInt("khuyenmai"));
				products.setLuotThich(rs.getInt("luotthich"));
				products.setMoTa(rs.getString("mota"));
				products.setTenSanPham(rs.getString("tensanpham"));
				products.setTinhTrang(rs.getInt("tinhtrang"));
				
				lst.add(products);

			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	// hàm get hiển thị ra sản phẩm theo mã id- giao diện Trang chủ / giỏ hàng
	public Products getProductsByID(long idSanPham) {
		DBConnect cs = new DBConnect();
		Products lst = new Products();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM SANPHAM WHERE id=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, idSanPham);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				long id = rs.getLong("id");
				long id_loaiSanPham = rs.getLong("id_loaisp");
				String tenSanPham = rs.getString("tensanpham");
				String moTa = rs.getString("mota");
				String anhChinh = rs.getString("anhchinh");
				int giaGoc = rs.getInt("giagoc");
				int khuyenMai = rs.getInt("khuyenmai");
				int tinhTrang = rs.getInt("tinhtrang");
				int luotThich = rs.getInt("luotthich");
				
				lst = new Products(id, id_loaiSanPham, tenSanPham, moTa, anhChinh, giaGoc, khuyenMai, luotThich,tinhTrang);
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
	// thêm sản phẩm
	public boolean addProduct(Products pr) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "INSERT INTO sanpham VALUES(?,?,?,?,?,?,?,?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, pr.getTenSanPham());
			cmd.setString(2, pr.getMoTa());
			cmd.setDouble(3, pr.getGiaGoc());
			cmd.setDouble(4, pr.getKhuyenMai());
			cmd.setString(5, pr.getAnhChinh());
			cmd.setInt(6, pr.getTinhTrang());
			cmd.setInt(7, pr.getLuotThich());
			cmd.setLong(8, pr.getId_loaiSanPham());
			cmd.executeQuery();
			cs.cn.close();
			cmd.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// sửa sản phẩm
	public boolean editProduct(Products pr) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "UPDATE sanpham SET tensanpham = ?, mota = ?, giagoc = ?, khuyenmai = ?, anhchinh = ?, tinhtrang = ?, luotthich = ?, id_loaisp = ? WHERE id = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, pr.getTenSanPham());
			cmd.setString(2, pr.getMoTa());
			cmd.setDouble(3, pr.getGiaGoc());
			cmd.setDouble(4, pr.getKhuyenMai());
			cmd.setString(5, pr.getAnhChinh());
			cmd.setInt(6, pr.getTinhTrang());
			cmd.setInt(7, pr.getLuotThich());
			cmd.setLong(8, pr.getId_loaiSanPham());
			cmd.setLong(9, pr.getId());
			cmd.executeQuery();
			cs.cn.close();
			cmd.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// get 1 sản phẩm theo id
	// xóa sản phẩm theo mã id
	public boolean deleteProduct(long id) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "DELETE FROM sanpham WHERE id = ?";
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

	/* Phân trang sản phẩm ở trang product.jsp */
	// hàm get toàn bộ sản phẩm giới hạn trang
	public ArrayList<Products> getAllProDuctsLimit(int a, int b) {
		ArrayList<Products> lst = new ArrayList<Products>();
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "SELECT * FROM ( \r\n" + "  SELECT *, ROW_NUMBER() OVER (ORDER BY id) as row FROM sanpham \r\n"
					+ " ) a WHERE a.row > ? and a.row <=? ";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setInt(1, a);
			cmd.setInt(2, b);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				Products products = new Products();
				products.setId(rs.getLong("id"));
				products.setAnhChinh(rs.getString("anhchinh"));
				products.setGiaGoc(rs.getDouble("giagoc"));
				products.setId_loaiSanPham(rs.getLong("id_loaisp"));
				products.setKhuyenMai(rs.getInt("khuyenmai"));
				products.setLuotThich(rs.getInt("luotthich"));
				products.setMoTa(rs.getString("mota"));
				products.setTenSanPham(rs.getString("tensanpham"));
				products.setTinhTrang(rs.getInt("tinhtrang"));
				
				lst.add(products);
			}
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return lst;
	}

	// ĐẾM tổng số sản phẩm
	public int getCount() throws Exception {
		DBConnect cs = new DBConnect();
		String sql = "SELECT count(id) FROM sanpham";
		int count = 0;
		try {
			cs.KetNoi();
			PreparedStatement stmt = cs.cn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
			cs.cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

}
