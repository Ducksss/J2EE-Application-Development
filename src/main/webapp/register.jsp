<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Register</title>

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Font Icon -->
<link rel="stylesheet"
	href="assets/fonts/material-icon/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="assets/css/login.css">

</head>
<body>
	<div class="main">
		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
						<form action="Registration" method="post" name="signup"
							class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<%
							if (request.getParameter("errCode") == null) {
							} else if (request.getParameter("errCode").equals("accountAlreadyExists")) {
							%>
							<p style="color: red; font-size: 13px; margin-top: -1.4rem;">Email
								has already been taken.</p>
							<%
							} else {

							}
							%>
							<div class="form-group">
								<label for="number"><i class="zmdi zmdi-phone"></i> </label> <input
									type="number" name="number" id="number"
									placeholder="Your contact number..." />
							</div>
							<div class="form-group">
								<label for="address"><i class="zmdi zmdi-map"></i></label> <input
									type="text" name="address" id="address"
									placeholder="Your address..." />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<%
							if (request.getParameter("errCode") == null) {
							} else if (request.getParameter("errCode").equals("passwordUnmatch")) {
							%>
							<p
								style="color: red; padding: 0; margin-top: -25px; margin-bottom: 10px; font-size: 13px;">Your
								Passwords don't match</p>
							<%
							} else {

							}
							%>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="assets/img/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- JS -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
</body>
</html>