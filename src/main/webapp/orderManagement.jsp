<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="model.*"%>
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
							of Products with minimum stock</h4>
					</div>
				</div>
				<table class="display" >
					<tbody>
						<tr>
							<td>Display stock below this certain threshold:&nbsp</td>
							</tr>
							<tr>
							<td><input type="text" id="max" name="max" value="10"></td>
						</tr>
					</tbody>
				</table>
				<table id="orders" class="display">

					<thead>
						<tr>
							<th>Order_id</th>
							<th>Product Name</th>
							<th>Cost Price</th>
							<th>Retail Price</th>
							<th>Stock Quantity</th>
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
						String sqlStr = "SELECT * FROM sp_shop.products;";
						rs = stmt.executeQuery(sqlStr);

						// Step 6: Process Result
						while (rs.next()) {
							int productID = rs.getInt("product_id");
							String productTitle = rs.getString("product_title");
							String costPrice = rs.getString("cost_price");
							String retailPrice = rs.getString("retail_price");
							String stock_quantity = rs.getString("stock_quantity");
						%>
						<tr>
							<th><%=productID%></th>
							<td><%=productTitle%></td>
							<td><%=costPrice%></td>
							<td><%=retailPrice%></td>
							<td><%=stock_quantity%></td>

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
			$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
				var min = 0;
				var max = parseInt($('#max').val(), 10);
				var age = parseFloat(data[4]) || 0; // use data for the stock column

				if ((isNaN(min) && isNaN(max)) || (isNaN(min) && age <= max)
						|| (min <= age && isNaN(max))
						|| (min <= age && age <= max)) {
					return true;
				}
				return false;
			});

			$(document).ready(function() {
				var table = $('#orders').DataTable();

				$('#min, #max').keyup(function() {
					table.draw();
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