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

public class AdminAddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminAddCategory() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\category\\add.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Category category = new Category();
		category.setTenLoaiSanPham(request.getParameter("tenloai"));
		CategoryBO categoryControl = new CategoryBO();
		boolean check = categoryControl.addCategory(category);
		if(check==true) {
			HttpSession session = request.getSession();
			session.setAttribute("Add", "Success");
			session.setMaxInactiveInterval(15);
			response.sendRedirect("AdminListCategory");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminListCategory");
		dispatcher.forward(request, response);
		
		
	}

}
