<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	<!-- About -->
	<div class="bg-black d-flex h-100 align-items-center" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center mb-5">
					<h1 class="text-white mb-4">NetCommend</h1>
                    <p class="text-white-50">넷플릭스 컨텐츠</p>
                    <p class="text-white-50">어렵게 찾지 마시고</p>
                    <p class="text-white-50">NetCommend로 추천받으세요.</p>
                    <a class="btn btn-primary js-scroll-trigger" href="signup.me">Subscribe Now</a>
				</div>
			</div>
			<img class="img-fluid" style="display: block; margin: 0 auto; max-width: 50%;" src="${pageContext.request.contextPath}/resources/images/netflix.png"/>
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
</body>
</html>
