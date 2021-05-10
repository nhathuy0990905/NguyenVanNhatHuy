package model.bean;

public class Quan_Huyen {
	private long id;
	private long code;
	private long id_tinhthanhpho;
	private String ten;
	private String tenkhongdau;
	private String tendaydu;
	private String donvi;
	private String tenthuong;
	private String tenhanhchinh;

	public Quan_Huyen(long id, long code, long id_tinhthanhpho, String ten, String tenkhongdau, String tendaydu,
			String donvi, String tenthuong, String tenhanhchinh) {
		super();
		this.id = id;
		this.code = code;
		this.id_tinhthanhpho = id_tinhthanhpho;
		this.ten = ten;
		this.tenkhongdau = tenkhongdau;
		this.tendaydu = tendaydu;
		this.donvi = donvi;
		this.tenthuong = tenthuong;
		this.tenhanhchinh = tenhanhchinh;
	}

	public Quan_Huyen() {
		super();
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

	public long getId_tinhthanhpho() {
		return id_tinhthanhpho;
	}

	public void setId_tinhthanhpho(long id_tinhthanhpho) {
		this.id_tinhthanhpho = id_tinhthanhpho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getTenkhongdau() {
		return tenkhongdau;
	}

	public void setTenkhongdau(String tenkhongdau) {
		this.tenkhongdau = tenkhongdau;
	}

	public String getTendaydu() {
		return tendaydu;
	}

	public void setTendaydu(String tendaydu) {
		this.tendaydu = tendaydu;
	}

	public String getDonvi() {
		return donvi;
	}

	public void setDonvi(String donvi) {
		this.donvi = donvi;
	}

	public String getTenthuong() {
		return tenthuong;
	}

	public void setTenthuong(String tenthuong) {
		this.tenthuong = tenthuong;
	}

	public String getTenhanhchinh() {
		return tenhanhchinh;
	}

	public void setTenhanhchinh(String tenhanhchinh) {
		this.tenhanhchinh = tenhanhchinh;
	}

}
