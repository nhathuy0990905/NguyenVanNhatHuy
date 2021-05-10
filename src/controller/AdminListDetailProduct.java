package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Products;
import model.bean.ProductsDetail;
import model.bo.ProductDetailBO;
import model.bo.ProductsBO;

public class AdminListDetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminListDetailProduct() {
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
		long id =  Long.parseLong(request.getParameter("id"));
		ProductDetailBO productDetail = new ProductDetailBO();
		ProductsBO product = new ProductsBO();
		ArrayList<ProductsDetail> lstPd;
		Products p = product.getProductsByID(id);;
		lstPd = productDetail.getProductDetailByProductID(id);		
		request.setAttribute("lstProductDetail", lstPd);
		request.setAttribute("product", p);
		RequestDispatcher rd = request.getRequestDispatcher("admin\\pages\\detailproduct\\list.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
