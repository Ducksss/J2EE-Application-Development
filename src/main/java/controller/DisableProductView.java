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

import model.ProductDB;

/**
 * Servlet implementation class DisableProductView
 */
@WebServlet("/DisableProductView")
public class DisableProductView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DisableProductView() {
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
			int product_id = Integer.parseInt(request.getParameter("productID"));

			ProductDB ProductDB = new ProductDB();
			boolean success = ProductDB.editProductStatus(1, product_id);

			if (success) {
				response.sendRedirect("manageProductCategory.jsp");
			} else {
				response.sendRedirect("manageProductCategory.jsp");
			}
		} catch (Exception e) {
			response.sendRedirect("manageProductCategory.jsp");
		}
	}

}
