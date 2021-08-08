<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="model.*"%>
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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"></script>
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
<link
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"
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

				<!-- Start of View Product -->
				<div>
					<div class="row feture-tabs" data-aos="fade-up">
						<ol class="breadcrumb"
							style="margin-top: -5rem; margin-left: 1rem;">

						</ol>
						<h4 class="sech4" style="font-family: 'Pangolin'; font-size: 3em">Admin
							Console - View products</h4>
					</div>
				</div>
				<table class="display" id="products">
					<thead class="thead-light">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Product name</th>
							<th scope="col">Brief description</th>
							<th scope="col">Detailed description</th>
							<th scope="col">Cost price</th>
							<th scope="col">Retail price</th>
							<th scope="col">Stock quantity</th>
							<th scope="col">Status</th>
							<th scope="col">Edit</th>
							<th scope="col">Enable for view</th>
							<th scope="col">Remove for view</th>
							<th scope="col">Delete product</th>
						</tr>
					</thead>
					<tbody>
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
						String sqlStr = "SELECT * FROM sp_shop.products where status != 2";
						rs = stmt.executeQuery(sqlStr);
						int id = 1;
						// Step 6: Process Result
						while (rs.next()) {
							String active = "";
							int product_id = Integer.parseInt(rs.getString("product_id"));
							String product_title = rs.getString("product_title");
							String brief_description = rs.getString("brief_description");
							String detail_description = rs.getString("detail_description");
							double cost_price = rs.getDouble("cost_price");
							double retail_price = rs.getDouble("retail_price");
							int stock_quantity = rs.getInt("stock_quantity");
							int status = rs.getInt("status");

							if (status == 0) {
								active = "Enabled for view";
							} else {
								active = "Disabled for view";
							}
						%>
						<tr>
							<th scope="row"><%=id%></th>
							<td><%=product_title%></td>
							<td><%=brief_description%></td>
							<td><%=detail_description%></td>
							<td><%=String.format("%.2f", cost_price)%></td>
							<td><%=String.format("%.2f", retail_price)%></td>
							<td><%=stock_quantity%></td>
							<td><%=active%>
							<td>
								<form action="editProduct.jsp">
									<input type="hidden" name="productID" value="<%=product_id%>">
									<input type="submit" value="Edit" class="btn btn-success">
								</form>
							</td>
							<td>
								<form method="POST" action="EnableProductView">
									<input name="productID" type="hidden" value="<%=product_id%>">
									<input type="submit" value="Enable" class="btn btn-warning">
								</form>
							</td>
							<td>
								<form method="POST" action="DisableProductView">
									<input name="productID" type="hidden" value="<%=product_id%>">
									<input type="submit" value="Disable" class="btn btn-danger">
								</form>
							</td>
							<td>
								<form method="POST" action="DeleteProductDetails">
									<input name="productID" type="hidden" value="<%=product_id%>">
									<input type="submit" value="Delete" class="btn btn-dark">
								</form>
							</td>
						</tr>
						<%
						id++;
						}

						// Step 7: Close connection
						conn.close();
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" class="right"><a href="addProduct.jsp"><button
										type="button" class="btn btn-primary">Add Product</button></a></td>
						</tr>
					</tfoot>
				</table>
				<!-- End of View product -->


				<!-- Start of View Category -->
				<div>
					<div class="row feture-tabs" data-aos="fade-up">
						<ol class="breadcrumb"
							style="margin-top: -5rem; margin-left: 1rem;">

						</ol>
						<h4 class="sech4" style="font-family: 'Pangolin'; font-size: 3em">Admin
							Console - View category</h4>
					</div>
				</div>
				<table class="display" id="categories">
					<thead class="thead-light">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Category</th>
							<th scope="col">Description</th>
							<th scope="col">Edit</th>
							<th scope="col">Delete</th>
						</tr>
					</thead>
					<tbody>
						<%
						// Step1: Load JDBC Driver
						Class.forName("com.mysql.jdbc.Driver"); //can be omitted for newer version of drivers
						// Step 2: Define Connection URL
						connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";
						// Step 3: Establish connection to URL
						conn = DriverManager.getConnection(connURL);
						// Step 4: Create Statement object
						stmt = conn.createStatement();
						// Step 5: Execute SQL Command
						sqlStr = "SELECT * FROM sp_shop.category";
						rs = stmt.executeQuery(sqlStr);
						id = 1;
						// Step 6: Process Result
						while (rs.next()) {
							int category_id = rs.getInt("category_id");
							String catname = rs.getString("catname");
							String description = rs.getString("description");
						%>
						<tr>
							<th scope="row"><%=id%></th>
							<td><%=catname%></td>
							<td><%=description%></td>
							<td>
								<form action="editCategory.jsp">
									<input type="hidden" name="categoryID" value="<%=category_id%>">
									<input type="submit" value="Edit" class="btn btn-success">
								</form>
							</td>
							<td>
								<form method="POST" action="DeleteCategoryDetails">
									<input name="categoryID" type="hidden" value="<%=category_id%>">
									<input type="submit" value="Delete" class="btn btn-danger">
								</form>
							</td>
						</tr>
						<%
						id++;
						}

						// Step 7: Close connection
						conn.close();
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" class="right"><a href="addCategory.jsp"><button
										type="button" class="btn btn-primary">Add Category</button></a></td>
						</tr>
					</tfoot>
				</table>
				<!-- End of View Category -->
			</div>
		</section>
		<!-- End Features Section -->
		<script type="text/javascript">
			$(document).ready(function() {
				$('#products').DataTable({
					"order" : [ [ 0, "asc" ] ]
				});
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#categories').DataTable({
					"order" : [ [ 0, "asc" ] ]
				});
			});
		</script>
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
	<script src="extensions/editable/bootstrap-table-editable.js"></script>
</body>

</html>