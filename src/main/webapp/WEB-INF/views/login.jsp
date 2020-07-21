<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	// 이전페이지 정보
	String pre_url = null;
	if(request.getParameter("pre_url") == null) {
		pre_url = request.getHeader("Referer");
	} else {
		pre_url = request.getParameter("pre_url");
	}
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
	<jsp:include page="/WEB-INF/views/header_etc.jsp" />

	<!-- Login -->
	<div class="bg-black d-flex h-100 align-items-center" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center mb-5">
					<h1 class="text-white mb-4">NetCommend</h1>
					<br> <br>
					<h4 class="text-white-50">로그인 후 다양한 컨텐츠를 이용하세요.</h4>
					
					<!-- 로그인 form -->
					<form method="POST" class="form-inline d-flex " id="loginForm"
						name="loginForm" action="normal_login.me"
						style="max-width: 62%; margin: 0 auto; margin-top: 20px;">
						
						<!-- email 입력 -->
						<input class="form-control flex-fill mr-0 mr-sm-2 mb-3"
							type="email" id="loginId" name="email"
							placeholder="Enter email address..." /> 

						<!-- password 입력 -->
						<input class="form-control flex-fill mr-0 mr-sm-2 mb-3"
							type="password" id="loginPw" name="password"
							placeholder="Enter password..." onkeyup="enterkey();" 
							style="width: 100%;"/>
							
						<!-- 회원가입 & 아이디/비밀번호 찾기 -->
						<div class="find mb-5" style="width: 100%;">
							<span style="float: left; text-align: left;">
								<a href="signup.me" class="text-white-50">회원가입</a>
							</span>
							<span style="float: right; text-align: right;">
								<a href="forgotIdPw.me" class="text-white-50">이메일/비밀번호 찾기</a>
							</span>
						</div>
						
						<!-- 로그인 -->
						<button class="btn btn-primary mx-auto mb-3" onclick="login();" type="submit" style="width: 100%;">Login</button>
						
						<!-- 네이버 로그인 -->
						<!-- 카카오 로그인 -->
						<div class="api_login" style="width: 100%;">
							<span style="width: 50%; display: inline-block;">
								<button type="button" onclick="location.href='${naver_Url}'"
									id="btn-left" style="background-color: black; border: none;">
									<img
										src="${pageContext.request.contextPath}/resources/images/naverLogin.png"
										style="float: left; text-align: left; 
										width: 180px; border-radius: 5px;" />
								</button>
							</span> 
							<span style="width: 50%; display: inline-block;">
								<button type="button" onclick="location.href='${kakao_Url}'"
									id="btn-right" style="background-color: black; border: none;">
									<img
										src="${pageContext.request.contextPath}/resources/images/kakaoLogin.png"
										style="float: right; text-align: right;
										width: 180px; border-radius: 5px;" />
								</button> <br /> <br />
							</span>
						</div>
					</form>
				</div>
			</div>
			
			<!-- Netflix Logo -->
			<img class="img-fluid mt-5"
				style="display: block; margin: 0 auto; max-width: 50%;"
				src="${pageContext.request.contextPath}/resources/images/netflix.png" />
		</div>
	</div>


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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/login.js"></script>
</body>
</html>
