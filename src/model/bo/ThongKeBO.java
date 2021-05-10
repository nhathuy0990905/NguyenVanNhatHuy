package model.bo;

import java.util.ArrayList;

import model.bean.ThongKes;
import model.dao.ThongKeDAO;

public class ThongKeBO {
	ThongKeDAO s = new ThongKeDAO();
	// hàm get hiển thị ra sản phẩm giao diện Trang chủ và Quản lý
			public ArrayList<ThongKes> getThongKe(String tungay, String denngay) {
				return s.getThongKe(tungay, denngay);
			}

}
