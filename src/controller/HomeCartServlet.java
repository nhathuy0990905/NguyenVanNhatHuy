package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Items;
import model.bean.Products;
import model.bo.ProductsBO;
import model.dao.CartDAO;

public class HomeCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeCartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		
		ProductsBO p = new ProductsBO();
		HttpSession session = request.getSession();
		String status = request.getParameter("status");
		String id_product = request.getParameter("id_product");
		String quantity_string = request.getParameter("quantity");

		CartDAO cart = (CartDAO) session.getAttribute("cart");

		try {
			Long idProduct = Long.parseLong(id_product); // Chuyển mã từ request kiểu string sang long
			// Lấy ra thông tin của sản phẩm từ db theo mã sản phẩm
			Products product = p.getProductsByID(idProduct);
			// Viết menu xử lý các trạng thái
			switch (status) {
			case "add":
				if (cart.getCartItems().containsKey(idProduct)) {
					cart.insertToCart(idProduct, new Items(product, cart.getCartItems().get(idProduct).getQuantity()));
				} else {
					cart.insertToCart(idProduct, new Items(product, 1));
				}
				break;
			case "remove":
				cart.removeToCart(idProduct);
				break;
			case "edit":
				int quantity = Integer.parseInt(quantity_string);
				cart.updateToCart(idProduct, quantity,
						new Items(product, cart.getCartItems().get(idProduct).getQuantity()));
				break;
			default:
				break;
			}

		} catch (Exception e) {
			e.printStackTrace();
			
		}
		session.setAttribute("cart", cart);
		response.sendRedirect(request.getHeader("referer"));
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		
		doGet(request, response);
	}

}
