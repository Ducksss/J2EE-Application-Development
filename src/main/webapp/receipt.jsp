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

	<!-- ======= GETTER ======= -->
	<%
	int user_id = (int) session.getAttribute("sessUserID");
	int reciept_id = Integer.parseInt(request.getParameter("reciept_id"));

	System.out.println(user_id);
	System.out.println(reciept_id);

	// Step1: Load JDBC Driver
	Class.forName("com.mysql.jdbc.Driver"); //can be omitted for newer version of drivers
	// Step 2: Define Connection URL
	connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";
	// Step 3: Establish connection to URL
	conn = DriverManager.getConnection(connURL);
	// Step 4: Create Statement object
	Statement stmt = conn.createStatement();
	// Step 5: Execute SQL Command
	String sqlStr = "SELECT * FROM sp_shop.reciepts where user_id = ? and reciept_id = ?;";
	pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, user_id);
	pstmt.setInt(2, reciept_id);
	rs = pstmt.executeQuery();

	// Step 6: Process Result
	String total_price = "";
	if (rs.next()) {
		total_price = rs.getString("total_price");
	}
	System.out.println(total_price);
	%>
	<main id="main">
		<!-- ======= Features Section ======= -->
		<section id="features" class="features">
			<div class="container" data-aos="fade-up">

				<!-- Start of View Product -->
				<div>
					<div class="row feture-tabs" data-aos="fade-up">
						<ol class="breadcrumb"
							style="margin-top: -5rem; margin-left: 1rem;">

						</ol>
						<h4 class="sech4" style="font-family: 'Pangolin'; font-size: 3em">
							Transaction Reference: ID</h4>
					</div>
				</div>
				<table class="table table-hover">
					<thead class="thead-light">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Product name</th>
							<th scope="col">Brief description</th>
							<th scope="col">Retail price</th>
							<th scope="col">Stock quantity</th>
							<th scope="col">Edit</th>
							<th scope="col">Delete</th>
						</tr>
					</thead>
					<tbody>
						<%
						int id = 1;
						sqlStr = "SELECT * FROM sp_shop.orders orders, sp_shop.products products where orders.user_id = ? and orders.reciept_id = ? and orders.product_id = products.product_id;";
						pstmt = conn.prepareStatement(sqlStr);
						pstmt.setInt(1, user_id);
						pstmt.setInt(1, reciept_id);
						rs = pstmt.executeQuery();
						// Step 6: Process Result
						while (rs.next()) {
							reciept_id = rs.getInt("reciept_id");
							String product_title = rs.getString("product_title");
							String brief_description = rs.getString("brief_description");
							double retail_price = rs.getDouble("retail_price");
						%>
						<tr>
							<th scope="row"><%=id%></th>
							<td>ID<%=reciept_id%></td>
							<td>$<%=String.format("%.2f", total_price)%></td>
							<td>
								<form method="POST" action="receipt.jsp">
									<input type="hidden" value="<%=reciept_id%>" name="reciept_id">
									<input type="submit" value="View more" class="btn btn-primary">
								</form>
							</td>
						</tr>
						<%
						id++;
						}

						// Step 7: Close connection
						conn.close();
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" class="right"><a href="addProduct.jsp"><button
										type="button" class="btn btn-primary">Add Product</button></a></td>
						</tr>
					</tfoot>
				</table>
				<!-- End of View product -->
			</div>
		</section>
		<!-- End Features Section -->
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