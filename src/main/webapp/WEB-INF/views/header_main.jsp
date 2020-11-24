<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@page import="com.spring.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.login.*"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="org.springframework.security.core.annotation.AuthenticationPrincipal" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="tody.common.service.*" %>

<%


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%=email%> --%>
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

					<sec:authorize access="isAnonymous()">
						<c:if test="${email == null }">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="login.nv">Login</a></li>
						</c:if>
						<c:if test="${email != null }">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="mypage.nv">MyPage</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="#"
								onclick="document.getElementById('logout-form').submit();">LogOut</a></li>
							<form id="logout-form"
								action="${pageContext.request.contextPath}/logout" method="POST">
								<input name="${_csrf.parameterName}" type="hidden"
									value="${_csrf.token}" />
							</form>
						</c:if>
						<!-- <li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="login.nv">Login</a></li> -->
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="mypage.nv">MyPage</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="#"
							onclick="document.getElementById('logout-form').submit();">LogOut</a></li>
						<form id="logout-form"
							action="${pageContext.request.contextPath}/logout" method="POST">
							<input name="${_csrf.parameterName}" type="hidden"
								value="${_csrf.token}" />
						</form>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>