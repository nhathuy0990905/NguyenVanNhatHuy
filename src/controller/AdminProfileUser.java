package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Bills;
import model.bean.Users;
import model.bo.BillsBO;
import model.bo.UsersBO;

public class AdminProfileUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminProfileUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		long id = Long.parseLong(request.getParameter("id"));
		UsersBO users = new UsersBO();
		Users info= new Users() ;
		info = users.getUsersById(id);
		request.setAttribute("info", info);
		RequestDispatcher rd = request.getRequestDispatcher("admin\\pages\\profile\\profile.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
