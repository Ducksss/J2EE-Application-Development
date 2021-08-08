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

import model.UserDB;

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
			UserDB UserDB = new UserDB();
			boolean succcess = UserDB.editUserType("Admin", user_id);

			if (succcess) {
				response.sendRedirect("manageUserAndAdmin.jsp");
				return;
			} else {
				System.out.println("Fail to update!");
				response.sendRedirect("manageUserAndAdmin.jsp");
				return;
			}
		} catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("manageUserAndAdmin.jsp");
			return;
		}
	}

}
