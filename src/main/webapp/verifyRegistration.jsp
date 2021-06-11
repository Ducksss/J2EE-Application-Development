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
		// extracting value from the login.html form and storing it in its respective params
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String confirmPassword = request.getParameter("re_pass");

		// simple backend guard statement validation to check if the password matches!
		if (!password.equals(confirmPassword)) {
			response.sendRedirect("register.jsp?errCode=passwordUnmatch");
		}

		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");
		//Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/db1?user=adminuser&password=password&serverTimezone=UTC";
		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		//instead of editing directly, use ? to prevent injection attacks
		String sql = "SELECT * FROM sp_shop.users WHERE email = ?";

		//executing to DB - Statement to check if an account exist before it
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		ResultSet rs = pstmt.executeQuery();

		// check if an account with the email has been registered before
		if (rs.next()) {
			//if the email is associated with an account!
			response.sendRedirect("register.jsp?errCode=accountAlreadyExists");
		} else {
			//if the email is not associated with an account!
			String insertSQL = "INSERT INTO sp_shop.users (username, email, password) VALUES (?, ?, ?)";
			PreparedStatement pstat = conn.prepareStatement(insertSQL);
			pstat.setString(1, name);
			pstat.setString(2, email);
			pstat.setString(3, password);

			int count = pstat.executeUpdate();

			if (count > 0) {
		response.sendRedirect("login.jsp");
			}
		}

	} catch (Exception e) {

	}
	%>
	<div>
		<p>Uh Oh</p>
	</div>
</body>
</html>