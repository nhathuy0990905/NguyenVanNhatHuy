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

public class AdminEditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditCategory() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryBO categoryControl = new CategoryBO();
		Category category = new Category();

		String id = request.getParameter("id");

		category = categoryControl.getCategoryByID(Long.parseLong(id));
		request.setAttribute("category", category);

		RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\category\\edit.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String id = request.getParameter("id");
		String tenloai = request.getParameter("tenloai");

		Category category = new Category();
		category.setId(Long.parseLong(id));
		category.setTenLoaiSanPham(tenloai);

		CategoryBO categoryControl = new CategoryBO();

		boolean check = categoryControl.editCategory(category);
		if (check) {
			HttpSession session = request.getSession();
			session.setAttribute("Edit", "Success");
			session.setMaxInactiveInterval(15);
			response.sendRedirect("AdminListCategory");
		} else {

		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminListCategory");
		dispatcher.forward(request, response);
	}

}
