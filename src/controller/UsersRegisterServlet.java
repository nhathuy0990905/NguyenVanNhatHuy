package controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Users;
import model.bo.UsersBO;

public class UsersRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UsersRegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		UsersBO s = new UsersBO();
		String userName = request.getParameter("user-name");
		String email = request.getParameter("user-email");
		if (!s.checkAccount(userName, email)) {
			Users users = new Users();
			users.setTenTaiKhoan(request.getParameter("user-name"));
			users.setEmail(request.getParameter("user-email"));
			users.setAnhChinh("avatar.png");
			users.setMatKhau(request.getParameter("user-password"));
			users.setPhanQuyen("O");
			users.setTenHienThi(request.getParameter("user-showname"));
			String mes = "";
			try {
				if (s.addAccount(users)) {
					mes = "Đăng ký tài khoản thành công.Vui lòng đăng nhập.";
					session.setAttribute("SingupSuccess", mes);
					response.sendRedirect("login.jsp");
				} else {
					mes = "Lỗi!";
					session.setAttribute("SingupError", mes);
					response.sendRedirect("register.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else	{
			String mes = "Tài khoản hoặc email đã tồn tại!";
			session.setAttribute("AcccExists", mes);
			response.sendRedirect("register.jsp");
		}

	}

}
