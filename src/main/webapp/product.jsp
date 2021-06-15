<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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
		<!-- ======= Counts Section ======= -->
		<section id="counts" class="counts">
			<div class="container" data-aos="fade-up">

				<div class="row gy-4">

					<div class="col-lg-4 col-md-6">
						<div class="count-box">
							<i class="bi bi-emoji-smile"></i>
							<div>
								<span data-purecounter-start="0" data-purecounter-end="24834"
									data-purecounter-duration="1" class="purecounter"></span>
								<p>Happy Customers</p>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6">
						<div class="count-box">
							<i class="bi bi-journal-richtext" style="color: #ee6c20;"></i>
							<div>
								<span data-purecounter-start="0" data-purecounter-end="324554"
									data-purecounter-duration="1" class="purecounter"></span>
								<p>Food served</p>
							</div>
						</div>
					</div>


					<div class="col-lg-4 col-md-6">
						<div class="count-box">
							<i class="bi bi-people" style="color: #bb0852;"></i>
							<div>
								<span data-purecounter-start="0" data-purecounter-end="15"
									data-purecounter-duration="1" class="purecounter"></span>
								<p>Hard Workers</p>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Counts Section -->



		<!-- ======= Services Section ======= -->
		<section id="services" class="services">

			<div class="container" data-aos="fade-up">

				<header class="section-header">
					<h2>Food categories</h2>
					<p>We offer the best food known to man</p>
				</header>

				<div class="row gy-4">

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="200">
						<div class="service-box blue">
							<i class="icon"><img
								src="assets/img/product/All-American-Burger-1400x700.jpg"
								class="img-fluid" alt="Girl in  jacket"></i>
							<h3>Breakfast</h3>
							<p>Our breakfast is unrivaled in the food industry, ensuring
								that our customers come back wanting more!</p>
							<form action="product" method="POST">
							<input type="hidden" name="type" value="val" />
							<a href="product" class="read-more" onclick="event.preventDefault(); this.parentNode.submit()"><span>Browse
									the breakfast section</span> <i class="bi bi-arrow-right"></i></a>
									</form>
						</div>
					</div>

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="300">
						<div class="service-box orange">
							<i class="icon"><img
								src="assets/img/product/Cheeseburger-and-Fries.jpg"
								class="img-fluid" alt="Girl in  jacket"></i>
							<h3>Lunch/Dinner</h3>
							<p>Our lunch and dinner will ensure that you are too full to
								even move! This is a must try</p>
								
							<a href="productListing.jsp?lunch" class="read-more"><span>Browse
									the Lunch/Dinner section</span> <i class="bi bi-arrow-right"></i></a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="400">
						<div class="service-box green">
							<i class="icon"><img
								src="assets/img/product/Spicy-Mexican-Burger-and-Fries.jpg"
								class="img-fluid" alt="Girl in  jacket"></i>
							<h3>Signature Dishes</h3>
							<p>
								Our signature dishes are approved by renowned chefs around the
								world like <b>Jericho Jehammed</b> and <b>Mattingson Matto</b>.
								It will be a sin to not try it!
							</p>
							<a href="productListing.jsp?signature" class="read-more"><span>Browse
									the Lunch/Dinner section</span> <i class="bi bi-arrow-right"></i></a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="500">
						<div class="service-box red">
							<i class="icon"><img
								src="assets/img/product/All-American-Burger-1400x700.jpg"
								class="img-fluid" alt="Girl in  jacket"></i>
							<h3>Main Dishes</h3>
							<p>Our main dishes exude the mouth-watering and appetising
								taste not known to humanity before this, saying it is good is a
								gross understatement.</p>
							<a href="productListing.jsp?main" class="read-more"><span>Browse
									the Main Dishes section</span> <i class="bi bi-arrow-right"></i></a>
						</div>
					</div>

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="600">
						<div class="service-box purple">
							<i class="icon"><img
								src="assets/img/product/French-Fries-and-Onion-Rings.jpg"
								class="img-fluid" alt="Girl in  jacket"></i>
							<h3>Side Dishes</h3>
							<p>With a palatable and delightful array of dishes, allowing
								our well-esteemed customers to have a wide selection of choice!</p>
							<form action="add" method="get">

								<a href="productlisting.jsp?side" class="read-more"><span>Browse
										the Side Dishes section</span> <i class="bi bi-arrow-right"></i></a>
							</form>
						</div>
					</div>

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="700">
						<div class="service-box pink">
							<i class="icon"><img
								src="assets/img/product/Classic-Shakes.jpg" class="img-fluid"
								alt="Girl in  jacket"></i>
							<h3>Desserts</h3>
							<p>Our desserts will make you quaver! Buy them before it is
								all sold out</p>
							<a href="productlisting.jsp?desserts" class="read-more"><span>Browse
									the Desserts section</span> <i class="bi bi-arrow-right"></i></a>
						</div>
					</div>

				</div>

			</div>

		</section>
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