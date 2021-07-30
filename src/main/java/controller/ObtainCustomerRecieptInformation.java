package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import reciept.Reciept;
import java.sql.*;
import java.util.*;

/**
 * Servlet implementation class ObtainCustomerRecieptInformation
 */
@WebServlet("/ObtainCustomerRecieptInformation")
public class ObtainCustomerRecieptInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ObtainCustomerRecieptInformation() {
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
	}

	public ArrayList<Reciept> getAllUniqueRecieptOrder(int user_id, int reciept_id) {
		try {
			RecieptDB RecieptDB = new RecieptDB();
			ArrayList<Reciept> Reciept = RecieptDB.getCustomerRecieptInformation(user_id, reciept_id);

			return Reciept;
		} catch (Exception e) {
			return null;
		}
	}
}
