<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="model.*"%>
<%@page import="orders.OrderManagement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Atlas</title>
<meta content="" name="description">

<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Indie+Flower&family=Pangolin&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"></script>
<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"
	rel="stylesheet">


<!-- Template Main CSS File -->
<link href="assets/css/form-validation.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: FlexStart - v1.3.0
  * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<!-- ======= Validation ======= -->
	<%@ include file="./components/adminValidation.jsp"%>

	<!-- ======= Header ======= -->
	<%@ include file="./components/header.jsp"%>
	<!-- End Header -->

	<main id="main">
		<!-- ======= Features Section ======= -->
		<section id="features" class="features">
			<div class="container" data-aos="fade-up">

				<!-- Start of View Users -->
				<div>
					<div class="row feture-tabs">
						<ol class="breadcrumb"
							style="margin-top: -5rem; margin-left: 1rem;">
							<li style="display: inline-block;"><a href="index.jsp"
								style="text-decoration: none; margin: 0; padding: 0; font-size: 100%; vertical-align: baseline; background: transparent;">Home</a></li>
							<li style="display: inline-block;" class="activeStatus"><a
								href="#"
								style="text-decoration: none; margin: 0; padding: 0; font-size: 100%; vertical-align: baseline; background: transparent;">
							</a>View data</li>
						</ol>
						<h4 class="sech4" style="font-family: 'Pangolin'; font-size: 3em">Listing
							of Orders</h4>
					</div>
				</div>
				<table id="orders" class="display">
					<thead>
						<tr>
							<th>Receipt ID</th>
							<th>Email</th>
							<th>Product Name</th>
							<th>Cost Price</th>
							<th>Retail Price</th>
							<th>Date of Order</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tbody>
						<%
						ObtainAdminOrderInformation ObtainAdminOrderInformation = new ObtainAdminOrderInformation();
						ArrayList<OrderManagement> OrderManagement = ObtainAdminOrderInformation.getAllAdminOrderInformation();

						for (OrderManagement s : OrderManagement) {
						%>
						<tr>
							<th><%=s.getOrderID()%></th>
							<th><%=s.getEmail()%></th>
							<td><%=s.getProductTitle()%></td>
							<td><%=s.getCostPrice()%></td>
							<td><%=s.getRetailPrice()%></td>
							<td><%=s.getCreatedAt()%></td>
							<td><%=s.getQuantity()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>

				<!-- Start of best selling products -->
				<div>
					<div class="row feture-tabs">
						<h4 class="sech4" style="font-family: 'Pangolin'; font-size: 3em">Products
							performances</h4>
					</div>
				</div>

				<table id="tally" class="display">
					<thead>
						<tr>
							<th>ID</th>
							<th>Product Name</th>
							<th>Number of product sold</th>
						</tr>
					</thead>
					<tbody>
						<%
						// Step1: Load JDBC Driver
						Class.forName("com.mysql.jdbc.Driver"); //can be omitted for newer version of drivers
						// Step 2: Define Connection URL
						connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";
						// Step 3: Establish connection to URL
						conn = DriverManager.getConnection(connURL);
						// Step 4: Create Statement object
						Statement stmt = conn.createStatement();
						// Step 5: Execute SQL Command
						String sqlStr = "SELECT orders.product_id, products.product_title, COUNT(*) as tally FROM sp_shop.orders orders, sp_shop.products products where products.product_id = orders.product_id GROUP BY orders.product_id ORDER BY tally desc;";
						rs = stmt.executeQuery(sqlStr);

						int id2 = 1;
						// Step 6: Process Result
						while (rs.next()) {
							String productTitle = rs.getString("product_title");
							String tally = rs.getString("tally");
						%>
						<tr>
							<th><%=id2%>
							<th><%=productTitle%></th>
							<td><%=tally%></td>
						</tr>
						<%
						id2++;
						}
						%>
					</tbody>
				</table>

				<div>
					<div class="row feture-tabs">
						<h4 class="sech4" style="font-family: 'Pangolin'; font-size: 3em">Customers
							with highest purchase by value</h4>
					</div>
				</div>
				<!-- End of View Admins -->
				<table id="customersProducts" class="display">
					<thead>
						<tr>
							<th>Recept ID</th>
							<th>User Name</th>
							<th>Email</th>
							<th>Sum of total purchases</th>
						</tr>
					</thead>

					<tbody>
						<%
						// Step 5: Execute SQL Command
						sqlStr = "SELECT users.username, users.email, reciepts.user_id, SUM(total_price) as total_price FROM sp_shop.reciepts reciepts, sp_shop.users users where reciepts.user_id = users.user_id group by users.user_id;";
						rs = stmt.executeQuery(sqlStr);
						int id3 = 1;

						// Step 6: Process Result
						while (rs.next()) {
							String username = rs.getString("username");
							String email = rs.getString("email");
							double totalPrice = rs.getDouble("total_price");
						%>
						<tr>
							<th><%=id3%></th>
							<td><%=username%></td>
							<td><%=email%></td>
							<td><%=String.format("%.2f", totalPrice)%></td>
						</tr>
						<%
						id3++;
						}
						%>
					</tbody>
				</table>
				<div>
					<div class="row feture-tabs">
						<h4 class="sech4" style="font-family: 'Pangolin'; font-size: 3em">Listing
							of customers who purchased certain products</h4>
					</div>
				</div>
				<!-- End of View Admins -->
				<table id="customers" class="display">
					<thead>
						<tr>
							<th>Order ID</th>
							<th>User Name</th>
							<th>Email</th>
							<th>Product Title</th>
							<th>Date of Order</th>
						</tr>
					</thead>

					<tbody>
						<%
						// Step 5: Execute SQL Command
						sqlStr = "SELECT order_id,username,email,product_title,orders.created_at FROM sp_shop.orders INNER JOIN users ON users.user_id = orders.user_id INNER JOIN products ON products.product_id = orders.product_id";
						rs = stmt.executeQuery(sqlStr);

						// Step 6: Process Result
						while (rs.next()) {
							int orderID = rs.getInt("order_id");
							String username = rs.getString("username");
							String email = rs.getString("email");
							String productTitle = rs.getString("product_title");
							String createdAt = rs.getString("orders.created_at");
						%>
						<tr>
							<th><%=orderID%></th>
							<td><%=username%></td>
							<td><%=email%></td>
							<td><%=productTitle%></td>
							<td><%=createdAt%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>

				<!-- End of View Users -->
			</div>
		</section>
		<!-- End Features Section -->
		<script type="text/javascript">
			$(document).ready(function() {
				$('#orders').DataTable({
					"order" : [ [ 0, "asc" ] ]
				});
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#tally').DataTable({
					"order" : [ [ 2, "desc" ] ]
				});
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#customers').DataTable({
					"order" : [ [ 3, "desc" ] ]
				});
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#customersProducts').DataTable({
					"order" : [ [ 3, "desc" ] ]
				});
			});
		</script>
	</main>

	<!-- End #main -->
	<!-- ======= Footer ======= -->
	<%@ include file="./components/footer.jsp"%>

	<!-- End Footer -->
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/purecounter/purecounter.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<script src="assets/js/form-validation.js"></script>
	<script src="extensions/editable/bootstrap-table-editable.js"></script>
</body>

</html>