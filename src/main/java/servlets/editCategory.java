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

/**
 * Servlet implementation class editCategory
 */
@MultipartConfig
@WebServlet("/editCategory")
public class editCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public editCategory() {
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
		try {
			int category_id = Integer.parseInt(request.getParameter("category_id"));
			String categoryName = request.getParameter("categoryName");
			String categoryDescription = request.getParameter("categoryDescription");

			// Image storage section
			Part file = request.getPart("img");
			String fileUploadname = "";
			String imgFileName = file.getSubmittedFileName();
			boolean haveImage = true;
			if (imgFileName.equals("") || imgFileName == null) {
				haveImage = false;
			} else {
				String uploadPath = getServletContext().getRealPath("/assets/img/product/" + imgFileName);
				FileOutputStream fos = new FileOutputStream(uploadPath);
				InputStream is = file.getInputStream();

				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();

				fileUploadname = "assets/img/product/" + imgFileName;
			}

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			int count = 0;
			if (haveImage) {
				String sql = "UPDATE sp_shop.category SET catname=?, description=?, category_image=? WHERE category_id = ?";

				/// executing to DB - Statement to check if an account exist before it
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, categoryName);
				pstmt.setString(2, categoryDescription);
				pstmt.setString(3, fileUploadname);
				pstmt.setInt(4, category_id);
				count = pstmt.executeUpdate();
			} else {
				String sql = "UPDATE sp_shop.category SET catname=?, description=? WHERE category_id = ?";

				/// executing to DB - Statement to check if an account exist before it
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, categoryName);
				pstmt.setString(2, categoryDescription);
				pstmt.setInt(3, category_id);
				count = pstmt.executeUpdate();
			}

			if (count > 0) {
				response.sendRedirect("editCategory.jsp?successCode=successInsertion&categoryID=" + category_id);
			} else {
				response.sendRedirect("editCategory.jsp?errCode=databaseFailed&categoryID=" + category_id);
			}
			conn.close();
		} catch (Exception e) {

		}
	}

}
