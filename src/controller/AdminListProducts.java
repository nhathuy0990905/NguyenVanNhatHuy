package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Category;
import model.bean.Products;
import model.bo.CategoryBO;
import model.bo.ProductsBO;

public class AdminListProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminListProducts() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		/* check session đăng nhập */
		HttpSession session = request.getSession();
		if (session.getAttribute("uslogin") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		/* kết thúc check session đăng nhập */
		ProductsBO p = new ProductsBO();
		CategoryBO c = new CategoryBO();
		ArrayList<Products> lstP;
		ArrayList<Category> lstC;
		lstP = p.getListProducts();
		lstC = c.getListCategory();
		request.setAttribute("lstProducts", lstP);
		request.setAttribute("lstCategorys", lstC);
		RequestDispatcher rd = request.getRequestDispatcher("admin\\pages\\product\\list.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doGet(request, response);
	}

}
