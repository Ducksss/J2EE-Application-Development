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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			int productID = Integer.parseInt(request.getParameter("productID"));
			ArrayList<Product> productList = (ArrayList<Product>) request.getSession().getAttribute("product");
//			System.out.println(productList.indexOf(productID));
//			System.out.println(productList.get(productList.indexOf(productID)).getProductTitle());
			System.out.println("Hello WOrld");
			response.sendRedirect("cart.jsp");
			return;			
		} catch (Exception e) {
			response.sendRedirect("cart.jsp");
			return;
		}
	}

}
