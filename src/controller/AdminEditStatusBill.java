package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Bills;
import model.bo.BillsBO;

public class AdminEditStatusBill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditStatusBill() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		long id = Long.parseLong(request.getParameter("id"));
		int trangthai = Integer.parseInt(request.getParameter("trangthai"));
		BillsBO b = new BillsBO();

		if (b.editStatusBills(trangthai, id)) {
			ArrayList<Bills> data = b.getSelectPayment();
			response.getWriter().append(data.toString());
		} else
			response.getWriter().append("0");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doGet(request, response);
	}

}
