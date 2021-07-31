package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpClient;
import org.json.*;

import java.net.URI;

/**
 * Servlet implementation class CurrencyConversion
 */
@WebServlet("/CurrencyConversion")
public class CurrencyConversion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CurrencyConversion() {
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
		PrintWriter out = response.getWriter();
		try {
			// extracting value from the login.html form and storing it in its respective
			String currency = request.getParameter("currency");
			Double totalPrice = Double.valueOf( request.getParameter("totalPrice") );
			String currencyString = request.getParameter("currency");
			System.out.println(currencyString);
			HttpRequest requesta = HttpRequest.newBuilder()
					.uri(URI.create("https://api.exchangerate-api.com/v4/latest/sgd"))
					.method("GET", HttpRequest.BodyPublishers.noBody()).build();
			HttpResponse<String> responsea = HttpClient.newHttpClient().send(requesta,
					HttpResponse.BodyHandlers.ofString());
			System.out.println(responsea.body());
			JSONObject obj = new JSONObject(responsea.body());
			System.out.println(obj.get("rates"));
			JSONObject objectRates = new JSONObject(obj.get("rates").toString());
			
			System.out.println(objectRates.get(currency));
			
			double currencyThing = ((BigDecimal) objectRates.get(currency)).doubleValue();
			System.out.println();
			double totalPriceConverted = currencyThing * totalPrice;
			HttpSession session = request.getSession(true);
			session.removeAttribute("currencyType");
			session.removeAttribute("totalPriceConverted");
			session.setAttribute("totalPriceConverted", totalPriceConverted);
			session.setAttribute("currencyType", currencyString);
			response.sendRedirect("checkOut.jsp");

		} catch (Exception e) {
			out.print(e);
			out.print("xd there seems to be soemthig wrong");
		}
	}

}
