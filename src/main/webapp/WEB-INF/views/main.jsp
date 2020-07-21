<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.login.*" %>
<%
	String email = (String)session.getAttribute("email");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<!-- Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/styles.css" />

<title>NetCommend</title>
</head>
<body id="page-top">
	
	<!-- Navigation Bar Include -->
	<jsp:include page="/WEB-INF/views/header_main.jsp" />
	
	<!-- Masthead-->
	<header class="masthead">
		<div class="container d-flex h-100 align-items-center">
			<div class="mx-auto text-center">
				<h1 class="mx-auto my-0 text-uppercase">NetCommend</h1>
				<h2 class="text-white-50 mx-auto mt-2 mb-5">Free Subscribe</h2>
				<a class="btn btn-primary js-scroll-trigger" href="signup.me">
				Subscribe Now</a>
			</div>


		</div>
	</header>
	
	<!-- Contact-->
	<section class="contact-section bg-black">
		<div class="container">
			
			<div class="social d-flex justify-content-center">
				<a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a><a
					class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a><a
					class="mx-2" href="#!"><i class="fab fa-github"></i></a>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="footer bg-black small text-center text-white-50">
		<div class="container">Copyright © NetCommend 2020</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Core theme JS-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>
