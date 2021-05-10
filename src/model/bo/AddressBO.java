package model.bo;

import java.util.ArrayList;

import model.bean.Quan_Huyen;
import model.bean.Tinh_ThanhPho;
import model.bean.Xa_Phuong;
import model.dao.AddressDAO;

public class AddressBO {

	AddressDAO s = new AddressDAO();
	
	public ArrayList<Tinh_ThanhPho> getTinhThanhPho(){
		return s.getTinhThanhPho();
	}
	
	public ArrayList<Quan_Huyen> getQuanHuyenById(long idTinhTP) {
		return s.getQuanHuyenById(idTinhTP);
	}

	public ArrayList<Xa_Phuong> getXaPhuongById(long idQuanHuyen){
		return s.getXaPhuongById(idQuanHuyen);
	}

}
