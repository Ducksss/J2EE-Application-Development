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
 * Servlet implementation class AdminPromotion
 */
@WebServlet("/AdminPromotion")
public class AdminPromotion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminPromotion() {
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
			String user_id = request.getParameter("user_id");

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			String sql = "UPDATE sp_shop.users SET type='Admin' where user_id = ?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_id);

			int count = pstmt.executeUpdate();

			if (count > 0) {
				response.sendRedirect("manageUserAndAdmin.jsp");
			} else {
				System.out.println("Fail to update!");
				response.sendRedirect("manageUserAndAdmin.jsp");
			}

		} catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("manageUserAndAdmin.jsp");
			return;
		}
	}

}
