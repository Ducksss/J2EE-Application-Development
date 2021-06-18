<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
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
		List<String> colourList = Arrays.asList( "blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink","blue", "green", "red", "purple", "pink");
		int automaticColour = 0;
		ResultSetMetaData rsmd = null;
		rs = null;
		String categoryName = null;
		try {
			String category = (String) session.getAttribute("category");

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";
			// Step 3: Establish connection to URL
			conn = DriverManager.getConnection(connURL);

			// instead of editing directly, use ? to prevent injection attacks
			sql = "SELECT *\r\n" + "FROM sp_shop.products\r\n"
			+ "INNER JOIN sp_shop.category_tags ON products.product_id = category_tags.fk_product_id \r\n"
			+ "INNER JOIN sp_shop.category ON category_tags.fk_category_id = category.category_id  \r\n" + "WHERE fk_category_id = ?";

			// executing to DB
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);

			rs = pstmt.executeQuery();
			rsmd = (ResultSetMetaData) rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {
				/* out.println("<script type=\"text/javascript\">");
				out.println("alert('User or password incorrect');");
				out.println("location='productListing.jsp';");
				out.println("</script>"); */
				categoryName = rs.getString(16);
		%>

		<%=rs.getString(1)%>



		<!-- ======= Services Section ======= -->
		<section id="services" class="services">

			<div class="container" data-aos="fade-up">

				<header class="section-header">
					<h2>Food categories</h2>
					<p><%=categoryName%></p>
				</header>

				<div class="row gy-4">

					<%
					rs = pstmt.executeQuery();
					while (rs.next()) {
						
					%>
					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="400">
						<div class="service-box <%=colourList.get(automaticColour)%>">
							<i class="icon"><img
								src="assets/img/product/Spicy-Mexican-Burger-and-Fries.jpg"
								class="img-fluid" alt="Girl in  jacket"></i>

							<h3><%=rs.getString(2)%></h3>
							<p>
								<%=rs.getString(4)%>
							</p>
							<p>
								<%=rs.getString(6)%>
							</p>
							<p>
								<b>Categories</b> <br>
								<%=rs.getString(16)%>
							</p>
							<p>
								<%=rs.getString(17)%>
							</p>

						</div>
					</div>
					<%
					automaticColour++;
					}
					out.println("");
					}

					} catch (Exception e) {
					out.print(e);
					out.print("xd there seems to be soemthig wrong");
					}
					%>
				
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