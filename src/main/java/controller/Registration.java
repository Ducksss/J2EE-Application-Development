package controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserDB;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Servlet implementation class registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
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
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("pass");
			String address = request.getParameter("address");
			String confirmPassword = request.getParameter("re_pass");
			String contactNumber = request.getParameter("number");
			String hashed = BCrypt.hashpw(password, BCrypt.gensalt());

			// simple backend guard statement validation to check if the password matches!
			if (!password.equals(confirmPassword)) {
				response.sendRedirect("register.jsp?errCode=passwordUnmatch");
			}

			boolean accountDoesExist = UserDB.findDuplicateUser(email);

			// check if an account with the email has been registered before
			if (accountDoesExist) {
				// if the email is associated with an account!
				response.sendRedirect("register.jsp?errCode=accountAlreadyExists");
			} else {
				boolean createdSuccessfully = UserDB.insertUser(name, email, hashed, address, contactNumber);

				if (createdSuccessfully) {
					response.sendRedirect("login.jsp");
				}
			}

		} catch (Exception e) {
			System.out.print(e);
		}
	}

}
