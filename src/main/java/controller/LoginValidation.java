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

import model.*;
import users.User;

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
			UserDB UserDB = new UserDB();
			String email = request.getParameter("your_name");
			String password = request.getParameter("your_pass");

			boolean verified = UserDB.verifyUser(email);

			if (password.equals(null) || email.equals(null) || password == "" || email == "") {
				// checking if the password && userid with its according field
				response.sendRedirect("login.jsp?errCode=NULL");
				return;
			} else {
				if (!verified) {
					response.sendRedirect("login.jsp?errCode=invalidLogin");
					return;
				}

				User User = UserDB.retriveUserInformation(email);
				if (User.getStatus() == 1) {
					response.sendRedirect("login.jsp?errCode=banned");
					return;
				}

				if (BCrypt.checkpw(password, User.getUserPassword())) {
					// Upon successful verification, lets redirect them to displayUser Page -->
					// storing the value from the select statement into the variables
					// creating a session and setting the respective attributes
					HttpSession session = request.getSession(true);
					session.setAttribute("sessUserName", User.getUserName());
					session.setAttribute("sessUserEmail", User.getUserEmail());
					session.setAttribute("sessUserRole", User.getType());
					session.setAttribute("sessUserID", User.getUserID());

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
			response.sendRedirect("login.jsp?errCode=invalidLogin");
		}
	}
}
