package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.bean.Bills;

public class BillsDAO {
	/*
	 * Trạng thái hoá đơn :
	 * 	0: đặt hàng 
	 * 	1: đang ship 
	 * 	2: đã giao 
	 * 	3: đã hủy
	 */
	public ArrayList<Bills> getToanBoBill() {
		DBConnect cs = new DBConnect();
		ArrayList<Bills> lst = new ArrayList<Bills>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM HOADON";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Bills bill = new Bills();
				bill.setId(rs.getLong("id"));
				bill.setHoTen(rs.getString("hoten"));
				bill.setSoNha(rs.getString("sonha"));
				bill.setDiaChi(rs.getString("diachi"));
				bill.setSoDienThoai(rs.getString("dienthoai"));
				bill.setEmail(rs.getString("email"));
				bill.setGhiChu(rs.getString("ghichu"));
				bill.setTrangThai(rs.getInt("trangthai"));
				bill.setNgayDat(rs.getString("ngaydat"));
				lst.add(bill);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;

	}

	// đổ ra list admin hóa đơn- với trạng thái đặt hàng + ship
	public ArrayList<Bills> getSelectDatHang_Ship() {
		DBConnect cs = new DBConnect();
		ArrayList<Bills> lst = new ArrayList<Bills>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM hoadon WHERE trangthai = 0 OR trangthai = 1";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Bills bill = new Bills();
				bill.setId(rs.getLong("id"));
				bill.setHoTen(rs.getString("hoten"));
				bill.setSoNha(rs.getString("sonha"));
				bill.setDiaChi(rs.getString("diachi"));
				bill.setSoDienThoai(rs.getString("dienthoai"));
				bill.setEmail(rs.getString("email"));
				bill.setGhiChu(rs.getString("ghichu"));
				bill.setTrangThai(rs.getInt("trangthai"));
				bill.setNgayDat(rs.getString("ngaydat"));
				lst.add(bill);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	// Danh sách hóa đơn đặt hàng
	public ArrayList<Bills> getSelectDatHang() {
		DBConnect cs = new DBConnect();
		ArrayList<Bills> lst = new ArrayList<Bills>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM hoadon WHERE trangthai =0";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Bills bill = new Bills();
				bill.setId(rs.getLong("id"));
				bill.setHoTen(rs.getString("hoten"));
				bill.setSoNha(rs.getString("sonha"));
				bill.setDiaChi(rs.getString("diachi"));
				bill.setSoDienThoai(rs.getString("dienthoai"));
				bill.setEmail(rs.getString("email"));
				bill.setGhiChu(rs.getString("ghichu"));
				bill.setTrangThai(rs.getInt("trangthai"));
				bill.setNgayDat(rs.getString("ngaydat"));
				lst.add(bill);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	// Danh sách hóa đơn đang ship
	public ArrayList<Bills> getSelectDangShip() {
		DBConnect cs = new DBConnect();
		ArrayList<Bills> lst = new ArrayList<Bills>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM hoadon WHERE trangthai = 1";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Bills bill = new Bills();
				bill.setId(rs.getLong("id"));
				bill.setHoTen(rs.getString("hoten"));
				bill.setSoNha(rs.getString("sonha"));
				bill.setDiaChi(rs.getString("diachi"));
				bill.setSoDienThoai(rs.getString("dienthoai"));
				bill.setEmail(rs.getString("email"));
				bill.setGhiChu(rs.getString("ghichu"));
				bill.setTrangThai(rs.getInt("trangthai"));
				bill.setNgayDat(rs.getString("ngaydat"));
				lst.add(bill);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	// Danh sách hóa đơn đã hủy
	public ArrayList<Bills> getSelectDestroy() {
		DBConnect cs = new DBConnect();
		ArrayList<Bills> lst = new ArrayList<Bills>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM hoadon WHERE trangthai = 3";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Bills bill = new Bills();
				bill.setId(rs.getLong("id"));
				bill.setHoTen(rs.getString("hoten"));
				bill.setSoNha(rs.getString("sonha"));
				bill.setDiaChi(rs.getString("diachi"));
				bill.setSoDienThoai(rs.getString("dienthoai"));
				bill.setEmail(rs.getString("email"));
				bill.setGhiChu(rs.getString("ghichu"));
				bill.setTrangThai(rs.getInt("trangthai"));
				bill.setNgayDat(rs.getString("ngaydat"));
				lst.add(bill);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	// Danh sách hóa đơn đã thanh toán
	public ArrayList<Bills> getSelectPayment() {
		DBConnect cs = new DBConnect();
		ArrayList<Bills> lst = new ArrayList<Bills>();
		try {
			cs.KetNoi();
			String sql = " SELECT * FROM hoadon WHERE trangthai = 2";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Bills bill = new Bills();
				bill.setId(rs.getLong("id"));
				bill.setHoTen(rs.getString("hoten"));
				bill.setSoNha(rs.getString("sonha"));
				bill.setDiaChi(rs.getString("diachi"));
				bill.setSoDienThoai(rs.getString("dienthoai"));
				bill.setEmail(rs.getString("email"));
				bill.setGhiChu(rs.getString("ghichu"));
				bill.setTrangThai(rs.getInt("trangthai"));
				bill.setNgayDat(rs.getString("ngaydat"));
				lst.add(bill);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	public boolean getAddData(Bills bill) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	// Phương thức sửa ghi chú
	public boolean editNoteBills(String ghichu, long id) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "UPDATE hoadon SET ghichu = ? WHERE id = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, ghichu);
			cmd.setLong(2, id);
			cmd.executeUpdate();
			cmd.close();
			cs.cn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Phương thức sửa trạng thái hóa đơn
	public boolean editStatusBills(int trangthai, long id) {
		DBConnect cs = new DBConnect();
		try {
			cs.KetNoi();
			String sql = "UPDATE hoadon SET trangthai = ? WHERE id = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setInt(1, trangthai);
			cmd.setLong(2, id);
			cmd.executeUpdate();
			cmd.close();
			cs.cn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// lấy ra 1 thông tin bills
	public Bills getBillsById(long id) throws Exception {
		DBConnect cs = new DBConnect();
		Bills bill = new Bills();
		try {
			cs.KetNoi();
			String sql = "SELECT * FROM hoadon WHERE id =?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, id);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				
				bill = new Bills(rs.getLong("id"), rs.getString("hoten"), rs.getString("sonha"), rs.getString("diachi"),
						rs.getString("dienthoai"), rs.getString("email"), rs.getString("ghichu"),
						rs.getString("ngaydat"), rs.getInt("trangthai"));
			}
			
			cmd.close();
			cs.cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bill;
	}

	// Phương thức lấy dữ liệu về
	public String[] SelectDB30Days(String last30Days, String now) {
		DBConnect cs = new DBConnect();
		String[] arr = new String[2];
		try {
			try {
				cs.KetNoi();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String sql = "SELECT ROUND(SUM(chitiethoadon.soluong * sanpham.giagoc - chitiethoadon.soluong * sanpham.giagoc * sanpham.khuyenmai/100), -3) "
					+ "AS tongtien, ngaydat FROM hoadon, chitiethoadon, sanpham WHERE hoadon.id = chitiethoadon.id_hoadon AND"
					+ " chitiethoadon.id_sanpham = sanpham.id AND ngaydat BETWEEN '" + last30Days + "' AND '" + now
					+ "' AND hoadon.trangthai = 2 GROUP BY ngaydat ORDER BY ngaydat";
			//System.out.println(sql);
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			String valueNgay = "";
			valueNgay += "[";
			String valueTongTien = "";
			valueTongTien += "[";
			ResultSet rs = cmd.executeQuery();
			int a = 0;
			while (rs.next()) {
				valueNgay += "'" + rs.getString("ngaydat").split(" ")[0] + "', ";
				valueTongTien += rs.getString("tongtien") + ", ";

			}
			//valueNgay = valueNgay.substring(0, valueNgay.length() - 2);
			valueNgay = "10";
			valueTongTien = valueTongTien.substring(0, valueTongTien.length()- 2);
			valueNgay += "]";
			valueTongTien += "]";
			arr[0] = valueNgay;
			arr[1] = valueTongTien;
			// Đóng kết nối
			cmd.close();
			cs.cn.close();
			return arr;
		} catch (SQLException e) {
			// Đóng kết nối
			e.printStackTrace();
		}
		return null;
	}

}
