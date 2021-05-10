package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Users;

public class UsersDAO {
	// hàm kiểm tra tài khaorn & email đã tồn tại chưa
	public boolean checkAccount(String userName, String email) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM taikhoan WHERE tentaikhoan=? or email=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, userName);
			cmd.setString(2, email);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				return true;
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;

	}

	// hàm KIỂM TRA khi người dùng/ admin ĐĂNG NHẬP
	public Users checkLogin(String un, String pass) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM taikhoan WHERE (tentaikhoan=? and matkhau=?)or(email=? and matkhau=?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, un);
			cmd.setString(2, pass);
			cmd.setString(3, un);
			cmd.setString(4, pass);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				Users user = new Users();
				user.setId(rs.getLong("id"));
				user.setTenTaiKhoan(rs.getString("tentaikhoan"));
				user.setEmail(rs.getString("email"));
				user.setPhanQuyen(rs.getString("phanquyen"));
				user.setTenHienThi(rs.getString("tenhienthi"));
				user.setAnhChinh(rs.getString("hinhanh"));
				
				return user;
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	// Phương thức thêm một tài khoản mới
	public boolean addAccount(Users user) throws Exception {
		DBConnect cs = new DBConnect();
		cs.KetNoi();
		String sql = "INSERT INTO taikhoan(tentaikhoan,email,matkhau,phanquyen,tenhienthi,hinhanh) VALUES (?,?,?,0,?,?) ";
		try {
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, user.getTenTaiKhoan());
			cmd.setString(2, user.getEmail());
			cmd.setString(3, user.getMatKhau());
			cmd.setString(4, user.getTenHienThi());
			cmd.setString(5, user.getAnhChinh());
			cmd.executeUpdate();
			cs.cn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Phương thức cập nhật thông tin tài khoản cho người dùng/ giao diện trang chủ/cá nhân
	public boolean editAccount(Users user) {
		DBConnect cs = new DBConnect();
		try {
			try {
				cs.KetNoi();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String sql = "UPDATE taikhoan SET tenhienthi = ? , matkhau = ? WHERE tentaikhoan = ? ";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, user.getTenHienThi());
			cmd.setString(2, user.getMatKhau());
			cmd.setString(3, user.getTenTaiKhoan());
			cs.cn.close();
			System.out.println(user.getTenHienThi() + "dao");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Phương thức cập nhật tên hiển thị cho người dùng/ giao diện trang chủ/cá nhân
	public boolean editDisplayNameAccount(String displayName, long id) throws Exception {
		DBConnect cs = new DBConnect();
		String sql = "UPDATE taikhoan SET tenhienthi = ? WHERE id = ? ";
		try {
			cs.KetNoi();
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, displayName);
			cmd.setLong(2, id);
			cs.cn.close();
			cmd.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Phương thức cập nhật mật khẩu cho người dùng/ giao diện trang chủ/cá nhân
	public boolean editPasswordAccount(String matkhau, long id) throws Exception {
		DBConnect cs = new DBConnect();
		String sql = "UPDATE taikhoan SET matkhau = ? WHERE id = ?";
		try {
			cs.KetNoi();
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, matkhau);
			cmd.setLong(2, id);
			cs.cn.close();
			cmd.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// lấy ra toàn bô tài khoản giap diện quản lý
	public ArrayList<Users> getListUsers() {
		DBConnect cs = new DBConnect();
		ArrayList<Users> lst = new ArrayList<Users>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM taikhoan";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Users user = new Users();
				user.setId(rs.getLong("id"));
				user.setTenTaiKhoan(rs.getString("tentaikhoan"));
				user.setEmail(rs.getString("email"));
				user.setPhanQuyen(rs.getString("phanquyen"));
				user.setTenHienThi(rs.getString("tenhienthi"));
				user.setAnhChinh(rs.getString("hinhanh"));
				lst.add(user);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	// xóa tài khoản theo mã id
	public boolean deleteUser(long id) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "DELETE FROM taikhoan WHERE id = ?";
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

	// lấy ra toàn bô thông tin của tài khoản theo id
	public Users getUsersById(long id) {
		DBConnect cs = new DBConnect();
		Users user = new Users();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM taikhoan where id=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, id);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				user.setId(rs.getLong("id"));
				user.setTenTaiKhoan(rs.getString("tentaikhoan"));
				user.setEmail(rs.getString("email"));
				user.setPhanQuyen(rs.getString("phanquyen"));
				user.setTenHienThi(rs.getString("tenhienthi"));
				user.setAnhChinh(rs.getString("hinhanh"));
			}
			
			rs.close();
			cs.cn.close();
			return user;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	// lấy ra toàn bô thông tin của tài khoản theo name
	public Users getUsersByName(String name) {
		DBConnect cs = new DBConnect();
		Users user = new Users();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM taikhoan where tentaikhoan=?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, name);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				user.setId(rs.getLong("id"));
				user.setTenTaiKhoan(rs.getString("tentaikhoan"));
				user.setEmail(rs.getString("email"));
				user.setPhanQuyen(rs.getString("phanquyen"));
				user.setTenHienThi(rs.getString("tenhienthi"));
				user.setAnhChinh(rs.getString("hinhanh"));
			}
			
			rs.close();
			cs.cn.close();
			return user;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	// Phương thức cập nhật hình ảnh cho tài khoản
	public boolean EditAvataAcount(Users user) {
		DBConnect cs = new DBConnect();
		
		try {
			try {
				cs.KetNoi();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String sql = "UPDATE taikhoan SET hinhanh = ? WHERE tentaikhoan = ? ";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, user.getAnhChinh());
			cmd.setString(2, user.getTenTaiKhoan());
			cmd.executeUpdate();
			cmd.close();
			cs.cn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
