package controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.BillsBO;
import model.bo.ProductsBO;
import model.bo.UsersBO;

public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Admin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		long countDatHang = new BillsBO().getSelectDatHang().size();
		request.setAttribute("countDatHang", countDatHang);
		long countDangShip = new BillsBO().getSelectDangShip().size();
		request.setAttribute("countDangShip", countDangShip);
		long sumUser = new UsersBO().getListUsers().size();
		request.setAttribute("sumUser", sumUser);
		long sumProduct = new ProductsBO().getListProducts().size();
		request.setAttribute("sumProduct", sumProduct);

		HttpSession session = request.getSession();

		if (session.getAttribute("uslogin") != null) {
			if (session.getAttribute("admin") != null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("AdminListBills");
				dispatcher.forward(request, response);
			} else {
				response.sendRedirect("login.jsp");
			}
		} else {
			response.sendRedirect("login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



