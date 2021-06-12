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
	// for checking the session is available or not, if not available it will throw exception, "Session already invalidated."
	String varChar = (String) session.getAttribute("sessUserName");
	if (!varChar.equals(null)) {
		session.invalidate();
		response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>