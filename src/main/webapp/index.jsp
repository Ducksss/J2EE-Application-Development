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

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="hero d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 d-flex flex-column justify-content-center">
					<h1 data-aos="fade-up"
						style="filter: drop-shadow(15px 5px 2px black);">Atlas</h1>
					<h2 data-aos="fade-up" data-aos-delay="400"
						style="filter: drop-shadow(15px 5px 2px black);">Singapore's
						best hawker x burger food</h2>
					<div data-aos="fade-up" data-aos-delay="600">
						<div class="text-center text-lg-start">
							<a href="#about"
								class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
								<span>Get Started</span> <i class="bi bi-arrow-right"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- End Hero -->

	<main id="main">
		<!-- ======= Features Section ======= -->
		<section id="features" class="features">
			<div class="container" data-aos="fade-up">
				<header class="section-header">
					<h2>What we have to offer</h2>
				</header>

				<!-- Feature Tabs -->
				<div>
					<div class="row feture-tabs" data-aos="fade-up">
						<div class="col-lg-6">
							<h3 class="sech3">So. Crazy. Good.</h3>
							<!-- Tabs -->
							<p class="secp">Award-winning eats, over-the-top CrazyShake
								milkshakes, killer craft beers, and a popping playlist - all
								designed to deliver an awesome experience. Come kick it with us
								at Black Tap.</p>
						</div>
						<div class="col-lg-6">
							<img src="./assets/img/burger3.png" class="img-fluid" alt="">
						</div>
					</div>
				</div>

				<div class="row feture-tabs" data-aos="fade-up">
					<div class="col-lg-6">
						<img src="./assets/img/burger2.png" class="img-fluid" alt="">
					</div>
					<div class="col-lg-6">
						<h3 class="sech3">Come for the shakes. Stay for the burgers.</h3>
						<!-- Tabs -->
						<p class="secp">Inspired by the old-school NYC luncheonettes
							we grew up in, Black Tap is a fresh, fun take on the classic
							burger joint, upscale but never fussed up. Come on in for a warm
							welcome, a cold craft beer, an award-winning burger, and save
							room for one of our world-famous CrazyShakes!</p>
					</div>
				</div>
				<!-- End Feature Tabs -->
			</div>

		</section>
		<!-- End Features Section -->

		<!-- ======= Testimonials Section ======= -->
		<section id="testimonials" class="testimonials">

			<div class="container" data-aos="fade-up">

				<header class="section-header">
					<p>What our patreons say about us?</p>
				</header>

				<div class="testimonials-slider swiper-container" data-aos="fade-up"
					data-aos-delay="200">
					<div class="swiper-wrapper">

						<div class="swiper-slide">
							<div class="testimonial-item">
								<div class="stars">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i>
								</div>
								<p>Finally some genuine stuffs available in Sg in actual
									shop, not just online shopping. Superb quality supermarket.
									Thanks @Atlas!</p>
								<div class="profile mt-auto">
									<img src="./assets/img/testimonials/Users-JollieChoo.jpg"
										class="testimonial-img" alt="">
									<h3>Jollie Choo</h3>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<div class="stars">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i>
								</div>
								<p>Excellent value for money. Dry aged burger for $18.50 and
									very good quality at that! Nice juicy beef patties and
									perfectly paired with caramelised onions.</p>
								<div class="profile mt-auto">
									<img src="./assets/img/testimonials/Users-JonLee.jpg"
										class="testimonial-img" alt="">
									<h3>Jon Lee</h3>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<div class="stars">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i>
								</div>
								<p>This is just a gem with great service and really good
									food at a reasonable price. We've been coming here for many
									years and are never disappointed.</p>
								<div class="profile mt-auto">
									<img src="./assets/img/testimonials/Users-YingLi.jpg"
										class="testimonial-img" alt="">
									<h3>Ying li</h3>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<div class="stars">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i>
								</div>
								<p>This is a great place to get hearty Central and Eastern
									European fare like sausages, cheese and goulash.</p>
								<div class="profile mt-auto">
									<img src="./assets/img/testimonials/Users-ayumi.jpg"
										class="testimonial-img" alt="">
									<h3>Maruyama Ayumi</h3>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<div class="stars">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i>
								</div>
								<p>Delicious and scrumptious meal. Amazing. Thanks @Atlas</p>
								<div class="profile mt-auto">
									<img src="./assets/img/testimonials/User-jamie.jpg"
										class="testimonial-img" alt="">
									<h3>Jamie Ng</h3>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>

		</section>
		<!-- End Testimonials Section -->

		<!-- ======= Team Section ======= -->
		<section id="team" class="team">

			<div class="container" data-aos="fade-up">

				<header class="section-header">
					<h2>Team</h2>
					<p>Our hard working team</p>
				</header>

				<div class="row gy-4">
					<div class="col-lg-3 col-md-6 d-flex align-items-stretch"
						data-aos="fade-up" data-aos-delay="300">
						<div class="member">
							<div class="member-img">
								<img src="assets/img/testimonials/Users-YingLi.jpg"
									class="img-fluid" alt="">
								<div class="social">
									<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
										class="bi bi-facebook"></i></a> <a href=""><i
										class="bi bi-instagram"></i></a> <a href=""><i
										class="bi bi-linkedin"></i></a>
								</div>
							</div>
							<div class="member-info">
								<h4>Ying li</h4>
								<p>This is just a gem with great service and really good
									food at a reasonable price. We've been coming here for many
									years and are never disappointed.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 d-flex align-items-stretch"
						data-aos="fade-up" data-aos-delay="100">
						<div class="member">
							<div class="member-img">
								<img src="assets/img/testimonials/Users-JollieChoo.jpg"
									class="img-fluid" alt="">
								<div class="social">
									<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
										class="bi bi-facebook"></i></a> <a href=""><i
										class="bi bi-instagram"></i></a> <a href=""><i
										class="bi bi-linkedin"></i></a>
								</div>
							</div>
							<div class="member-info">
								<h4>Jollie Choo</h4>
								<p>Finally some genuine stuffs available in Sg in actual
									shop, not just online shopping. Superb quality supermarket.
									Thanks @Atlas!</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 d-flex align-items-stretch"
						data-aos="fade-up" data-aos-delay="200">
						<div class="member">
							<div class="member-img">
								<img src="assets/img/testimonials/Users-JonLee.jpg"
									class="img-fluid" alt="">
								<div class="social">
									<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
										class="bi bi-facebook"></i></a> <a href=""><i
										class="bi bi-instagram"></i></a> <a href=""><i
										class="bi bi-linkedin"></i></a>
								</div>
							</div>
							<div class="member-info">
								<h4>Jon Lee</h4>
								<p>Excellent value for money. Dry aged burger for $18.50 and
									very good quality at that! Nice juicy beef patties and
									perfectly paired with caramelised onions.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 d-flex align-items-stretch"
						data-aos="fade-up" data-aos-delay="400">
						<div class="member">
							<div class="member-img">
								<img src="assets/img/testimonials/Users-ayumi.jpg"
									class="img-fluid" alt="">
								<div class="social">
									<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
										class="bi bi-facebook"></i></a> <a href=""><i
										class="bi bi-instagram"></i></a> <a href=""><i
										class="bi bi-linkedin"></i></a>
								</div>
							</div>
							<div class="member-info">
								<h4>Maruyama Ayumi</h4>
								<p>This is a great place to get hearty Central and Eastern
									European fare like sausages, cheese and goulash.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Team Section -->

		<!-- ======= Clients Section ======= -->
		<section id="clients" class="clients">

			<div class="container" data-aos="fade-up">

				<header class="section-header">
					<h2>Our Clients</h2>
					<p>Temporibus omnis officia</p>
				</header>

				<div class="clients-slider swiper-container">
					<div class="swiper-wrapper align-items-center">
						<div class="swiper-slide">
							<img src="assets/img/clients/client-1.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-2.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-3.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-4.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-5.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-6.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-7.png" class="img-fluid"
								alt="">
						</div>
						<div class="swiper-slide">
							<img src="assets/img/clients/client-8.png" class="img-fluid"
								alt="">
						</div>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>

		</section>
		<!-- End Clients Section -->

		<!-- ======= Recent Blog Posts Section ======= -->
		<section id="recent-blog-posts" class="recent-blog-posts">

			<div class="container" data-aos="fade-up">

				<header class="section-header">
					<h2>Blog</h2>
					<p>Recent posts form our Blog</p>
				</header>

				<div class="row">

					<div class="col-lg-4">
						<div class="post-box">
							<div class="post-img">
								<img src="assets/img/blog/blog-1.jpg" class="img-fluid" alt="">
							</div>
							<span class="post-date">Tue, September 15</span>
							<h3 class="post-title">Eum ad dolor et. Autem aut fugiat
								debitis voluptatem consequuntur sit</h3>
							<a href="blog-singe.html" class="readmore stretched-link mt-auto"><span>Read
									More</span><i class="bi bi-arrow-right"></i></a>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="post-box">
							<div class="post-img">
								<img src="assets/img/blog/blog-2.jpg" class="img-fluid" alt="">
							</div>
							<span class="post-date">Fri, August 28</span>
							<h3 class="post-title">Et repellendus molestiae qui est sed
								omnis voluptates magnam</h3>
							<a href="blog-singe.html" class="readmore stretched-link mt-auto"><span>Read
									More</span><i class="bi bi-arrow-right"></i></a>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="post-box">
							<div class="post-img">
								<img src="assets/img/blog/blog-3.jpg" class="img-fluid" alt="">
							</div>
							<span class="post-date">Mon, July 11</span>
							<h3 class="post-title">Quia assumenda est et veritatis aut
								quae</h3>
							<a href="blog-singe.html" class="readmore stretched-link mt-auto"><span>Read
									More</span><i class="bi bi-arrow-right"></i></a>
						</div>
					</div>

				</div>

			</div>

		</section>
		<!-- End Recent Blog Posts Section -->
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