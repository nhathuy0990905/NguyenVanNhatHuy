package model.bo;

import java.util.ArrayList;

import model.bean.Bills;
import model.dao.BillsDAO;

public class BillsBO {
	BillsDAO s = new BillsDAO();

	public ArrayList<Bills> getToanBoBill() {
		return s.getToanBoBill();

	}

	public ArrayList<Bills> getSelectDatHang_Ship() {
		return s.getSelectDatHang_Ship();

	}

	// Danh sách hóa đơn đặt hàng
	public ArrayList<Bills> getSelectDatHang() {
		return s.getSelectDatHang();

	}

	// Danh sách hóa đơn đang ship
	public ArrayList<Bills> getSelectDangShip() {
		return s.getSelectDangShip();

	}

	// Danh sách hóa đơn đã hủy
	public ArrayList<Bills> getSelectDestroy() {
		return s.getSelectDestroy();

	}

	// Danh sách hóa đơn đã thanh toán
	public ArrayList<Bills> getSelectPayment() {
		return s.getSelectPayment();

	}

	// Phương thức sửa ghi chú
	public boolean editNoteBills(String ghichu, long id) {
		return s.editNoteBills(ghichu, id);
	}

	// lấy ra 1 thồn tin bills
	public Bills getBillsById(long id) throws Exception {
		return s.getBillsById(id);
	}

	// Phương thức sửa trạng thái hóa đơn
	public boolean editStatusBills(int trangthai, long id) {
		return s.editStatusBills(trangthai, id);
	}

	// Phương thức lấy dữ liệu về
	public String[] SelectDB30Days(String last30Days, String now) {
		return s.SelectDB30Days(last30Days, now);
	}
}
