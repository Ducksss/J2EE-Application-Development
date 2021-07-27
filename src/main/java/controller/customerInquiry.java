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

/**
 * Servlet implementation class customerInquiry
 */
@WebServlet("/customerInquiry")
public class customerInquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerInquiry() {
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
		
		System.out.println("it enters the");
		
		try {
			System.out.println(request.getParameter("content"));
			String content = request.getParameter("content");
			int fk_user_id = Integer.parseInt(request.getParameter("fk_user_id"));
			System.out.println(fk_user_id);
			System.out.println(content);
			System.out.println("hi");
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			String insertSQL = "INSERT INTO sp_shop.customer_inquiry(content, fk_user_id) values(?,?)";
			PreparedStatement ipstmt = conn.prepareStatement(insertSQL);
			ipstmt.setString(1, content);
			ipstmt.setInt(2, fk_user_id);

			int rowAffected = ipstmt.executeUpdate();

			if (rowAffected > 0) {
				response.sendRedirect("customerInquiry.jsp");
			} else {
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
