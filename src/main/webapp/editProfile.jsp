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

	<!-- Getting from MySQL -->
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

	// Step 7: Close connection
	conn.close();
	%>
	<main id="main">
		<!-- ======= Features Section ======= -->
		<section id="features" class="features">
			<div class="container" data-aos="fade-up">

				<!-- Feature Tabs -->
				<div>
					<div class="row feture-tabs" data-aos="fade-up">
						<div class="col-lg-10">
							<h3 class="sech3" style="font-family: 'Pangolin';">My
								profile</h3>
							<a href="editProfileSpecific.jsp"><button type="button"
									class="btn btn-dark">Edit</button></a>

							<!-- Tabs -->
							<div class="col-lg-12">
								<hr>
								<div class="row">
									<div class="col-lg-6">
										<b
											style="color: #65676b; font-weight: 600; font-size: 15px; line-height: 20px; letter-spacing: -0.24px;">Name</b>
									</div>
									<div class="col-lg-6 b"><%=username%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-lg-6">
										<b
											style="color: #65676b; font-weight: 600; font-size: 15px; line-height: 20px; letter-spacing: -0.24px;">Contact</b>
									</div>
									<div class="col-lg-6"><%=email%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-lg-6">
										<b
											style="color: #65676b; font-weight: 600; font-size: 15px; line-height: 20px; letter-spacing: -0.24px;">Address</b>
									</div>
									<div class="col-lg-6"><%=address%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-lg-6">
										<b
											style="color: #65676b; font-weight: 600; font-size: 15px; line-height: 20px; letter-spacing: -0.24px;">Created
											at</b>
									</div>
									<div class="col-lg-6"><%=created_at%></div>
								</div>
								<hr>
							</div>
						</div>
						<p class="secp"></p>
					</div>

				</div>
			</div>
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