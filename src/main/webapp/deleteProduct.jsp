<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- ======= Validation ======= -->
	<%@ include file="./components/adminValidation.jsp"%>

	<%
	try {
		int product_id = Integer.parseInt(request.getParameter("productID"));

		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// instead of editing directly, use ? to prevent injection attacks
		String sql = "DELETE FROM sp_shop.products WHERE product_id = ?";

		/// executing to DB - Statement to check if an account exist before it
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, product_id);

		int count = pstmt.executeUpdate();

		if (count > 0) {
			response.sendRedirect("statistics.jsp");
		} else {
			response.sendRedirect("statistics.jsp");
		}
		conn.close();
	} catch (Exception e) {

	}
	%>
</body>
</html>