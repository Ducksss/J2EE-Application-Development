package servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registration
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public registration() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
			// extracting value from the login.html form and storing it in its respective params
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("pass");
			String confirmPassword = request.getParameter("re_pass");

			// simple backend guard statement validation to check if the password matches!
			if (!password.equals(confirmPassword)) {
				response.sendRedirect("register.jsp?errCode=passwordUnmatch");
			}

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			//Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			//instead of editing directly, use ? to prevent injection attacks
			String sql = "SELECT * FROM sp_shop.users WHERE email = ?";

			//executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();

			// check if an account with the email has been registered before
			if (rs.next()) {
				//if the email is associated with an account!
				response.sendRedirect("register.jsp?errCode=accountAlreadyExists");
			} else {
				//if the email is not associated with an account!
				String insertSQL = "INSERT INTO sp_shop.users (username, email, password) VALUES (?, ?, ?)";
				PreparedStatement pstat = conn.prepareStatement(insertSQL);
				pstat.setString(1, name);
				pstat.setString(2, email);
				pstat.setString(3, password);

				int count = pstat.executeUpdate();

				if (count > 0) {
			response.sendRedirect("login.jsp");
				}
			}

		} catch (Exception e) {

		}
	}

}
