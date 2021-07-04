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
 * Servlet implementation class addCategory
 */
@MultipartConfig
@WebServlet("/addCategory")
public class addCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addCategory() {
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
					response.sendRedirect("addCategory.jsp?errCode=notAnImage");
				}
			}

			System.out.println("Success till here");

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// instead of editing directly, use ? to prevent injection attacks
			String sql = "SELECT * FROM sp_shop.category WHERE catname = ?";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				// if the email is associated with an account!
				response.sendRedirect("addCategory.jsp?errCode=categoryAlreadyExists");
			} else {
				int count = 0;

				if (haveImage) {
					System.out.println("With image is in here");
					String insertSQL = "INSERT INTO sp_shop.category(catname, description, category_image) values(?,?,?)";
					PreparedStatement ipstmt = conn.prepareStatement(insertSQL);
					ipstmt.setString(1, categoryName);
					ipstmt.setString(2, categoryDescription);
					ipstmt.setString(3, fileUploadname);
					count = ipstmt.executeUpdate();
				} else {
					System.out.println("With no image is in here");
					String insertSQL = "INSERT INTO sp_shop.category(catname, description) values(?,?)";
					PreparedStatement ipstmt = conn.prepareStatement(insertSQL);
					ipstmt.setString(1, categoryName);
					ipstmt.setString(2, categoryDescription);
					count = ipstmt.executeUpdate();
				}

				if (count > 0) {
					response.sendRedirect("addCategory.jsp?successCode=successInsertion");
				} else {
					response.sendRedirect("addCategory.jsp?errCode=databaseFailed");
				}
			}
			conn.close();
		} catch (

		Exception e) {

		}
	}
}
