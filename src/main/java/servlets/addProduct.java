package servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addProduct
 */
@WebServlet("/addProduct")
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addProduct() {
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
			int product_id = 0;
			String productTitle = request.getParameter("productTitle");
			String briefDescription = request.getParameter("briefDescription");
			String detailedDescription = request.getParameter("detailedDescription");
			String costPrice = request.getParameter("costPrice");
			String retailPrice = request.getParameter("retailPrice");
			String stockQuantity = request.getParameter("stockQuantity");
			String[] categories = request.getParameterValues("categories");

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// instead of editing directly, use ? to prevent injection attacks
			String sql = "SELECT * FROM sp_shop.products WHERE product_title = ?";

			// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productTitle);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				// if the email is associated with an account!
				response.sendRedirect("addProduct.jsp?errCode=productAlreadyExists");
			} else {
				// simple code to extract to insert
				String insertSQL = "INSERT INTO sp_shop.products(product_title, brief_description, detail_description, cost_price, retail_price, stock_quantity) values(?,?,?,?,?,?)";
				PreparedStatement ipstmt = conn.prepareStatement(insertSQL);
				ipstmt.setString(1, productTitle);
				ipstmt.setString(2, briefDescription);
				ipstmt.setString(3, detailedDescription);
				ipstmt.setString(4, costPrice);
				ipstmt.setString(5, retailPrice);
				ipstmt.setString(6, stockQuantity);

				int rowAffected = ipstmt.executeUpdate();

				if (rowAffected > 0) {
					// simple code to select the product_id for the many to many
					// STATEMENT.getGeneratedKeys() failed for me, so i had to manually sort.
					sql = "SELECT * FROM sp_shop.products where product_title = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, productTitle);
					rs = pstmt.executeQuery();

					if (rs.next()) {
						int deltaOne = rs.getInt("product_id");
						// simple for loop to add inot the many to many tables
						for (int i = 0; i < categories.length; i++) {
							insertSQL = "INSERT INTO sp_shop.category_tags(fk_product_id, fk_category_id) values(?,?)";
							ipstmt = conn.prepareStatement(insertSQL);
							ipstmt.setInt(1, deltaOne);
							ipstmt.setString(2, categories[i]);
							rowAffected = ipstmt.executeUpdate();
						}
						response.sendRedirect("addProduct.jsp?successCode=successInsertion");
					} else {
						response.sendRedirect("addProduct.jsp?errCode=databaseFailed");
					}
				} else {
					response.sendRedirect("addProduct.jsp?errCode=databaseFailed");
				}
			}
			conn.close();
		} catch (Exception e) {

		}
	}
}
