package model.bean;

public class BillsDetail {

	private long id;
	private long id_hoaDon;
	private long id_sanPham;
	private int soLuong;
	
	public BillsDetail() {
		super();
	}

	public BillsDetail(long id, long id_hoaDon, long id_sanPham, int soLuong) {
		super();
		this.id = id;
		this.id_hoaDon = id_hoaDon;
		this.id_sanPham = id_sanPham;
		this.soLuong = soLuong;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getId_hoaDon() {
		return id_hoaDon;
	}

	public void setId_hoaDon(long id_hoaDon) {
		this.id_hoaDon = id_hoaDon;
	}

	public long getId_sanPham() {
		return id_sanPham;
	}

	public void setId_sanPham(long id_sanPham) {
		this.id_sanPham = id_sanPham;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

}
