package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Products;
import model.bo.CategoryBO;
import model.bo.ProductsBO;

public class HomeProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeProductsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		ProductsBO p = new ProductsBO();
		CategoryBO c = new CategoryBO();
		String idLoaiSp = request.getParameter("id_category"); // mĂ£ loáº¡i sáº£n pháº©m
		String search = request.getParameter("search"); // tĂ¬m kiáº¿m theo tĂªn ngÆ°á»�i dĂ¹ng nháº­p
		String key = request.getParameter("key");
		ArrayList<Products> lstP=null;
		lstP = p.getListProducts();
		if (idLoaiSp != null) {
			lstP = p.getProductsByCategory(idLoaiSp);
		}
		if (search != null) {
			lstP = p.getProductsByName(key);
		}
		request.setAttribute("lstProducts", lstP);
		request.setAttribute("lstCategory", c.getListCategory());
		RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
		rd.forward(request, response);		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
