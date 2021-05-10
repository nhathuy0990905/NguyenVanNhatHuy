package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.ThongKes;
import model.bo.ThongKeBO;

public class AdminThongKe extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminThongKe() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ArrayList<ThongKes> list  = new ThongKeBO().getThongKe("2020/04/01", "2021/04/20");
		
		request.setAttribute("list", list);
		HttpSession session = request.getSession();
		if (session.getAttribute("uslogin") != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\thongke\\khoangthoigian.jsp");
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect("../../../pages/login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String tungay = request.getParameter("tungay");
		String denngay = request.getParameter("denngay");
		ArrayList<ThongKes> list  = new ThongKeBO().getThongKe(tungay, denngay);
		String str = "";
		str += "<table id=\"bootstrap-data-table\"\r\n" + 
				"									class=\"table table-striped table-bordered\">\r\n" + 
				"									<thead>\r\n" + 
				"										<tr>\r\n" + 
				"											<th>Id</th>\r\n" + 
				"											<th>Họ tên</th>\r\n" + 
				"											<th>Số nhà</th>\r\n" + 
				"											<th>Địa chỉ</th>\r\n" + 
				"											<th>Điện thoại</th>\r\n" + 
				"											<th>Email</th>\r\n" + 
				"											<th>Ngày đặt</th>\r\n" + 
				"											<th>Tổng tiền</th>\r\n" + 
				"										</tr>\r\n" + 
				"									</thead>\r\n" + 
				"									<tbody>";
		long tongtien = 0;
		for (ThongKes thongKes : list) {
			str += "<tr>\r\n" + 
					"											<td>"+ thongKes.getId() + "</td>\r\n" + 
					"											<td>"+ thongKes.getHoTen() + "</td>\r\n" + 
					"											<td>"+ thongKes.getSoNhan() + "</td>\r\n" + 
					"											<td>"+ thongKes.getDiaChi() + "</td>\r\n" + 
					"											<td>" + thongKes.getDienThoai() + "</td>\r\n" + 
					"											<td>" + thongKes.getEmail() + "</td>\r\n" + 
					"											<td>" + thongKes.getNgayDat() + "</td>\r\n" + 
					"											<td>" + thongKes.getTongTien() + "</td>\r\n" + 
					"										</tr>";
			tongtien += thongKes.getTongTien() ;
		}
		
		str += "</tbody></table>";
		str += "<input\r\n" + 
				"type=\"hidden\"  id=\"tong\" value=\"" + String.valueOf(tongtien) + "\">";
		response.getWriter().append(str);
	}

}
