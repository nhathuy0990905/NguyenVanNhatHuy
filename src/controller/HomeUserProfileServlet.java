package controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Users;
import model.bo.UsersBO;

public class HomeUserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeUserProfileServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		RequestDispatcher rd = request.getRequestDispatcher("user-profile.jsp");
		rd.forward(request, response);
	}

	// Kiểm tra lỗi
	private String Validator(String pass) {
		// Kiểm tra tên tài khoản
		Pattern pattern;
		final String PASSWORD_PATTERN = "^[A-Za-z0-9]{3,30}$";
		pattern = Pattern.compile(PASSWORD_PATTERN);
		// Kiểm tra mật khẩu
		if (pattern.matcher(pass).matches()) {
			pass = "";
		} else {
			pass = "Mật khẩu từ 3 đến 30 kí tự bao gồm chữ và số";
		}
		return pass;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		UsersBO dao = new UsersBO();
		String user_name = request.getParameter("user-name");
		String user_view = request.getParameter("view-name");
		String user_pass = request.getParameter("password");
		long id = Long.parseLong(request.getParameter("id"));
		String mes = "";
		String pass = Validator(user_pass);
		if (pass.equals("")) {
			// mã hóa mật khẩu
			user_pass = dao.encryption(user_pass);

			Users user = new Users();
			user.setTenHienThi(user_view);
			user.setMatKhau(user_pass);
			user.setTenTaiKhoan(user_name);
			System.out.println(user_view);
			try {
				if (dao.editAccount(user)) {
					// Thay đổi lại giá trị session để hiển thị thông tin mới cập nhật
					Users us = dao.getUsersByName(user_name);
					System.out.println(us.getTenHienThi() + "vs" + us.getMatKhau());
					mes = "Cập nhật thành công thông tin tài khoản.";
					session.setAttribute("uslogin", us);
					session.setAttribute("SussecfulEditAcc", mes);
					response.sendRedirect(request.getHeader("referer"));
				} else {
					mes = "Cập nhật thất bại,vui lòng thử lại.";
					session.setAttribute("SingupError", mes);
					response.sendRedirect(request.getHeader("referer"));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			mes = "Mật khẩu từ 3 đến 30 kí tự gồm chữ và số.";
			session.setAttribute("SingupError", mes);
			response.sendRedirect(request.getHeader("referer"));
		}
	}

}
