<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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

	<main id="main">
		<!-- ======= Features Section ======= -->
		<section id="features" class="features">
			<div class="container" data-aos="fade-up">

				<!-- Feature Tabs -->
				<div>
					<div class="row feture-tabs" data-aos="fade-up">
						<ol class="breadcrumb"
							style="margin-top: -5rem; margin-left: 1rem;">
							<li style="display: inline-block;"><a href="index.jsp"
								style="text-decoration: none; margin: 0; padding: 0; font-size: 100%; vertical-align: baseline; background: transparent;">Home</a></li>
							<li style="display: inline-block;" class="activeStatus"><a
								href="#"
								style="text-decoration: none; margin: 0; padding: 0; font-size: 100%; vertical-align: baseline; background: transparent;">
							</a>Add Products</li>
						</ol>
						<h4 class="sech4" style="font-family: 'Pangolin'; font-size: 3em">Admin
							Console - Add product</h4>
					</div>
				</div>
				<div class="row g-5">
					<div class="col-md-11 col-lg-11">
						<form class="needs-validation" method="POST" action="addProduct"
							enctype="multipart/form-data" novalidate>
							<div class="row g-3">
								<div class="col-sm-12">
									<%
									if (request.getParameter("errCode") == null) {
									} else if (request.getParameter("errCode").equals("notAnImage")) {
									%>
									<p style="color: red">The file you provided is not an
										image!</p>
									<%
									} else if (request.getParameter("errCode").equals("noCategorySelected")) {
									%>
									<p style="color: red">You did not specify any category!</p>
									<%
									} else if (request.getParameter("errCode").equals("productAlreadyExists")) {
									%>
									<p style="color: red">The name for your product has already been taken!</p>
									<%
									} else {
									%>
									<p style="color: red">Insertion failure!</p>
									<%
									}
									%>

									<%
									if (request.getParameter("successCode") == null) {
									%>
									<%
									} else if (request.getParameter("successCode").equals("successInsertion")) {
									%>
									<p style="color: green">Success! The product have been
										registered!</p>
									<%
									}
									%>
								</div>
								<div class="col-sm-12">
									<label for="productTitle" class="form-label">Product
										title</label> <input type="text" class="form-control"
										id="productTitle" placeholder="" value="" name="productTitle"
										required>
									<div class="invalid-feedback">A Valid product title is
										required.</div>
								</div>

								<div class="col-sm-12">
									<label for="briefDescription" class="form-label">A
										Brief description</label>
									<textarea type="text" class="form-control"
										id="briefDescription" placeholder="" value="" rows="2"
										name="briefDescription" required></textarea>
									<div class="invalid-feedback">A valid short product
										description is required.</div>
								</div>

								<div class="col-sm-12">
									<label for="detailedDescription" class="form-label">A
										detailed description</label>
									<textarea type="text" class="form-control"
										id="detailedDescription" placeholder="" value="" rows="4"
										name="detailedDescription" required></textarea>
									<div class="invalid-feedback">A valid detailed product
										description is required.</div>
								</div>

								<div class="col-sm-4">
									<label for="costPrice" class="form-label">Cost Price</label><input
										type="number" class="form-control" id="costPrice"
										placeholder="" value="0.80" name="costPrice" min="0.00"
										step="0.01" required>
									<div class="invalid-feedback">A Valid cost price is
										required.</div>
								</div>

								<div class="col-sm-4">
									<label for="retailPrice" class="form-label">Retail
										price</label><input type="number" class="form-control"
										id="retailPrice" placeholder="2.10" value=""
										name="retailPrice" min="0.00" step="0.01" required>
									<div class="invalid-feedback">A Valid retail price is
										required.</div>
								</div>

								<div class="col-sm-4">
									<label for="stockQuantity" class="form-label">Stock
										quantity</label><input type="number" class="form-control"
										id="retailPrice" placeholder="" value="" name="stockQuantity"
										min="0.00" step="0.01" required>
									<div class="invalid-feedback">A Valid stock price is
										required.</div>
								</div>
							</div>

							<hr class="my-4">

							<h4 class="mb-3">Categories</h4>
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
							String sqlStr = "SELECT * FROM sp_shop.category";
							rs = stmt.executeQuery(sqlStr);

							// Step 6: Process Result
							while (rs.next()) {
								int id = rs.getInt("category_id");
								String name = rs.getString("catname");
							%>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="categories"
									name="categories" value=<%=id%>> <label
									class="form-check-label" for="categories"><%=name%></label>
							</div>
							<%
							}

							// Step 7: Close connection
							conn.close();
							%>

							<hr class="my-4">

							<h4 class="mb-3">Image</h4>

							<div class="my-3">
								<input class="input1" type="file" id="img" name="img">
							</div>

							<hr class="my-4">

							<button class="w-100 btn btn-primary btn-lg" type="submit">Proceed
								to publish</button>
						</form>
					</div>
				</div>
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

</body>

</html>