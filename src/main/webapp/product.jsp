<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@page import="products.Product"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>FlexStart Bootstrap Template - Index</title>
<meta content="" name="description">

<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
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
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: FlexStart - v1.3.0
  * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<!-- ======= Header ======= -->
	<%@ include file="./components/header.jsp"%>
	<!-- End Header -->

	<main id="main">
		<%
		boolean isDuplicate = false;
		ResultSetMetaData rsmd = null;
		rs = null;
		String categoryName = null;
		try {
			String category = (String) session.getAttribute("productid");
			String product_id = (String) session.getAttribute("productid");
			if (product_id == null) {
				response.sendRedirect("index.jsp");
			}

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			conn = DriverManager.getConnection(connURL);

			// instead of editing directly, use ? to prevent injection attacks
			sql = "SELECT * FROM sp_shop.products products where product_id = ?";

			// executing to DB - Statement to check if an account exist before it
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_id);
			rs = pstmt.executeQuery();

			String product_title = "";
			String detail_description = "";
			String cost_price = "";
			String retail_price = "";
			int stock_quantity = 0;
			String image_location = "";

			if (rs.next()) {
				product_title = rs.getString("product_title");
				detail_description = rs.getString("detail_description");
				cost_price = String.format("%.2f", rs.getDouble("cost_price"));
				retail_price = String.format("%.2f", rs.getDouble("retail_price"));
				stock_quantity = rs.getInt("stock_quantity");
				image_location = rs.getString("image_location");
			}
		%>
		<!-- ======= Services Section ======= -->
		<section id="portfolio-details" class="portfolio-details">
			<div class="container">

				<div class="row gy-4">
					<div class="row gy-4"></div>
					<div class="row gy-4"></div>
					<div class="row gy-4"></div>
					<div class="row gy-4"></div>


					<div class="col-lg-8">
						<div class="portfolio-details-slider swiper-container">
							<div class="swiper-wrapper align-items-center">

								<div class="swiper-slide">
									<img src="<%=image_location%>" alt="">
								</div>
							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="portfolio-info">
							<h3><%=product_title%></h3>
							<ul>
								<li><strong>Price</strong>: <%=retail_price%></li>
								<li><strong>Stock Quantity</strong>: <%=stock_quantity%></li>
								<li><strong>Category</strong>: <%
								sql = "SELECT * FROM sp_shop.category_tags category_tags, sp_shop.category category where category.category_id = fk_category_id and category_tags.fk_product_id = ?";
								// executing to DB - Statement to check if an account exist before it
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, product_id);
								rs = pstmt.executeQuery();

								while (rs.next()) {
									out.print(rs.getString("catname") + "\n");
								}
								%></li>
								<li>
									<form method="POST" action="addToCart.jsp">
										<input type="hidden" id="productTitle" name="productTitle"
											value="<%=product_title%>"> <input type="hidden"
											id="costPrice" name="costPrice" value="<%=cost_price%>">
										<input type="hidden" id="retailPrice" name="retailPrice"
											value="<%=retail_price%>"> <input type="hidden"
											id="stockQuantity" name="stockQuantity"
											value="<%=stock_quantity%>">
										<button type="submit" class="btn btn-primary">Add to
											Cart</button>
									</form>
								</li>
							</ul>
						</div>
						<div class="portfolio-description">
							<h2>Description</h2>
							<p><%=detail_description%></p>
						</div>
					</div>

				</div>

			</div>
		</section>
		<%
		conn.close();
		} catch (Exception e) {
		out.print(e);
		}
		%>
		<!-- End Portfolio Details Section -->
		<!-- End Services Section -->
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

</body>

</html>