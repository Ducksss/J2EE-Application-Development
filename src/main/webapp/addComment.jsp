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
	<%
	try {
		String userRole = (String) session.getAttribute("sessUserRole");
		if (userRole == null) {
			response.sendRedirect("index.jsp");
		}
	} catch (Exception e) {
		// if session times out, it means that there will be no userRole either ways
		// this is just a failproof way
		response.sendRedirect("index.jsp");
	}
	%>

	<%
	try {
		String content = request.getParameter("content");
		int fk_user_id = Integer.parseInt(request.getParameter("fk_user_id"));
		int fk_product_id = Integer.parseInt(request.getParameter("fk_product_id"));

		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		String insertSQL = "INSERT INTO sp_shop.reviews(content, fk_user_id, fk_product_id) values(?,?,?)";
		PreparedStatement ipstmt = conn.prepareStatement(insertSQL);
		ipstmt.setString(1, content);
		ipstmt.setInt(2, fk_user_id);
		ipstmt.setInt(3, fk_product_id);

		int rowAffected = ipstmt.executeUpdate();

		if (rowAffected > 0) {
			response.sendRedirect("product.jsp");
		} else {
			response.sendRedirect("product.jsp");
		}
	} catch (Exception e) {
		response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>