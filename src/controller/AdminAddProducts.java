package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.bean.Category;
import model.bean.Products;
import model.bo.CategoryBO;
import model.bo.ProductsBO;

@WebServlet(description = "Add Product", urlPatterns = { "/admin/pages/product/add" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminAddProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminAddProducts() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryBO c = new CategoryBO();
		ArrayList<Category> listCategory = c.getListCategory();
		request.setAttribute("lstCategorys", listCategory);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\product\\add.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		Products product = new Products();
		product.setTenSanPham(request.getParameter("tensanpham"));
		product.setId_loaiSanPham(Long.parseLong(request.getParameter("id_loaisanpham")));
		product.setMoTa(request.getParameter("mota"));

		try {
			product.setGiaGoc(Double.parseDouble(request.getParameter("giagoc")));
		} catch (Exception e) {
			product.setGiaGoc(0);
		}

		try {
			product.setKhuyenMai(Integer.parseInt(request.getParameter("khuyenmai")));
		} catch (Exception e) {
			product.setKhuyenMai(0);
		}

		product.setLuotThich(0);

		product.setTinhTrang(Integer.parseInt(request.getParameter("noibat")));

		String empty = new String();

		Part filePart = request.getPart("file");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString().trim();
		InputStream fileContent = filePart.getInputStream();

		if (!fileName.equals(empty)) {
			fileName = new Date().getTime() + fileName;

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

			File file = new File(fullSavePath, fileName);

			try {
				Files.copy(fileContent, file.toPath());
			} catch (Exception e) {

			}
		}

		product.setAnhChinh(fileName);

		ProductsBO productControl = new ProductsBO();
		boolean check = productControl.addProducts(product);
		if (check==true) {
			HttpSession session = request.getSession();
			session.setAttribute("Add", "Success");
			session.setMaxInactiveInterval(15);
			response.sendRedirect("AdminListProducts");
		} 
		RequestDispatcher rd = request.getRequestDispatcher("AdminListProducts");
		rd.forward(request, response);
	}

}
