package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.UsersBO;

public class AdminEditPasswordUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminEditPasswordUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String password = request.getParameter("password");
		long id = Long.parseLong(request.getParameter("id"));
		UsersBO s = new UsersBO();
		try {
			s.editPasswordAccount(password, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
