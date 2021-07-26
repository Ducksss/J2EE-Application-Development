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



		<!-- ======= Blog Single Section ======= -->
		<section id="blog" class="blog">
			<div class="container" data-aos="fade-up">

				<div class="row">

					<div class="col-lg-8 entries">


						<br> <br> <br> <br> <br>

						<div class="blog-comments">
							<%
							try {
								String userRole = (String) session.getAttribute("sessUserRole");
								if (userRole == null) {
							%>
							<hr>
							<h3>Sign in to leave an inquiry!</h3>
							<%
							} else {
							int sessUserID = (int) session.getAttribute("sessUserID");
							%>
							<div class="reply-form">
								<h4>Leave an inquiry, are there any issues you would like
									to address?</h4>
								<p>Your inquiries would be published to the admin</p>
								<form action="customerInquiry" method="POST"  novalidate>
									<div class="row">
										<div class="col form-group">
											<textarea class="form-control" placeholder="Your Inquiry*"
												name="content" id="content" required></textarea>
										</div>
									</div>

									 <input type="hidden"
										id="fk_user_id" name="fk_user_id" value="<%=sessUserID%>">
									<button type="submit" class="btn btn-primary">Post
										Inquiry</button>
								</form>
								<p>
									Alternatively, you can contact us at <br><br>
									<strong>Location:</strong>Woodlands hawker center, #01-437 <br>
									<strong>Phone:</strong> +65 9647 2290 <br> <strong>Email:</strong>
									pinzheng61.20@ichat.sp.edu.sg<br>
								</p>
							</div>
							<%
							}
							} catch (Exception e) {
							}
							%>
						</div>
						<!-- End blog comments -->

					</div>
					<!-- End blog entries list -->
				</div>
				</div>
		</section>
		<!-- End Blog Single Section -->

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