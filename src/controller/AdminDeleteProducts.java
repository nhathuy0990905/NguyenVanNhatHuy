package controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Products;
import model.bo.ProductsBO;

public class AdminDeleteProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminDeleteProducts() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		ProductsBO productControl = new ProductsBO();
		Products product = productControl.getProductsByID(id);

		// Đường dẫn tuyệt đối tới thư mục gốc của web app.
		String appPath = request.getServletContext().getRealPath("");
		appPath = appPath.replace('\\', '/');

		// Thư mục để save file tải lên.
		String fullSavePath = null;
		if (appPath.endsWith("/")) {
			fullSavePath = appPath + "assets/img/shop/product/";
		} else {
			fullSavePath = appPath + "/" + "assets/img/shop/product/";
		}

		String fileName = product.getAnhChinh();

		File file = new File(fullSavePath, fileName);
		System.out.println(file.getPath()+"1");

		boolean check = productControl.deleteProduct(id);
		if (check) {
			HttpSession session = request.getSession();
			session.setAttribute("Delete", "Success");
			session.setMaxInactiveInterval(15);
			if (file.delete()) {
				System.out.println("đã xóa file: " + file.getName());
			} else {
				System.out.println("Xóa file thất bại.");
			}
			response.sendRedirect("AdminListProducts");
		} else {

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
