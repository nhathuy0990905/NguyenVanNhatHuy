package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.BillDetailsFull;
import model.bo.BillDetailBO;

public class AdminListBillsDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminListBillsDetail() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idHoaDon = request.getParameter("idHoaDon");
		String huy = request.getParameter("huy");
		String thanhtoan = request.getParameter("thanhtoan");
		
		/* check session đăng nhập */
		HttpSession session = request.getSession();
		if (session.getAttribute("uslogin") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		/* kết thúc check session đăng nhập */
		
		ArrayList<BillDetailsFull> list = new BillDetailBO().getBillDetailFullById(Long.parseLong(idHoaDon));
		request.setAttribute("list", list);
		request.setAttribute("idHoaDon", idHoaDon);

		if (huy == null && thanhtoan == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\bill\\viewdetail.jsp");
			dispatcher.forward(request, response);
		} else {
			if (huy == null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\bill\\viewdetailpayment.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\bill\\viewdetaildestroy.jsp");
				dispatcher.forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doGet(request, response);
	}

}
