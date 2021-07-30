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
			// Set your secret key. Remember to switch to your live secret key in
			// production.
			// See your keys here: https://dashboard.stripe.com/apikeys
			Stripe.apiKey = "sk_test_51JIbDeEw27jYt5tURmgXyEHj13ws0UKNwhJPJDpqXPW8ULUXQguZURTd5yl6oa3CueZGMVBtBj4soQ5NXRsgiEvJ00k5k5KNLy";

			// Token is created using Stripe Checkout or Elements!
			// Get the payment token ID submitted by the form:
			String token = request.getParameter("stripeToken");
			double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

			BigDecimal bd = new BigDecimal(totalPrice).setScale(2, RoundingMode.HALF_UP);
			Long v1 = Math.round(bd.doubleValue() * 100);

			ChargeCreateParams params = ChargeCreateParams.builder().setAmount(v1).setCurrency("sgd")
					.setDescription("Example charge - WALCO 1").setSource(token).build();

			Charge charge = Charge.create(params);

			int sessUserID = (int) request.getSession().getAttribute("sessUserID");
			ArrayList<Product> productList = (ArrayList<Product>) request.getSession().getAttribute("product");

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// if the email is not associated with an account!
			String insertSQL = "INSERT INTO sp_shop.reciepts(user_id, total_price) VALUES (?, ?)";
			PreparedStatement pstat = conn.prepareStatement(insertSQL);
			pstat.setInt(1, sessUserID);
			pstat.setString(2, String.format("%.2f", totalPrice));

			int count = pstat.executeUpdate();
			System.out.println(sessUserID);

			if (count > 0) {
				insertSQL = "SELECT * FROM sp_shop.reciepts where user_id = ? ORDER BY reciept_id desc;";
				pstat = conn.prepareStatement(insertSQL);
				pstat.setInt(1, sessUserID);
				int reciept_id = 0;

				ResultSet rs = pstat.executeQuery();
				boolean isFirst = true;
				if (rs.next() && isFirst) {
					reciept_id = rs.getInt("reciept_id");
					isFirst = false;
				}

				for (int i = 0; i < productList.size(); i++) {

					for (int n = 0; n < productList.get(i).getQuantity(); n++) {
						// if the email is not associated with an account!
						insertSQL = "INSERT INTO sp_shop.orders(user_id, product_id, reciept_id) VALUES (?, ?, ?)";
						pstat = conn.prepareStatement(insertSQL);
						pstat.setInt(1, sessUserID);
						pstat.setInt(2, productList.get(i).getProductID());
						pstat.setInt(3, reciept_id);

						count = pstat.executeUpdate();
					}
				}

				for (int i = 0; i < productList.size(); i++) {
					insertSQL = "SELECT * FROM sp_shop.products where product_id = ?;";
					pstat = conn.prepareStatement(insertSQL);
					pstat.setInt(1, productList.get(i).getProductID());

					int stock_quantity = 0;
					rs = pstat.executeQuery();
					if (rs.next()) {
						stock_quantity = rs.getInt("stock_quantity");
					}

					// if the email is not associated with an account!
					insertSQL = "UPDATE sp_shop.products SET stock_quantity = ? where product_id = ?";
					pstat = conn.prepareStatement(insertSQL);
					pstat.setInt(1, stock_quantity - productList.get(i).getQuantity());
					pstat.setInt(2, productList.get(i).getProductID());

					count = pstat.executeUpdate();
				}
			}

			System.out.println("Success!");
			response.sendRedirect("checkOutConfirmation.jsp");
			return;
		} catch (Exception e) {
			System.out.println("Failure encountered");
			System.out.print(e);
		}
	}

}
