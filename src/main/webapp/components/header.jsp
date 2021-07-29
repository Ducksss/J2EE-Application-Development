<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<link rel="stylesheet" href="header.css" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Indie+Flower&family=Pangolin&display=swap"
	rel="stylesheet">
<!-- Template Main CSS File -->
<link href="header.css" rel="stylesheet">

<!-- Favicons -->
<script src="https://kit.fontawesome.com/fdc798ee43.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top"
		style="box-shadow: 0px 2px 4px rgb(0 0 0/ 15%);">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">
			<a href="index.jsp" class="logo d-flex align-items-center"> <img
				src="https://res.cloudinary.com/sp-dit-chai-pin-zheng/image/upload/v1623741776/mcojwpccv3h2xypf8yq7.png"
				alt="" /><span style="font-family: 'Pangolin';">Whompa Soy
					Desserts</span>
			</a>
			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
					<li><a href="category.jsp">Category</a></li>
					<li><a href="customerInquiry.jsp">Customer Inquiry</a></li>
					<li class="dropdown"><a href="#"><span>Menu</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<%
							// Step1: Load JDBC Driver
							Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

							// Step 2: Define Connection URL
							String connURL = "jdbc:mysql://localhost/sp_shop?user=adminuser&password=password&serverTimezone=UTC";

							// Step 3: Establish connection to URL
							Connection conn = DriverManager.getConnection(connURL);

							// instead of editing directly, use ? to prevent injection attacks
							String sql = "SELECT * FROM sp_shop.category";

							/// executing to DB - Statement to check if an account exist before it
							PreparedStatement pstmt = conn.prepareStatement(sql);
							ResultSet rs = pstmt.executeQuery();

							while (rs.next()) {
							%>
							<form action="category" method="POST">
								<input type="hidden" name="category" value=<%=rs.getString(1)%> />
								<a href="product" class="read-more"
									onclick="event.preventDefault(); this.parentNode.submit()"><span><%=rs.getString(2)%></span>
									<i class="bi bi-arrow-right"></i></a>
							</form>
							<%
							}
							%>
						</ul></li>

					<%
					String varChar = (String) session.getAttribute("sessUserName");
					String role = (String) session.getAttribute("sessUserRole");
					if (varChar == null) {
					%>
					<li><a class="getstarted scrollto loginIcon" href="login.jsp"><i
							class="fas fa-sign-in-alt"
							style="padding-right: 15px; font-size: 15px;"></i>Log in</a></li>
					<li><a class="getstarted scrollto" href="register.jsp"><i
							class="fas fa-user-plus"
							style="padding-right: 15px; font-size: 15px;"></i>Sign up</a></li>
					<%
					} else {
					if (role.equals("Admin")) {
					%>
					<li class="dropdown"><a href="statistics.jsp"><span>Admin
								tools</span> <i class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="orderManagement.jsp"><i class="fa fa-clock-o"
									style="padding-right: 1px; font-size: 15px;"></i>Order<br>management&nbsp&nbsp</a></li>
							<li><a href="orderInsights.jsp"><i
									class="fa fa-search-plus"
									style="padding-right: 1px; font-size: 15px;"></i>Order insights</a></li>
							<li><a href="manageUserAndAdmin.jsp"><i
									class="fa fa-users"
									style="padding-right: 1px; font-size: 15px;"></i>Manage users</a></li>
							<li><a href="manageProductCategory.jsp"><i
									class="fa fa-wrench"
									style="padding-right: 1px; font-size: 15px;"></i>Category and <br>product<br>management</a></li>
							<li><a href="addProduct.jsp"><i class="fas fa-plus"
									style="padding-right: 1px; font-size: 15px;"></i>Add products</a></li>
							<li><a href="addCategory.jsp"><i
									class="fas fa-hand-pointer"
									style="padding-right: 1px; font-size: 15px;"></i>Add category</a></li>
						</ul></li>
						
					<%
					}
					%>
					<li><a class="getstarted scrollto loginIcon"
						href="editProfile.jsp"><i class="fas fa-user"
							style="padding-right: 15px; font-size: 15px;"></i>Profile</a></li>
					<li><a class="getstarted scrollto loginIcon" href="cart.jsp"><i
							class="fas fa-shopping-cart"
							style="padding-right: 15px; font-size: 15px;"></i>Cart</a></li>
					<li><a class="getstarted scrollto loginIcon"
						href="endSession.jsp"><i
							class="fas fa-sign-out-alt circle-icon"
							style="padding-right: 15px; font-size: 15px;"></i>Logout</a></li>
					<%
					}
					%>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->
</body>
</html>