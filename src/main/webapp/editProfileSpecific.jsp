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

	<!-- ======= Getting Data ====== -->
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
	String contact_number = "";
	String created_at = "";
	String password = "";

	if (rs.next()) {
		email = rs.getString("email");
		address = rs.getString("address");
		username = rs.getString("username");
		created_at = rs.getString("created_at");
		password = rs.getString("password");
		contact_number = rs.getString("contact_number");
	}
	%>

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
							</a>Edit profile</li>
						</ol>
						<h4 class="sech4" style="font-family: 'Pangolin'; font-size: 3em">Edit
							my profile!</h4>
					</div>
				</div>
				<%
				if (request.getParameter("errCode") == null) {
				} else if (request.getParameter("errCode").equals("passwordsDoNotMatch")) {
				%>
				<p style="color: red">Password do not match!</p>
				<%
				} else {
				%>
				<p style="color: red">Account update failure</p>
				<%
				}
				%>

				<%
				if (request.getParameter("successCode") == null) {
				%>
				<%
				} else if (request.getParameter("successCode").equals("updateSuccessful")) {
				%>
				<p style="color: green">Success! Your accounts have been
					successfully edited!</p>
				<%
				}
				%>
				<div class="row g-5">
					<div class="col-md-11 col-lg-11">
						<form class="needs-validation" method="POST"
							action="EditProfileSpecific" novalidate>
							<div class="row g-3">
								<div class="col-sm-12"></div>
								<div class="col-sm-12">
									<label for=username class="form-label">User Name</label> <input
										type="text" class="form-control" id="username" placeholder=""
										value="<%=username%>" name="username" required>
									<div class="invalid-feedback">A Valid user name is
										required.</div>
								</div>

								<div class="col-sm-12">
									<label for="contactNumber" class="form-label">Contact number</label> <input
										type="text" class="form-control" id="contactNumber" placeholder=""
										name="contactNumber" value="<%=contact_number%>" required>
									<div class="invalid-feedback">A valid contact number is required.</div>
								</div>

								<div class="col-sm-12">
									<label for="address" class="form-label">Address</label> <input
										type="text" class="form-control" id="address" placeholder=""
										name="address" value="<%=address%>" required>
									<div class="invalid-feedback">An address is required.</div>
								</div>

								<div class="col-sm-12">
									<label for="password" class="form-label">Password</label> <input
										type="password" class="form-control" id="password"
										placeholder="" value="<%=password%>" rows="4" name="password"
										required>
									<div class="invalid-feedback">A password is required.</div>
								</div>

								<div class="col-sm-12">
									<label for="confirmPassword" class="form-label">Confirm
										Password</label> <input type="password" class="form-control"
										id="confirmPassword" placeholder="" value="<%=password%>"
										rows="4" name="confirmPassword" required>
									<div class="invalid-feedback">A password is required.</div>
								</div>
							</div>
							<hr class="my-4">
							<button class="w-100 btn btn-primary btn-lg" type="submit">Proceed
								to edit</button>
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