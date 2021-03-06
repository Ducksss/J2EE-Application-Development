package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import java.util.*;
import java.sql.*;

/**
 * Servlet implementation class DeleteCategoryDetails
 */
@WebServlet("/DeleteCategoryDetails")
public class DeleteCategoryDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCategoryDetails() {
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

		CategoryDB CategoryDB = new CategoryDB();

		int category_id = Integer.parseInt(request.getParameter("categoryID"));
		boolean success = CategoryDB.deleteCategory(category_id);

		if (success) {
			response.sendRedirect("manageProductCategory.jsp");
		} else {
			response.sendRedirect("manageProductCategory.jsp");
		}
	}

}
