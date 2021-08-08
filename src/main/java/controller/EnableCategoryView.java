package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EnableCategoryView
 */
@WebServlet("/EnableCategoryView")
public class EnableCategoryView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EnableCategoryView() {
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
			int category_id = Integer.parseInt(request.getParameter("categoryID"));

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			String insertSQL = "UPDATE sp_shop.products SET status = 0 WHERE product_id = ?";
			PreparedStatement ipstmt = conn.prepareStatement(insertSQL);
			ipstmt.setInt(1, category_id);

			int rowAffected = ipstmt.executeUpdate();

			if (rowAffected > 0) {
				response.sendRedirect("manageProductCategory.jsp");
			} else {
				response.sendRedirect("manageProductCategory.jsp");
			}
		} catch (Exception e) {
			response.sendRedirect("manageProductCategory.jsp");
		}
	}

}
