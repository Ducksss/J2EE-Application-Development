<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String userRole = (String) session.getAttribute("sessUserRole");
	if (userRole == null) {
		response.sendRedirect("index.jsp");
	} else {
		if (userRole.equals("Customer")) {
			response.sendRedirect("index.jsp");
		}
	}
	%>
</body>
</html>