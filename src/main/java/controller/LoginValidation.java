package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Servlet implementation class loginValidation
 */
@WebServlet("/LoginValidation")
public class LoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginValidation() {
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
			// extracting value from the login.html form and storing it in its respective
			// params
			String email = request.getParameter("your_name");
			String password = request.getParameter("your_pass");

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// instead of editing directly, use ? to prevent injection attacks
			String sql = "SELECT * FROM sp_shop.users WHERE email = ?";

			// executing to DB
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();

			if (password.equals(null) || email.equals(null) || password == "" || email == "") {
				// checking if the password && userid with its according field
				response.sendRedirect("login.jsp?errCode=NULL");
				return;
			} else {
				if (rs.next() == false) {
					response.sendRedirect("login.jsp?errCode=invalidLogin");
					return;
				}

				if (BCrypt.checkpw(password, rs.getString("password"))) {
					// Upon successful verification, lets redirect them to displayUser Page -->
					// storing the value from the select statement into the variables
					int user_id = rs.getInt("user_id");
					String role = rs.getString("type");
					String username = rs.getString("username");
					String useremail = rs.getString("email");

					// creating a session and setting the respective attributes
					HttpSession session = request.getSession(true);
					session.setAttribute("sessUserName", username);
					session.setAttribute("sessUserEmail", useremail);
					session.setAttribute("sessUserRole", role);
					session.setAttribute("sessUserID", user_id);

					// redirects the user upon success
					response.sendRedirect("index.jsp");
					return;
				} else {
					System.out.println("It does not match");
					response.sendRedirect("login.jsp?errCode=invalidLogin");
					return;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error was found here!");
		}
	}

}
