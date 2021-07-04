package servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.util.Date;

/**
 * Servlet implementation class editProduct
 */

@MultipartConfig
@WebServlet("/editProduct")
public class editProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public editProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int product_id = 0;
		try {
			// first execute
			product_id = Integer.parseInt(request.getParameter("product_id"));
			String productTitle = request.getParameter("productTitle");
			String briefDescription = request.getParameter("briefDescription");
			String detailedDescription = request.getParameter("detailedDescription");
			double costPrice = Double.parseDouble(request.getParameter("costPrice"));
			double retailPrice = Double.parseDouble(request.getParameter("retailPrice"));
			int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
			String[] categories = request.getParameterValues("categories");

			if (categories == null) {
				response.sendRedirect("editProduct.jsp?errCode=noCategoriesSelected&productID=" + product_id);
				return;
			}

			// Image storage section
			Part file = request.getPart("img");
			String fileUploadname = "";
			String imgFileName = file.getSubmittedFileName();
			boolean haveImage = true;
			if (imgFileName.equals("") || imgFileName == null) {
				haveImage = false;
			} else {
				Object type = file.getHeader("content-type");
				if (type.equals("image/jpeg") || type.equals("image/png") || type.equals("image/jpg")
						|| type.equals("image/gif") || type.equals("image/bmp")) {

					// Convert into String to concat with the file
					Date date = new Date();
					// This method returns the time in millis
					long timeMilli = date.getTime();

					// File
					String trial = getServletContext().getRealPath("");
					String[] tokens = trial.replace("\\", "/").split("/");
					String finalpathing = "";
					for (int i = 0; i < tokens.length - 6; i++) {
						finalpathing += tokens[i] + "/";
					}
					
					finalpathing+= tokens[tokens.length - 1] + "/src/main/webapp/assets/img/product/";
					System.out.println(finalpathing);

					String uploadPath = (finalpathing + timeMilli + imgFileName);
					FileOutputStream fos = new FileOutputStream(uploadPath);
					InputStream is = file.getInputStream();

					//
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();

					fileUploadname = "assets/img/product/" + timeMilli + imgFileName;
				} else {
					response.sendRedirect("editProduct.jsp?errCode=notAnImage&productID=" + product_id);
					return;
				}
			}

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// instead of editing directly, use ? to prevent injection attacks
			int count = 0;

			if (haveImage) {
				String sql = "UPDATE sp_shop.products SET product_title=?, brief_description=?, detail_description=?, cost_price=?, retail_price=?, stock_quantity=?, image_location=? WHERE product_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, productTitle);
				pstmt.setString(2, briefDescription);
				pstmt.setString(3, detailedDescription);
				pstmt.setDouble(4, costPrice);
				pstmt.setDouble(5, retailPrice);
				pstmt.setInt(6, stockQuantity);
				pstmt.setString(7, fileUploadname);
				pstmt.setInt(8, product_id);

				count = pstmt.executeUpdate();
			} else {
				String sql = "UPDATE sp_shop.products SET product_title=?, brief_description=?, detail_description=?, cost_price=?, retail_price=?, stock_quantity=? WHERE product_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, productTitle);
				pstmt.setString(2, briefDescription);
				pstmt.setString(3, detailedDescription);
				pstmt.setDouble(4, costPrice);
				pstmt.setDouble(5, retailPrice);
				pstmt.setInt(6, stockQuantity);
				pstmt.setInt(7, product_id);

				count = pstmt.executeUpdate();
			}

			if (count > 0) {
				String sql = "DELETE FROM sp_shop.category_tags WHERE fk_product_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, product_id);
				count = pstmt.executeUpdate();
				for (int i = 0; i < categories.length; i++) {
					String insertSQL = "INSERT INTO sp_shop.category_tags(fk_product_id, fk_category_id) values(?,?)";
					PreparedStatement ipstmt = conn.prepareStatement(insertSQL);
					ipstmt.setInt(1, product_id);
					ipstmt.setString(2, categories[i]);
					int rowAffected = ipstmt.executeUpdate();
				}

				conn.close();

				response.sendRedirect("editProduct.jsp?successCode=successInsertion&productID=" + product_id);
				return;
			} else {
				response.sendRedirect("editProduct.jsp?errCode=databaseFailed&productID=" + product_id);
				return;
			}
		} catch (Exception e) {
			response.sendRedirect("editProduct.jsp?errCode=nameHasAlreadyBeenTaken&productID=" + product_id);
		}
	}

}
