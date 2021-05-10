package model.bean;

public class Xa_Phuong {
	private long id;
	private long code;
	private long id_quanHuyen;
	private String ten;
	private String tenKhongDau;
	private String tenDayDu;
	private String donVi;
	private String tenThuong;
	private String tenHanhChinh;

	public Xa_Phuong() {
		super();
	}


	public Xa_Phuong(long id, long code, long id_quanHuyen, String ten, String tenKhongDau, String tenDayDu,
			String donVi, String tenThuong, String tenHanhChinh) {
		super();
		this.id = id;
		this.code = code;
		this.id_quanHuyen = id_quanHuyen;
		this.ten = ten;
		this.tenKhongDau = tenKhongDau;
		this.tenDayDu = tenDayDu;
		this.donVi = donVi;
		this.tenThuong = tenThuong;
		this.tenHanhChinh = tenHanhChinh;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getCode() {
		return code;
	}

	public void setCode(long code) {
		this.code = code;
	}

	public long getId_quanHuyen() {
		return id_quanHuyen;
	}

	public void setId_quanHuyen(long id_quanHuyen) {
		this.id_quanHuyen = id_quanHuyen;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getTenKhongDau() {
		return tenKhongDau;
	}

	public void setTenKhongDau(String tenKhongDau) {
		this.tenKhongDau = tenKhongDau;
	}

	public String getTenDayDu() {
		return tenDayDu;
	}

	public void setTenDayDu(String tenDayDu) {
		this.tenDayDu = tenDayDu;
	}

	public String getDonVi() {
		return donVi;
	}

	public void setDonVi(String donVi) {
		this.donVi = donVi;
	}

	public String getTenThuong() {
		return tenThuong;
	}

	public void setTenThuong(String tenThuong) {
		this.tenThuong = tenThuong;
	}

	public String getTenHanhChinh() {
		return tenHanhChinh;
	}

	public void setTenHanhChinh(String tenHanhChinh) {
		this.tenHanhChinh = tenHanhChinh;
	}

}
