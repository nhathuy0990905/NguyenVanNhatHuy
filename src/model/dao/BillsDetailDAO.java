package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.bean.BillDetailsFull;
import model.bean.Products;

public class BillsDetailDAO {

	// get chi tiết hóa đơn theo mã hóa đơn

	public ArrayList<BillDetailsFull> getBillDetailFullById(long idHoaDon) {
		DBConnect cs = new DBConnect();
		ArrayList<BillDetailsFull> list = new ArrayList<BillDetailsFull>();
		try {
			cs.KetNoi();
			String sql = "  SELECT chitiethoadon.id,soluong,id_hoadon,id_sanpham,tensanpham, giagoc,khuyenmai,anhchinh FROM sanpham, chitiethoadon WHERE"
					+ " sanpham.id = chitiethoadon.id_sanpham AND id_hoadon = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, idHoaDon);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				BillDetailsFull billDetail = new BillDetailsFull();
				billDetail.setId(rs.getLong("id"));
				billDetail.setId_hoadon(rs.getLong("id_hoadon"));
				billDetail.setId_sanpham(rs.getLong("id_sanpham"));
				billDetail.setTensanpham(rs.getString("tensanpham"));
				billDetail.setGiagoc(rs.getDouble("giagoc"));
				billDetail.setSoluong(rs.getInt("soluong"));
				billDetail.setKhuyenmai(rs.getInt("khuyenmai"));
				billDetail.setAnhchinh(rs.getString("anhchinh"));
				list.add(billDetail);
			}
			
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

}
