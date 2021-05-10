package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.ThongKes;

public class ThongKeDAO {
	
	// hàm get hiển thị ra sản phẩm giao diện Trang chủ và Quản lý
		public ArrayList<ThongKes> getThongKe(String tungay, String denngay) {
			DBConnect cs = new DBConnect();
			ArrayList<ThongKes> lst = new ArrayList<ThongKes>();
			try {
				cs.KetNoi();
				String sql = "SELECT hoadon.id, hoten, sonha,diachi, dienthoai, email,"
						+ " ROUND(SUM(chitiethoadon.soluong * sanpham.giagoc - chitiethoadon.soluong * sanpham.giagoc * sanpham.khuyenmai/100), -3) "
						+ "AS tongtien, ngaydat FROM sanpham, hoadon, chitiethoadon "
						+ "WHERE sanpham.id = chitiethoadon.id_sanpham AND chitiethoadon.id_hoadon = hoadon.id AND trangthai = 2 AND ngaydat "
						+ "BETWEEN '"+tungay+"' AND '" +denngay+ "' GROUP BY ngaydat,hoadon.id, hoten, sonha,diachi, dienthoai, email ORDER BY ngaydat";
				PreparedStatement cmd = cs.cn.prepareStatement(sql);
				
				ResultSet rs = cmd.executeQuery();
				while (rs.next()) {
					
					 ThongKes thongKes = new ThongKes();
					thongKes.setId(rs.getLong("id"));
					thongKes.setDiaChi(rs.getString("diachi"));
					thongKes.setSoNhan(rs.getString("sonha"));
					thongKes.setHoTen(rs.getString("hoten"));
					thongKes.setEmail(rs.getString("email"));
					thongKes.setDienThoai(rs.getString("dienthoai"));
					thongKes.setTongTien(rs.getLong("tongtien"));
					thongKes.setNgayDat(rs.getString("ngaydat"));
					
					lst.add(thongKes);
				}
				
				rs.close();
				cs.cn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return lst;
		}
}



