package model.bean;

public class Bills {

	private long id;
	private String hoTen;
	private String soNha;
	private String diaChi;
	private String soDienThoai;
	private String email;
	private String ghiChu;
	private String ngayDat;
	private int trangThai;
	
	public Bills() {
		super();
	}

	public Bills(long id, String hoTen, String soNha, String diaChi, String soDienThoai, String email, String ghiChu,
			String ngayDat, int trangThai) {
		super();
		this.id = id;
		this.hoTen = hoTen;
		this.soNha = soNha;
		this.diaChi = diaChi;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.ghiChu = ghiChu;
		this.ngayDat = ngayDat;
		this.trangThai = trangThai;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getSoNha() {
		return soNha;
	}

	public void setSoNha(String soNha) {
		this.soNha = soNha;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public String getNgayDat() {
		return ngayDat;
	}

	public void setNgayDat(String ngayDat) {
		this.ngayDat = ngayDat;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

}
