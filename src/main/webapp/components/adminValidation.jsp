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
	try {
		String userRole = (String) session.getAttribute("sessUserRole");
		if (userRole == null) {
			response.sendRedirect("index.jsp");
		} else {
			if (userRole.equals("Customer")) {
		response.sendRedirect("index.jsp");
			}
		}
	} catch (Exception e) {
		// if session times out, it means that there will be no userRole either ways
		// this is just a failproof way
		response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>