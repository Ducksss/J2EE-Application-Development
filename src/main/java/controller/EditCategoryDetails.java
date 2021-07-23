package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class EditCategoryDetails
 */
@MultipartConfig
@WebServlet("/EditCategoryDetails")
public class EditCategoryDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditCategoryDetails() {
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
		int category_id = 0;
		try {
			category_id = Integer.parseInt(request.getParameter("category_id"));
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
				Object type = file.getHeader("content-type");
				if (type.equals("image/jpeg") || type.equals("image/png") || type.equals("image/jpg")
						|| type.equals("image/gif") || type.equals("image/bmp")) {

					try {
						// Convert into String to concat with the file
						// Getting the current date
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

						finalpathing += tokens[tokens.length - 1] + "/src/main/webapp/assets/img/product/";
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
						System.out.println("Here was reached - img 1");
					} catch (Exception e) {
						System.out.println("Here was reached - img 2");
						// Convert into String to concat with the file
						// Getting the current date
						Date date = new Date();
						// This method returns the time in millis
						long timeMilli = date.getTime();

						// File
						String uploadPath = getServletContext()
								.getRealPath("/assets/img/product/" + timeMilli + imgFileName);
						FileOutputStream fos = new FileOutputStream(uploadPath);
						InputStream is = file.getInputStream();

						//
						byte[] data = new byte[is.available()];
						is.read(data);
						fos.write(data);
						fos.close();

						fileUploadname = "assets/img/product/" + timeMilli + imgFileName;
					}
				} else {
					response.sendRedirect("editCategory.jsp?errCode=notAnImage&categoryID=" + category_id);
					return;
				}
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

			conn.close();

			if (count > 0) {
				response.sendRedirect("editCategory.jsp?successCode=successInsertion&categoryID=" + category_id);
				return;
			} else {
				response.sendRedirect("editCategory.jsp?errCode=databaseFailed&categoryID=" + category_id);
				return;
			}
		} catch (Exception e) {
			response.sendRedirect("editCategory.jsp?errCode=CategoryNameHasAlreadyBeenTaken&categoryID=" + category_id);
			return;
		}
	}

}
