<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	// 이전페이지 정보
	String pre_url = null;
	if (request.getParameter("pre_url") == null) {
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

<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/styles.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/forgotIdPw.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/forgotIdPw.js"></script>

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
					<div class="text-section mb-5">
						<h1 class="text-white mb-4">NetCommend</h1>
						<br> <br>
						<h4 class="text-white-50">Find E-mail / Password</h4>
					</div>
					<div class="tab-section">
						<ul class="tabs mb-3">
							<li class="tab-link current" data-tab="tab-1">Find E-Mail</li>
							<li class="tab-link" data-tab="tab-2">Find Password</li>
						</ul>

						<!-- 이메일 찾기 tab -->
						<form method="POST" class="form-inline d-flex "
							action="findemail.me"
							style="max-width: 62%; margin: 0 auto;">
							<div id="tab-1" class="tab-content current">
								<!-- 이름 입력 -->
								<input class="form-control flex-fill mr-0 mr-sm-2 mb-3"
									type="text" id="name" name="name" placeholder="Enter Name..." />

								<!-- 핸드폰번호 입력 -->
								<input class="form-control flex-fill mr-0 mr-sm-2 mb-3"
									type="text" name="phone" maxlength="11" id="phone"
									numberonly="true"
									placeholder="Enter Phone Number..." style="width: 100%;" />

								<!-- 아이디 찾기 버튼 -->
								<button class="btn btn-primary mx-auto mb-3 find-btn text-white"
									type="submit" style="width: 100%;">Find E-mail</button>
							</div>
						</form>

						<!-- 비밀번호 찾기 tab -->
						<form method="POST" class="form-inline d-flex "
							action="findpassword.me"
							style="max-width: 62%; margin: 0 auto;">
							<div id="tab-2" class="tab-content">
								<!-- 이메일 입력 -->
								<input class="form-control flex-fill mr-0 mr-sm-2 mb-3"
									type="text" id="findId" name="email"
									placeholder="Enter Email..." />

								<!-- 핸드폰번호 입력 -->
								<input class="form-control flex-fill mr-0 mr-sm-2 mb-3"
									type="text" name="phone" maxlength="11" id="phone"
									numberonly="true"
									placeholder="Enter Phone Number..." style="width: 100%;" />

								<!-- 이름 입력 -->
								<input class="form-control flex-fill mr-0 mr-sm-2 mb-3"
									type="text" id="name" name="name" placeholder="Enter Name..."
									style="width: 100%;" />

								<!-- 비밀번호 찾기 버튼 -->
								<button class="btn btn-primary mx-auto mb-3 find-btn text-white"
									type="submit" style="width: 100%;">Find Password</button>
							</div>
						</form>
					</div>
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
