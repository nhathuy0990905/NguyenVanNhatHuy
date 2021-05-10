package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Quan_Huyen;
import model.bean.Xa_Phuong;
import model.bo.AddressBO;

public class HomeCheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeCheckoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		AddressBO a = new AddressBO();	
		String id_city=request.getParameter("id_tinh_thanhpho");
		String id_dictricst = request.getParameter("id_quan_huyen");
		String status = request.getParameter("status");
		switch (status) {
		case "district":
			if(id_city != null) {
				Long idCity = Long.parseLong(id_city); 
				String textdictics = "<select id=\"iddistrict\" required onchange=\"load_town_ward(this.value);\" name=\"district\"> <option value=\"\"></option>"; 
				for (Quan_Huyen ls : a.getQuanHuyenById(idCity)) {
					textdictics += "<option value=\""+ls.getId()+"\">"+ls.getTendaydu()+"</option>";
				}
				textdictics += "</select>"; 
				response.getWriter().println(textdictics);  
			}
			break;
		case "town_ward":
			if(id_dictricst != null) {
				Long idDictricst = Long.parseLong(id_dictricst); 
				String text_town_ward = "<select id=\"idtown_ward\" required onchange=\"showship();\" name=\"town_ward\"> <option value=\"\"></option>";
				for (Xa_Phuong ls : a.getXaPhuongById(idDictricst)) {
					text_town_ward += "<option value=\""+ls.getTenHanhChinh()+"\">"+ls.getTenDayDu()+"</option>";
				}
				text_town_ward += "</select>"; 
				response.getWriter().println(text_town_ward);  
			}
			break;
		default:
			break;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
