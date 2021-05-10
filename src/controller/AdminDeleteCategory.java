package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Category;
import model.bo.CategoryBO;

public class AdminDeleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDeleteCategory() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		long id = Long.parseLong(request.getParameter("id"));
		CategoryBO category = new CategoryBO();
		category.deleteCategory(id);
		HttpSession session = request.getSession();
		session.setAttribute("Delete", "Success");
		session.setMaxInactiveInterval(15);
		RequestDispatcher rd = request.getRequestDispatcher("AdminListCategory");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
