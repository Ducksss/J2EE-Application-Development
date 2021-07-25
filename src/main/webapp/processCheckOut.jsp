<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@page import="products.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {
		double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
		int sessUserID = (int) session.getAttribute("sessUserID");
		ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("product");

		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// if the email is not associated with an account!
		String insertSQL = "INSERT INTO sp_shop.reciepts(user_id, total_price) VALUES (?, ?)";
		PreparedStatement pstat = conn.prepareStatement(insertSQL);
		pstat.setInt(1, sessUserID);
		pstat.setString(2, String.format("%.2f", totalPrice));

		int count = pstat.executeUpdate();

		if (count > 0) {
			insertSQL = "SELECT * FROM sp_shop.reciepts where user_id = ? ORDER BY reciept_id desc;";
			pstat = conn.prepareStatement(insertSQL);
			pstat.setInt(1, sessUserID);
			int reciept_id = 0;

			ResultSet rs = pstat.executeQuery();
			boolean first = true;
			if (rs.next()) {
				reciept_id = rs.getInt("reciept_id");
				first = false;
			}

			for (int i = 0; i < productList.size(); i++) {
				out.println("product id " + productList.get(i).getProductID());
				out.println("product quantity " + productList.get(i).getQuantity());
		
				for (int n = 0; n < productList.get(i).getQuantity(); n++) {
					// if the email is not associated with an account!
					insertSQL = "INSERT INTO sp_shop.orders(user_id, product_id, reciept_id) VALUES (?, ?, ?)";
					pstat = conn.prepareStatement(insertSQL);
					pstat.setInt(1, sessUserID);
					pstat.setInt(2, productList.get(i).getProductID());
					pstat.setInt(3, reciept_id);
		
					count = pstat.executeUpdate();
				}
			}

			response.sendRedirect("index.jsp");
		} else {

		}
	} catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>