package servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addCategory
 */
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

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/db1?user=adminuser&password=password&serverTimezone=UTC";

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
				String insertSQL = "INSERT INTO sp_shop.category(catname, description) values(?,?)";
				PreparedStatement ipstmt = conn.prepareStatement(insertSQL);
				ipstmt.setString(1, categoryName);
				ipstmt.setString(2, categoryDescription);

				int count = ipstmt.executeUpdate();

				if (count > 0) {
					response.sendRedirect("addCategory.jsp?successCode=successInsertion");
				} else {
					response.sendRedirect("addCategory.jsp?errCode=databaseFailed");
				}
			}
			conn.close();
		} catch (Exception e) {

		}
	}
}
