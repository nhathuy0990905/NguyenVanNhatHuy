package model.bean;

public class Products {
	private long id;
	private long id_loaiSanPham;
	private String tenSanPham;
	private String moTa;
	private String anhChinh;
	private double giaGoc;
	private int khuyenMai;
	private int luotThich;
	private int tinhTrang;

	public Products(long id, long id_loaiSanPham, String tenSanPham, String moTa, String anhChinh, double giaGoc, int khuyenMai, int luotThich, int tinhTrang) {
		super();
		this.id = id;
		this.id_loaiSanPham = id_loaiSanPham;
		this.tenSanPham = tenSanPham;
		this.moTa = moTa;
		this.anhChinh = anhChinh;
		this.giaGoc = giaGoc;
		this.khuyenMai = khuyenMai;
		this.luotThich = luotThich;
		this.tinhTrang = tinhTrang;
	}

	public Products() {
		super();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getId_loaiSanPham() {
		return id_loaiSanPham;
	}

	public void setId_loaiSanPham(long id_loaiSanPham) {
		this.id_loaiSanPham = id_loaiSanPham;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getAnhChinh() {
		return anhChinh;
	}

	public void setAnhChinh(String anhChinh) {
		this.anhChinh = anhChinh;
	}

	public double getGiaGoc() {
		return giaGoc;
	}

	public void setGiaGoc(double giaGoc) {
		this.giaGoc = giaGoc;
	}

	public int getKhuyenMai() {
		return khuyenMai;
	}

	public void setKhuyenMai(int khuyenMai) {
		this.khuyenMai = khuyenMai;
	}

	public int getLuotThich() {
		return luotThich;
	}

	public void setLuotThich(int luotThich) {
		this.luotThich = luotThich;
	}

	public int getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(int tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

}
