<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@page import="products.Product"%>
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
	<%
	try {
		String userRole = (String) session.getAttribute("sessUserRole");
		if (userRole == null) {
			response.sendRedirect("index.jsp");
		} else {
			ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("product");
			if (productList.isEmpty()) {
		response.sendRedirect("cart.jsp");
			}

			if (productList.size() == 0) {
		response.sendRedirect("cart.jsp");
			}
		}
	} catch (Exception e) {
		// if session times out, it means that there will be no userRole either ways
		// this is just a failproof way
		response.sendRedirect("index.jsp");
	}
	%>

	<!-- ======= Header ======= -->
	<%@ include file="./components/header.jsp"%>
	<!-- End Header -->

	<main id="main">
		<!-- ======= Features Section ======= -->
		<section id="features" class="features">
			<div class="container" data-aos="fade-up">

				<div class="py-5 text-center">
					<h2>Checkout form</h2>
					<p class="lead">Below is an example form built entirely with
						Bootstrap's form controls. Each required form group has a
						validation state that can be triggered by attempting to submit the
						form without completing it.</p>
				</div>

				<div class="row g-5">
					<div class="col-md-5 col-lg-4 order-md-last">
						<%
						int productListSize = 0;
						ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("product");
						try {
							productListSize = productList.size();

							if (productListSize == 0) {
								response.sendRedirect("cart.jsp");
							}
						} catch (Exception e) {
						}
						%>
						<h4 class="d-flex justify-content-between align-items-center mb-3">
							<span class="text-primary">Your cart</span> <span
								class="badge bg-primary rounded-pill"><%=productListSize%></span>
						</h4>
						<ul class="list-group mb-3">
							<%
							double totalPrice = 0;
							String formmatedTotalPrice = "";
							try {
								totalPrice = 0;
								for (int i = 0; i < productList.size(); i++) {
									String productName = productList.get(i).getProductTitle();
									double retailPrice = productList.get(i).getRetailPrice();
									String formattedRetailPrice = String.format("%.2f", retailPrice);
									totalPrice += retailPrice;
							%>
							<li class="list-group-item d-flex justify-content-between lh-sm">
								<div>
									<h6 class="my-0"><%=productName%></h6>
									<small class="text-muted">Dessert</small>
								</div> <span class="text-muted">$<%=formattedRetailPrice%></span>
							</li>
							<%
							}
							formmatedTotalPrice = String.format("%.2f", totalPrice);
							} catch (Exception e) {

							}
							%>
							<li class="list-group-item d-flex justify-content-between">
								<span>Total (SGD)</span> <strong>$<%=formmatedTotalPrice%></strong>
							</li>
						</ul>
					</div>
					<div class="col-md-7 col-lg-8">
						<h4 class="mb-3">Billing address</h4>
						<%
						int user_id = 0;
						// Getting variables
						try {
							user_id = (int) session.getAttribute("sessUserID");

						} catch (Exception e) {
						}
						// Step1: Load JDBC Driver
						Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

						// Step 2: Define Connection URL
						connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

						// Step 3: Establish connection to URL
						conn = DriverManager.getConnection(connURL);

						// instead of editing directly, use ? to prevent injection attacks
						sql = "SELECT * FROM sp_shop.users WHERE user_id = ?";

						// executing to DB - Statement to check if an account exist before it
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, user_id);
						rs = pstmt.executeQuery();

						String email = "";
						String address = "";
						String username = "";
						String created_at = "";

						if (rs.next()) {
							email = rs.getString("email");
							address = rs.getString("address");
							username = rs.getString("username");
							created_at = rs.getString("created_at");
						}
						%>
						<form class="needs-validation" novalidate method="POST">
							<div class="row g-3">
								<div class="col-sm-12">
									<label for="lastName" class="form-label">Full name</label> <input
										type="text" class="form-control" id="lastName" placeholder=""
										value="<%=username%>" readonly required>
									<div class="invalid-feedback">Valid last name is
										required.</div>
								</div>

								<div class="col-12">
									<label for="email" class="form-label">Email</label> <input
										type="email" class="form-control" id="email"
										placeholder="you@example.com" value="<%=email%>" readonly>
									<div class="invalid-feedback">Please enter a valid email
										address for shipping updates.</div>
								</div>

								<div class="col-12">
									<label for="address2" class="form-label">Address</label><input
										type="text" class="form-control" id="address2"
										placeholder="Apartment or suite" value="<%=address%>">
								</div>

								<div class="col-md-6">
									<label for="country" class="form-label">Country</label> <select
										class="form-select" id="country" required>
										<option value="">Choose...</option>
										<option>Singapore</option>
									</select>
									<div class="invalid-feedback">Please select a valid
										country.</div>
								</div>

								<div class="col-md-3">
									<label for="zip" class="form-label">Postal Code</label> <input
										type="text" class="form-control" id="zip" placeholder=""
										required>
									<div class="invalid-feedback">Postal code required.</div>
								</div>

								<div class="col-md-3">
									<label for="zip" class="form-label">Zip</label> <input
										type="text" class="form-control" id="zip" placeholder=""
										required>
									<div class="invalid-feedback">Zip code required.</div>
								</div>
							</div>

							<hr class="my-4">

							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="same-address"> <label class="form-check-label"
									for="same-address">Shipping address is the same as my
									billing address</label>
							</div>

							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="save-info">
								<label class="form-check-label" for="save-info">Save
									this information for next time</label>
							</div>

							<hr class="my-4">

							<h4 class="mb-3">Payment</h4>

							<div class="my-3">
								<div class="form-check">
									<input id="credit" name="paymentMethod" type="radio"
										class="form-check-input" checked required> <label
										class="form-check-label" for="credit">Credit card</label>
								</div>
								<div class="form-check">
									<input id="debit" name="paymentMethod" type="radio"
										class="form-check-input" required> <label
										class="form-check-label" for="debit">Debit card</label>
								</div>
								<div class="form-check">
									<input id="paypal" name="paymentMethod" type="radio"
										class="form-check-input" required> <label
										class="form-check-label" for="paypal">PayPal</label>
								</div>
							</div>

							<div class="row gy-3">
								<div class="col-md-6">
									<label for="cc-name" class="form-label">Name on card</label> <input
										type="text" class="form-control" id="cc-name" placeholder=""
										required> <small class="text-muted">Full name
										as displayed on card</small>
									<div class="invalid-feedback">Name on card is required</div>
								</div>

								<div class="col-md-6">
									<label for="cc-number" class="form-label">Credit card
										number</label> <input type="text" class="form-control" id="cc-number"
										placeholder="" required>
									<div class="invalid-feedback">Credit card number is
										required</div>
								</div>

								<div class="col-md-3">
									<label for="cc-expiration" class="form-label">Expiration</label>
									<input type="text" class="form-control" id="cc-expiration"
										placeholder="" required>
									<div class="invalid-feedback">Expiration date required</div>
								</div>

								<div class="col-md-3">
									<label for="cc-cvv" class="form-label">CVV</label> <input
										type="text" class="form-control" id="cc-cvv" placeholder=""
										required>
									<div class="invalid-feedback">Security code required</div>
								</div>
							</div>

							<hr class="my-4">

							<button class="w-100 btn btn-primary btn-lg" type="submit">Continue
								to checkout</button>
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