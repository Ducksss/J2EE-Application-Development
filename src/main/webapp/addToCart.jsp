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
	try {
		String userRole = (String) session.getAttribute("sessUserRole");
		if (userRole == null) {
			response.sendRedirect("login.jsp");
		} else {
			//extracts the value from the form
			int productID = Integer.parseInt(request.getParameter("productID"));
			String productTitle = request.getParameter("productTitle");
			double costPrice = Double.parseDouble(request.getParameter("costPrice"));
			double retailPrice = Double.parseDouble(request.getParameter("retailPrice"));
			int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));

			//create a book object
			Product userProduct = new Product(productID, productTitle, costPrice, retailPrice, stockQuantity);

			ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("product");

			if ((productList == null)) {
		//create a arrayList
		ArrayList<Product> productArrayList = new ArrayList<Product>();
		productArrayList.add(userProduct);
		session.setAttribute("product", productArrayList);
			} else {
		//rewrite the booklist session
		productList.add(userProduct);
		session.setAttribute("product", productList);
			}

			//redirects upon success
			response.sendRedirect("cart.jsp");
		}
	} catch (Exception e) {
		response.sendRedirect("product.jsp?errCode=failed");
	}
	%>
</body>
</html>