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
	<%
	try {
		int category_id = Integer.parseInt(request.getParameter("categoryID"));

		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// instead of editing directly, use ? to prevent injection attacks
		String sql = "DELETE FROM sp_shop.category WHERE category_id = ?";

		/// executing to DB - Statement to check if an account exist before it
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, category_id);

		int count = pstmt.executeUpdate();

		if (count > 0) {
			response.sendRedirect("editCategory.jsp?successCode=successInsertion&categoryID=" + category_id);
		} else {
			response.sendRedirect("editCategory.jsp?errCode=databaseFailed&categoryID=" + category_id);
		}
		conn.close();
	} catch (Exception e) {

	}
	%>
</body>
</html>