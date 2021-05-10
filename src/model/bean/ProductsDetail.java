package model.bean;

public class ProductsDetail {

	private long id;
	private long id_sanPham;
	private String anhChiTiet;

	public ProductsDetail() {
		super();
	}

	public ProductsDetail(long id, long id_sanPham, String anhChiTiet) {
		super();
		this.id = id;
		this.id_sanPham = id_sanPham;
		this.anhChiTiet = anhChiTiet;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getId_sanPham() {
		return id_sanPham;
	}

	public void setId_sanPham(long id_sanPham) {
		this.id_sanPham = id_sanPham;
	}

	public String getAnhChiTiet() {
		return anhChiTiet;
	}

	public void setAnhChiTiet(String anhChiTiet) {
		this.anhChiTiet = anhChiTiet;
	}
	
}
