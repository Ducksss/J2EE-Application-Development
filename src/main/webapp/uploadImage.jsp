<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload</title>
</head>
<body>
	<h1>File Upload</h1>
	<form action="UploadServlet" method="POST"
		enctype="multipart/form-data">
		Select file to upload: <input type="file" name="file" size="60" /><br />
		<br /> <input type="submit" value="Upload" />
	</form>
</body>
</html>