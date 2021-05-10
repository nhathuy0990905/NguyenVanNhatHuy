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

public class HomeSearchProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeSearchProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		ProductsBO p = new ProductsBO();

		String search = request.getParameter("search"); // Tìm kiếm theo tên của người đăng nhập nhập vào ô tìm kiếm
		String key = request.getParameter("key");
		ArrayList<Products> lstP= null;

		if (search != null)
			lstP = p.getProductsByName(key);

		request.setAttribute("lstProducts", lstP);
		RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doGet(request, response);
	}

}
