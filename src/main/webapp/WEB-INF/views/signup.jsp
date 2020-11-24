<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
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

	<!-- Sign up -->
	<div class="bg-black d-flex h-100 align-items-center" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 mx-auto text-center">
					<h1 class="text-white mb-4">회원가입</h1>
					<form method="POST" name="signupForm" action="memberInsert.me" class="form">
						<!-- email -->
						<div class="mail-section">
							<span><input type="email" name="email" id="email"
								class="form-control form-control-black flex-fill mr-0 mr-sm-2 mb-3" placeholder="Enter your E-mail" 
								style="width: 65%; display: inline-block;" required>
							</span> 
							<span>
								<button
									type="button" class="emailcheck-btn form-control form-control-black flex-fill mr-0 mr-sm-2 mb-3" onclick="emChk();"
									value="N" style="width: 30%; display: inline-block;">중복확인</button>
							</span>
							
							<div class="alert alert-true" id="email-alert-true"
								style="font-size: 10px; float: left; color: green;">사용 가능한
								이메일입니다.</div>
							<div class="alert alert-false" id="email-alert-false"
								style="font-size: 10px; float: left; color: red;">이미 사용 중인
								이메일입니다.</div>
						</div>
						
						<!-- password -->
						<div class="password-section">
							<input type="password" class="pw form-control form-control-black flex-fill mr-0 mr-sm-2" id="password" name="password"
								placeholder="비밀번호(8자리이상, 특수문자, 대소문자)" required>
							<div class="alert alert-check form-control form-control-black mr-0 mr-sm-2 mb-3 text-left" id="pw-alert-check"
								style="font-size: 10px; float: left; color: red; background-color: black;">비밀번호 8자리
								이상</div>
							<input type="password" class="pw form-control form-control-black flex-fill mr-0 mr-sm-2 mb-3" id="pwcheck" name="pwcheck"
								placeholder="비밀번호 확인" required>
							<div class="alert alert-true form-control form-control-black mr-0 mr-sm-2 mb-3 text-left" id="pw-alert-true"
								style="font-size: 10px; float: left; color: green; background-color: black;">비밀번호가
								일치합니다.</div>
							<div class="alert alert-false form-control form-control-black mr-0 mr-sm-2 mb-3 text-left" id="pw-alert-false"
								style="font-size: 10px; float: left; color: red; background-color: black;">비밀번호가
								일치하지 않습니다.</div>
						</div>

						<!-- name -->
						<input type="text" name="name" class="checkfield form-control form-control-black flex-fill mr-0 mr-sm-2 mb-3"
							placeholder="이름">
						
						<!-- phone -->
						<input type="text" name="phone" placeholder="핸드폰번호" class="form-control form-control-black flex-fill mr-0 mr-sm-2 mb-3">
						
						<!-- age -->
						<input type="number" name="age" class="form-control form-control-black flex-fill mr-0 mr-sm-2 mb-3" placeholder="age">
						
						<!-- sex -->
						<div class="form-control form-control-black mr-0 mr-sm-2 mb-3 text-left">
							<input type="radio" id="male" value="male" name="sex">
							<label for="male" class="mr-3" style="color: #5c696f;">Male</label>
							<input type="radio" id="female" value="female" name="sex">
							<label for="male" class="mr-3" style="color: #5c696f;">Female</label>
						</div>
						<!-- category -->
						<div class="form-control form-control-black mr-0 mr-sm-2 mb-3 text-left" style="color: #5c696f;">
							<input type="checkbox" id="category" name="category" value="멜로"> 멜로 
							<input type="checkbox" id="category" name="category" value="스릴러"> 스릴러 
						</div>
						
						<br />
						<br />
						<input name="${_csrf.parameterName}" type="hidden"
							value="${_csrf.token}" />
						<!-- 가입 버튼 -->
						<div>
							<input type="button" class="signup-btn form-control form-control-black" onclick="inputChk()"
								value="가입하기" style="width: 130px; display: inline; background-color: #969696;">
						</div>
					</form>
				</div>
			</div>
			<img class="img-fluid"
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
		src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
</body>
</html>
