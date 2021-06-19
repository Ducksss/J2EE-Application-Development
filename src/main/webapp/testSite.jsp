<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="products.Product"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("product");

	try {
		// get (int ind): retrieve the object at index ind
		for (int i = 0; i < productList.size(); i++) {
			//extracts the value out from the arrayList
			String selectISBN = productList.get(i).getProductTitle();
			double retailPrize = productList.get(i).getRetailPrice();
			out.print(selectISBN);
			out.print(retailPrize);
		}
	} catch (Exception e) {

	}
	%>
</body>
</html>