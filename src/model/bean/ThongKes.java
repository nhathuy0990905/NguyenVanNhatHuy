package model.bean;

public class ThongKes {
	long id;
	long tongTien;
	String hoTen;
	String soNhan;
	String diaChi;
	String dienThoai;
	String email;
	String ngayDat;

	public ThongKes() {
		super(); 
	}

	public ThongKes(long id, long tongTien, String hoTen, String soNhan, String diaChi, String dienThoai, String email,
			String ngayDat) {
		super();
		this.id = id;
		this.tongTien = tongTien;
		this.hoTen = hoTen;
		this.soNhan = soNhan;
		this.diaChi = diaChi;
		this.dienThoai = dienThoai;
		this.email = email;
		this.ngayDat = ngayDat;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getTongTien() {
		return tongTien;
	}

	public void setTongTien(long tongTien) {
		this.tongTien = tongTien;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getSoNhan() {
		return soNhan;
	}

	public void setSoNhan(String soNhan) {
		this.soNhan = soNhan;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getDienThoai() {
		return dienThoai;
	}

	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNgayDat() {
		return ngayDat;
	}

	public void setNgayDat(String ngayDat) {
		this.ngayDat = ngayDat;
	}



}
