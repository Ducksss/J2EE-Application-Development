<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<!-- Favicons -->
<script src="https://kit.fontawesome.com/fdc798ee43.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">
			<a href="index.jsp" class="logo d-flex align-items-center"> <img
				src="https://res.cloudinary.com/sp-dit-chai-pin-zheng/image/upload/v1623741776/mcojwpccv3h2xypf8yq7.png" alt="" /><span
				style="font-family: 'Pangolin';">Whompa Soy Desserts</span>
			</a>
			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="#hero">Home</a></li>
					<li><a href="blog.html">Blog</a></li>
					<li class="dropdown"><a href="#"><span>Menu</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="#">Drinks</a></li>
							<li class="dropdown"><a href="#"><span>Desserts</span> <i
									class="bi bi-chevron-right"></i></a>
								<ul>
									<li><a href="#">Sorbet</a></li>
									<li><a href="#">Oriental Flavours</a></li>
									<li><a href="#">Snowy Ice</a></li>
								</ul></li>
							<li><a href="#">Snacks</a></li>
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
					<li><a class="getstarted scrollto loginIcon" href="login.jsp"><i
							class="fas fa-plus" style="padding-right: 15px; font-size: 15px;"></i>Add
							products</a></li>
					<%
					}
					%>
					<li><a class="getstarted scrollto loginIcon" href="login.jsp"><i
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