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
<link href="assets/css/style.css" rel="stylesheet">

<script src="https://js.stripe.com/v3/"></script>
<script>
	var stripe = Stripe('pk_test_51JIbDeEw27jYt5tUaGWRZ9N3tt3nJI387Ru6qoWX6ceXp6843eorzSIyQL99H6n8QuGVG1ebdHhqnRVFHXQ4gZjo00RyARsu5v');
	var elements = stripe.elements();
</script>

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
			<div class="container">

				<!-- Feature Tabs -->
				<div>
					<div class="row feture-tabs" data-aos="fade-up">
						<div class="col-lg-10">
							<h3 class="sech3" style="font-family: 'Pangolin';">My cart</h3>
						</div>
					</div>
					<p class="secp"></p>
				</div>
				<table class="table table-hover">
					<thead class="thead-light">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Product name</th>
							<th scope="col">Quantity</th>
							<th scope="col">Remove</th>
							<th scope="col">Price</th>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("product");
						int id = 1;
						double total = 0;
						// Step 6: Process Result

						try {
							for (int i = 0; i < productList.size(); i++) {
								int quantity = productList.get(i).getQuantity();
								int productID = productList.get(i).getProductID();
								String productTitle = productList.get(i).getProductTitle();
								double retailPrice = productList.get(i).getRetailPrice();
								String formattedRetailPrice = String.format("%.2f", retailPrice);
								double rowIndividualPrice = retailPrice * quantity;

								total += rowIndividualPrice;
						%>
						<tr>
							<th scope="row"><%=i + 1%></th>
							<td><%=productTitle%></td>
							<td>
								<div style="display: flex;">
									<!-- Decrement product -->
									<form method="POST" action="ProductCartDecrement"
										class="form-inline">
										<input type="hidden" name="productID" value="<%=productID%>"
											class="form-input">
										<button type="submit"
											style="border: none; background: transparent;">
											<i class="fa fa-minus-square"
												style="margin-right: 1rem; margin-top: 0.65rem;"> </i>
										</button>
									</form>
									<div>
										<input type="text" name="quantity" class="form-control"
											value="<%=quantity%>" readonly style="text-align: center;">
									</div>
									<!-- Increment product -->
									<form action="ProductCartAddition" method="POST"
										class="form-inline">
										<input type="hidden" name="productID" value="<%=productID%>"
											class="form-input">
										<button type="submit"
											style="border: none; background: transparent;">
											<i class="fa fa-plus-square"
												style="margin-left: 1rem; margin-top: 0.65rem;"></i>
										</button>
									</form>
								</div>
							</td>
							<!-- Remove product -->
							<td scope="col">
								<form method="POST" action="ProductCartDeletion">
									<input type="hidden" name="productID" value=<%=productID%>>
									<button type="submit" class="btn btn-danger">Remove
										from cart</button>
								</form>
							</td>
							<td scope="col">$<%=String.format("%.2f", rowIndividualPrice)%></td>
							<%
							id++;
							}
							%>
						</tr>
						<%
						} catch (Exception e) {
						%>
						<tr>
							<td colspan=5>You have nothing in your cart so far!</td>
						</tr>
						<%
						}

						// Step 7: Close connection
						conn.close();
						%>
					</tbody>
					<tfoot>
						<%
						try {
							for (int i = 0; i < productList.size(); i++) {
							}
						%>
						<tr>
							<td scope="col" colspan="4" style="border-style: none;">
								Price:</td>
							<td colspan="1" style="border-style: none;">$<%=String.format("%.2f", total)%></td>
						</tr>
						<tr>
							<td scope="col" colspan="4" style="border-style: none;">GST:</td>
							<td colspan="1" style="border-style: none;">$<%=String.format("%.2f", total * 0.07)%></td>
						</tr>
						<tr>
							<td scope="col" colspan="4" style="border-style: none;">Delivery
								fee:</td>
							<td colspan="1" style="border-style: none;">FREE</td>
						</tr>
						<tr>
							<td scope="col" colspan="4"
								style="font-weight: bold; font-size: 1.2rem;">Total price:</td>
							<td scope="col" colspan="1" style="font-weight: bold;">$<%=String.format("%.2f", total * 0.07 + total)%></td>
						</tr>
						<tr>
							<td colspan="5" class="right"><a href="checkOut.jsp"><button
										type="button" class="btn btn-primary">Check out</button></a></td>
						</tr>
						<%
						} catch (Exception e) {

						}
						%>
					</tfoot>
				</table>
			</div>
		</section>
		<!-- End Features Section -->
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