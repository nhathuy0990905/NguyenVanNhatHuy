package model.bean;

public class Users {
	private long id;
	private String tenHienThi;
	private String anhChinh;
	private String tenTaiKhoan;
	private String matKhau;
	private String phanQuyen;
	private String email;

	public Users(long id, String tenHienThi, String anhChinh, String tenTaiKhoan, String matKhau, String phanQuyen,
			String email) {
		super();
		this.id = id;
		this.tenHienThi = tenHienThi;
		this.anhChinh = anhChinh;
		this.tenTaiKhoan = tenTaiKhoan;
		this.matKhau = matKhau;
		this.phanQuyen = phanQuyen;
		this.email = email;
	}

	public Users() {
		super();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTenHienThi() {
		return tenHienThi;
	}

	public void setTenHienThi(String tenHienThi) {
		this.tenHienThi = tenHienThi;
	}

	public String getAnhChinh() {
		return anhChinh;
	}

	public void setAnhChinh(String anhChinh) {
		this.anhChinh = anhChinh;
	}

	public String getTenTaiKhoan() {
		return tenTaiKhoan;
	}

	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getPhanQuyen() {
		return phanQuyen;
	}

	public void setPhanQuyen(String phanQuyen) {
		this.phanQuyen = phanQuyen;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
