<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%-- <jsp:forward page="/product" >
<jsp:param name="username" value="Smith" />
</jsp:forward> --%>
	<script type="text/javascript">
		function sumRes() {
			document.getElementById("submitForm").submit();
		}
	</script>
	<form action="product" method="post" id="submitForm">
		<input type="hidden" name="informal" value="hi">
	</form>
	<%
	out.print("aa");
	%>
	<script type="text/javascript">
		sumRes();
	</script>

</body>
</html>