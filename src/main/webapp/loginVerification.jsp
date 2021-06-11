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
		String email = request.getParameter("your_name");
		String password = request.getParameter("your_pass");

		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");
		//Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/db1?user=adminuser&password=password&serverTimezone=UTC";
		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		//instead of editing directly, use ? to prevent injection attacks
		String sql = "SELECT * FROM sp_shop.users WHERE email = ? AND password = ?";

		//executing to DB
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery();

		if (password.equals(null) || email.equals(null) || password == "" || email == "") {
			//checking if the password && userid with its according field
			response.sendRedirect("login.jsp?errCode=NULL");
		} else if (rs.next() == false) {
			//if no rows are fetch, that means pw / username is wrong. As such, just redirect
			response.sendRedirect("login.jsp?errCode=invalidLogin");
		} else {
			// Upon successful verification, lets redirect them to displayUser Page -->
			//storing the value from the select statement into the variables
			String username = rs.getString("username");
			String useremail = rs.getString("email");
			String role = rs.getString("type");

			// creating a sesson and setting the respective attributes
			session.setAttribute("sessUserName", username);
			session.setAttribute("sessUserEmail", useremail);
			session.setAttribute("sessUserRole", role);

			//redirects the user upon success
			response.sendRedirect("index.jsp");
		}
	} catch (Exception e) {

	}
	%>
</body>
</html>