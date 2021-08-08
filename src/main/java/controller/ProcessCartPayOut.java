package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stripe.Stripe;
import com.stripe.model.Charge;
import com.stripe.model.Price;
import com.stripe.param.ChargeCreateParams;

import products.Product;
import model.ProductDB;
import model.RecieptDB;
import model.OrderDB;

/**
 * Servlet implementation class ProcessCartPayOut
 */
@WebServlet("/ProcessCartPayOut")
public class ProcessCartPayOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProcessCartPayOut() {
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
			// Requesting Params
			String token = request.getParameter("stripeToken");
			int sessUserID = (int) request.getSession().getAttribute("sessUserID");
			double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
			BigDecimal bd = new BigDecimal(totalPrice).setScale(2, RoundingMode.HALF_UP);
			ArrayList<Product> productList = (ArrayList<Product>) request.getSession().getAttribute("product");
			Long v1 = Math.round(bd.doubleValue() * 100);

			// See your keys here: https://dashboard.stripe.com/apikeys
			Stripe.apiKey = "sk_test_51JIbDeEw27jYt5tURmgXyEHj13ws0UKNwhJPJDpqXPW8ULUXQguZURTd5yl6oa3CueZGMVBtBj4soQ5NXRsgiEvJ00k5k5KNLy";

			// Stripe
			ChargeCreateParams params = ChargeCreateParams.builder().setAmount(v1).setCurrency("sgd")
					.setDescription("Example charge - WALCO 1").setSource(token).build();

			Charge charge = Charge.create(params);

			// Calling the models
			OrderDB OrderDB = new OrderDB();
			RecieptDB RecieptDB = new RecieptDB();
			ProductDB ProductDB = new ProductDB();

			boolean success = RecieptDB.insertReciept(sessUserID, totalPrice);

			if (success) {
				int recieptID = RecieptDB.getRecieptID(sessUserID);

				for (int i = 0; i < productList.size(); i++) {
					for (int n = 0; n < productList.get(i).getQuantity(); n++) {
						// if the email is not associated with an account!
						OrderDB.insertOrder(sessUserID, productList.get(i).getProductID(), recieptID,
								productList.get(i).getRetailPrice());
					}
				}

				for (int i = 0; i < productList.size(); i++) {
					int stock_quantity = ProductDB.retriveStockQuantity(productList.get(i).getProductID());

					ProductDB.updateStockQuantity(stock_quantity - productList.get(i).getQuantity(),
							productList.get(i).getProductID());
				}
			}

			System.out.println("Success!");
			response.sendRedirect("checkOutConfirmation.jsp");
			return;
		} catch (Exception e) {
			System.out.println("Failure encountered");
			System.out.print(e);
			System.out.println("Failure encountered");
		}
	}

}
