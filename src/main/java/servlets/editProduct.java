package servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class editProduct
 */
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
		try {
			// first execute
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			String productTitle = request.getParameter("productTitle");
			String briefDescription = request.getParameter("briefDescription");
			String detailedDescription = request.getParameter("detailedDescription");
			double costPrice = Double.parseDouble(request.getParameter("costPrice"));
			double retailPrice = Double.parseDouble(request.getParameter("retailPrice"));
			int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
			String[] categories = request.getParameterValues("categories");

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// instead of editing directly, use ? to prevent injection attacks
			String sql = "UPDATE sp_shop.products SET product_title=?, brief_description=?, detail_description=?, cost_price=?, retail_price=?, stock_quantity=? WHERE product_id = ?";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, productTitle);
			pstmt.setString(2, briefDescription);
			pstmt.setString(3, detailedDescription);
			pstmt.setDouble(4, costPrice);
			pstmt.setDouble(5, retailPrice);
			pstmt.setInt(6, stockQuantity);
			pstmt.setInt(7, product_id);

			int count = pstmt.executeUpdate();

			if (count > 0) {
				sql = "DELETE FROM sp_shop.category_tags WHERE fk_product_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, product_id);
				count = pstmt.executeUpdate();
				for (int i = 0; i < categories.length; i++) {
					String insertSQL = "INSERT INTO sp_shop.category_tags(fk_product_id, fk_category_id) values(?,?)";
					PreparedStatement ipstmt = conn.prepareStatement(insertSQL);
					ipstmt.setInt(1, product_id);
					ipstmt.setString(2, categories[i]);
					int rowAffected = ipstmt.executeUpdate();
				}
				response.sendRedirect("editProduct.jsp?successCode=successInsertion&productID=" + product_id);
			} else {
				response.sendRedirect("editProduct.jsp?errCode=databaseFailed&productID=" + product_id);
			}
			conn.close();
		} catch (Exception e) {

		}
	}

}
