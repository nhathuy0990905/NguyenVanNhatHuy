package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import model.bean.Bills;
import model.bean.BillsDetail;
import model.bean.Items;

public class CartDAO {
	private HashMap<Long, Items> cartItems;

	public HashMap<Long, Items> getCartItems() {
		return cartItems;
	}

	public void setCartItems(HashMap<Long, Items> cartItems) {
		this.cartItems = cartItems;
	}

	public CartDAO(){
		cartItems = new HashMap<Long, Items>();
	}

	public CartDAO(HashMap<Long, Items> cartItems) { 
		this.cartItems = cartItems;
	}

	//	Phương thức thêm vào giỏ hàng
	public void insertToCart(Long key, Items item) {
		boolean check = cartItems.containsKey(key);
		//	Sản phẩm tồn tại thì số lượng +1, không thì thêm mới
		if(check) {
			int quantity_old = item.getQuantity();
			item.setQuantity(quantity_old+1);
			cartItems.put(key, item);
		}
		else {
			cartItems.put(key, item);
		}
	}
	//	Phương thức sửa số lượng giỏ hàng
	public void updateToCart(Long key, int quantity, Items item) {
		boolean check = cartItems.containsKey(key);
		//	Sản phẩm tồn tại thì số lượng củ cộng số lượng mới 
		if(check) {
			int quantity_old = item.getQuantity();
			item.setQuantity(quantity);
			cartItems.put(key, item);
		} 
	}

	//	Phương thức xóa giỏ hàng
	public void removeToCart(Long key) {
		boolean check = cartItems.containsKey(key);
		// Nếu tồn tại theo id thì xóa bỏ
		if(check) {
			cartItems.remove(key);
		}
	}
	//	Phương thức đếm số lượng
	public int countItems() {
		// Trả về số lượng phẩm phẩm trong giỏ hàng
		return cartItems.size();
	}

	DecimalFormat numformat = new DecimalFormat("#,###,###");
	// Tổng giá tiền
	public String totalCart() { 
		double count = 0;
		for (Map.Entry<Long, Items> list : cartItems.entrySet()) {
			double cost = list.getValue().getProducts().getGiaGoc();
			int discount = list.getValue().getProducts().getKhuyenMai(); 
			double total = cost -(cost*discount)/100; 
			count += total * list.getValue().getQuantity(); 
		}
		String price_nb = numformat.format(count);
		return price_nb;
	} 
	//	Phần cho hóa đơn
	//	Phương thức thêm một hóa đơn mới

	public boolean addBill(Bills bill) throws Exception {
		DBConnect cs = new DBConnect();
		cs.KetNoi();
		String sql = "INSERT INTO hoadon VALUES (?,?,?,?,?,?,?,?) ";
		PreparedStatement pst = null;
		try { 
			pst = cs.cn.prepareCall(sql); 
			pst.setString(1, bill.getHoTen()); 
			pst.setString(2, bill.getSoNha()); 
			pst.setString(3, bill.getDiaChi()); 
			pst.setString(4, bill.getSoDienThoai()); 
			pst.setString(5, bill.getEmail()); 
			pst.setString(6, bill.getGhiChu()); 
			pst.setInt(7, bill.getTrangThai()); 
			pst.setString(8, bill.getNgayDat().toString());  
			pst.executeUpdate();
			cs.cn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.cn.close();
		return false;
	}
	// Phương thức lấy dữ liệu hóa đơn về
	public ArrayList<Bills> selectBills() throws Exception {
		DBConnect cs = new DBConnect();
		cs.KetNoi();

		ArrayList<Bills> list = new ArrayList<Bills>();
		try {
			String sql = "SELECT * FROM hoadon";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {

				Bills bill= new Bills();
				bill.setId(rs.getLong("id")); 
				bill.setDiaChi(rs.getString("diachi"));
				bill.setSoDienThoai(rs.getString("dienthoai"));
				bill.setEmail(rs.getString("email"));
				bill.setGhiChu(rs.getString("ghichu"));
				bill.setHoTen(rs.getString("hoten"));
				bill.setNgayDat(rs.getString("ngaydat"));
				bill.setSoNha(rs.getString("sonha"));
				bill.setTrangThai(rs.getInt("trangthai"));

				list.add(bill);
			}

			rs.close();
			cs.cn.close();
			return list;
		} catch (SQLException e) {
			// Đóng kết nối	
			cs.cn.close();
			e.printStackTrace();
		}
		return null;
	}
	// Phương thức thêm dữ liệu cho chi tiết hóa đơn
	public boolean addBillDetail(BillsDetail billdetail) throws Exception {
		DBConnect cs = new DBConnect();
		cs.KetNoi();
		String sql = "INSERT INTO chitiethoadon(soluong,id_hoadon,id_sanpham) VALUES (?,?,?)";	
		try { 
			PreparedStatement cmd = cs.cn.prepareStatement(sql);			
			cmd.setInt(1, billdetail.getSoLuong()); 
			cmd.setLong(2, billdetail.getId_hoaDon()); 
			cmd.setLong(3, billdetail.getId_sanPham());   
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cs.cn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.cn.close();
		return false;
	}

}
