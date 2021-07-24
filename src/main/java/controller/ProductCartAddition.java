package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import products.Product;

/**
 * Servlet implementation class ProductCartAddition
 */
@WebServlet("/ProductCartAddition")
public class ProductCartAddition extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductCartAddition() {
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
		System.out.println("ProductCartDecrementWasReached");
		try {
			int productID = Integer.parseInt(request.getParameter("productID"));
			ArrayList<Product> productList = (ArrayList<Product>) request.getSession().getAttribute("product");

			System.out.println(productID);
			for (Product product : productList) {
				if (product.getProductID() == productID) {
					product.setQuantity(product.getQuantity() + 1);
					break;
				}
			}

			response.sendRedirect("cart.jsp");
			return;
		} catch (Exception e) {
			System.out.print(e);
			response.sendRedirect("cart.jsp");
			return;
		}
	}

}
