<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.login.*"%>
<%
	String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">NetCommend</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu<i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
				
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="about.nv">About</a></li>
					
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="category.nv">Category</a></li>
					
					<%
						if (email == null) {
					%>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="login.nv">Login</a></li>
					<%
						} else {
					%>
					
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="mypage.nv">MyPage</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="logout.nv">LogOut</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>