package model.bo;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import model.bean.Users;
import model.dao.UsersDAO;

public class UsersBO {

	UsersDAO s = new UsersDAO();

	/*------------ PHƯƠNG THỨC CHO NGƯỜI DÙNG ------------------*/
	
	// Phương thức kiểm tra đăng nhập
	public Users checkLogin(String un, String pass) {
		return s.checkLogin(un, pass);
	}

	// Phương thức thêm một tài khoản mới
	public boolean addAccount(Users user) throws Exception {
		return s.addAccount(user);
	}

	// hàm kiểm tra tài khoản & email đã tồn tại chưa
	public boolean checkAccount(String userName, String email) {
		return s.checkAccount(userName, email);
	}

	// Phương thức cập nhật thông tin tài khaonr cho người dùng/ giao diện
	// trangchủ/cá nhân
	public boolean editAccount(Users user) {
		return s.editAccount(user);
	}

	/*------------ PHƯƠNG THỨC CHO ADMIN------------------*/

	// lấy ra toàn bô tài khoản giap diện quản lý
	public ArrayList<Users> getListUsers() {
		return s.getListUsers();
	}

	// xóa tài khoản theo mã id
	public boolean deleteUser(long id) {
		return s.deleteUser(id);
	}

	// lấy ra toàn bô thông tin của tài khoản theo id
	public Users getUsersById(long id) {
		return s.getUsersById(id);
	}

	// Phương thức cập nhật tên hiển thị cho người dùng/ giao diện trang chủ/cá nhân
	public boolean editDisplayNameAccount(String displayName, long id) throws Exception {
		return s.editDisplayNameAccount(displayName, id);
	}

	// Phương thức cập nhật mật khẩu cho người dùng/ giao diện trang chủ/cá nhân
	public boolean editPasswordAccount(String matkhau, long id) throws Exception {
		return s.editPasswordAccount(matkhau, id);
	}
	
	// lấy ra toàn bô thông tin của tài khoản theo name
	public Users getUsersByName(String name) {
		return s.getUsersByName(name);
	}
	
	// Phương thức cập nhật hình ảnh cho tài khoản
	public boolean EditAvataAcount(Users user) {
		return s.EditAvataAcount(user);
	}

	// Code mã hóa mật khẩu
	public String encryption(String str) {
		byte[] defaultBytes = str.getBytes();
		try {
			MessageDigest algorithm = MessageDigest.getInstance("MD5");
			algorithm.reset();
			algorithm.update(defaultBytes);
			byte messageDigest[] = algorithm.digest();
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < messageDigest.length; i++) {
				String hex = Integer.toHexString(0xFF & messageDigest[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			str = hexString + "";
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return str;
	}
}
