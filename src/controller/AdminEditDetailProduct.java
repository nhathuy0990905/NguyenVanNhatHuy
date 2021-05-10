package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
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

import model.bean.ProductsDetail;
import model.bo.ProductDetailBO;

@WebServlet(description = "AdminEditDetailProduct", urlPatterns = { "/admin/pages/detailproduct/edit" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminEditDetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditDetailProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long id = Long.valueOf(request.getParameter("id"));

		ProductDetailBO detailControl = new ProductDetailBO();
		ProductsDetail detail = detailControl.getDetailproductByID(id);
		request.setAttribute("detail", detail);
		System.out.println(id);

		RequestDispatcher dispatcher = request.getRequestDispatcher("admin\\pages\\detailproduct\\edit.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long id = Long.valueOf(request.getParameter("id"));

		ProductDetailBO detailControl = new ProductDetailBO();
		String oldImg = detailControl.getDetailproductByID(id).getAnhChiTiet();
		long id_sanpham = detailControl.getDetailproductByID(id).getId_sanPham();

		ProductsDetail detail = new ProductsDetail();

		detail.setId(id);

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
				fullSavePath = appPath + "assets/img/shop/DetailProduct/";
			} else {
				fullSavePath = appPath + "/" + "assets/img/shop/DetailProduct/";
			}

			File file = new File(fullSavePath, fileName);

			if (!oldImg.trim().equals(empty)) {
				File oldFile = new File(fullSavePath, oldImg);
				if (oldFile.delete()) {
					// System.out.println("da xoa file cu");
				} else {
					 //System.out.println("ko xoa dc file cu");
				}
			}

			try {
				Files.copy(fileContent, file.toPath());
			} catch (Exception e) {

			}
		} else {
			fileName = oldImg;
		}

		detail.setAnhChiTiet(fileName);
		boolean check = detailControl.editdetailProducts(detail);
		if (check) {
			HttpSession session = request.getSession();
			session.setAttribute("Edit", "Success");
			session.setMaxInactiveInterval(15);
			response.sendRedirect("AdminListDetailProduct?id=" + id_sanpham);
		} else {

		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminListDetailProduct?id=" + id_sanpham);
		dispatcher.forward(request, response);

	}

}
