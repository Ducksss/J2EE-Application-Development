package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

/**
 * Servlet implementation class product
 */
@WebServlet("/product")
public class product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public product() {
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
		
		PrintWriter out = response.getWriter();
		String a = request.getParameter("type");
		String url = request.getRequestURL().toString();
		try {
			// extracting value from the login.html form and storing it in its respective
			// params
			String category = request.getParameter("category");

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// instead of editing directly, use ? to prevent injection attacks
			String sql = "SELECT *\r\n"
					+ "FROM sp_shop.products\r\n"
					+ "JOIN sp_shop.category_tags ON products.product_id = category_tags.category_tags_id\r\n"
					+ "JOIN sp_shop.category ON products.product_id = category.category_id \r\n"
					+ "WHERE fk_category_id = ?";

			// executing to DB
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			ResultSet rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {
			    for (int i = 1; i <= columnsNumber; i++) {
			        if (i > 1) System.out.print(",  ");
			        String columnValue = rs.getString(i);
			        out.print(columnValue + " " + rsmd.getColumnName(i));
			    }
			   out.println("");
			}
			
				// Upon successful verification, lets redirect them to displayUser Page -->
				// storing the value from the select statement into the variables
				out.println(rs);

				// creating a sesson and setting the respective attributes
				HttpSession session = request.getSession(true);
				/*
				 * session.setAttribute("sessUserName", username);
				 * session.setAttribute("sessUserEmail", useremail);
				 * session.setAttribute("sessUserRole", role);
				 */

				// redirects the user upon success
				/* response.sendRedirect("index.jsp"); */
		
		} catch (Exception e) {
			out.print(e);
			out.print("xd there seems to be soemthig wrong");
		}
		
	}

}
