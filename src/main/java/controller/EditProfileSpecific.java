package controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class editProfileSpecific
 */
@WebServlet("/EditProfileSpecific")
public class EditProfileSpecific extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProfileSpecific() {
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
			int user_id = 0;
			try {
				HttpSession session = request.getSession(true);
				user_id = (int) session.getAttribute("sessUserID");

			} catch (Exception e) {
			}
			String username = request.getParameter("username");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");

			if (!password.equals(confirmPassword)) {
				response.sendRedirect("editProfileSpecific.jsp?errCode=passwordsDoNotMatch");
			} else {
				// Step1: Load JDBC Driver
				Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

				// Step 2: Define Connection URL
				String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

				// Step 3: Establish connection to URL
				Connection conn = DriverManager.getConnection(connURL);

				// instead of editing directly, use ? to prevent injection attacks
				String sql = "UPDATE sp_shop.users SET username=?, address=?, password=? WHERE user_id = ?";

				/// executing to DB - Statement to check if an account exist before it
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, username);
				pstmt.setString(2, address);
				pstmt.setString(3, password);
				pstmt.setDouble(4, user_id);

				int count = pstmt.executeUpdate();

				if (count > 0) {
					response.sendRedirect("editProfileSpecific.jsp?successCode=updateSuccessful");
				} else {
					response.sendRedirect("editProfileSpecific.jsp?errCode=updateUnsuccessful");

				}
			}
		} catch (Exception e) {

		}
	}

}
