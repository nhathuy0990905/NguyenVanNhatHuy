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

@WebServlet(description = "Edit Product", urlPatterns = { "/admin/pages/product/edit" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminEditProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditProducts() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		 long id = Long.parseLong(request.getParameter("id"));

		ProductsBO productControl = new ProductsBO();
		Products product = productControl.getProductsByID(id);

		request.setAttribute("product", product);

		CategoryBO categoryControl = new CategoryBO();
		ArrayList<Category> listCategory = categoryControl.getListCategory();
		request.setAttribute("listCategory", listCategory);

		RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\product\\edit.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		Products product = new Products();
		long id=0;
		try {
			 id = Long.parseLong(request.getParameter("id"));
		} catch (Exception e) {
			// TODO: handle exception
		}		

		product.setId(id);
		ProductsBO productControl = new ProductsBO();
		Products productImage = productControl.getProductsByID(id);
		String oldImg = productImage.getAnhChinh();

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

		product.setLuotThich(Integer.parseInt(request.getParameter("luotthich")));

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

			if (!oldImg.trim().equals(empty)) {
				File oldFile = new File(fullSavePath, oldImg);
				if (oldFile.delete()) {
					// System.out.println("da xoa file cu");
				} else {
					// System.out.println("ko xoa dc file cu");
				}
			}
			
			try {
				Files.copy(fileContent, file.toPath());
			} catch (Exception e) {

			}
		} else {
			fileName = oldImg;
		}
		product.setAnhChinh(fileName);

		boolean check = productControl.editProduct(product);
		if (check==true) {
			HttpSession session = request.getSession();
			session.setAttribute("Edit", "Success");
			session.setMaxInactiveInterval(15);
			response.sendRedirect("AdminListProducts");
		} 
		RequestDispatcher rd = request.getRequestDispatcher("AdminListProducts");
		rd.forward(request, response);
		

	}	
}
