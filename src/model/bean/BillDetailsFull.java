package model.bean;

public class BillDetailsFull {
	long id;
	long id_hoadon;
	long id_sanpham;
	double giagoc;
	int soluong;
	int khuyenmai;
	String anhchinh;
	String tensanpham;

	public BillDetailsFull() {
		super();
	}

	public BillDetailsFull(long id, long id_hoadon, long id_sanpham, double giagoc, int soluong, int khuyenmai, String anhchinh, String tensanpham) {
		super();
		this.id = id;
		this.id_hoadon = id_hoadon;
		this.id_sanpham = id_sanpham;
		this.giagoc = giagoc;
		this.soluong = soluong;
		this.khuyenmai = khuyenmai;
		this.anhchinh = anhchinh;
		this.tensanpham = tensanpham;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getId_hoadon() {
		return id_hoadon;
	}

	public void setId_hoadon(long id_hoadon) {
		this.id_hoadon = id_hoadon;
	}

	public long getId_sanpham() {
		return id_sanpham;
	}

	public void setId_sanpham(long id_sanpham) {
		this.id_sanpham = id_sanpham;
	}

	public double getGiagoc() {
		return giagoc;
	}

	public void setGiagoc(double giagoc) {
		this.giagoc = giagoc;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public int getKhuyenmai() {
		return khuyenmai;
	}

	public void setKhuyenmai(int khuyenmai) {
		this.khuyenmai = khuyenmai;
	}

	public String getAnhchinh() {
		return anhchinh;
	}

	public void setAnhchinh(String anhchinh) {
		this.anhchinh = anhchinh;
	}

	public String getTensanpham() {
		return tensanpham;
	}

	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}

}
