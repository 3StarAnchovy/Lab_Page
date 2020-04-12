<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/navbar.jsp" />

	<section class="container mt-3" style="max-width: 560px;">
		<!-- mt-3 //위쪽으로 마진 3만큼(공백) -->

		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">Sign Up</h1>
		</div>

		<form method="post" action="./JoinAction.jsp">
			<!-- join form -->
			<div class="form-group">
				<label>아이디</label> <input type="text" name="userID"
					class="form-control" placeholder="ID">
			</div>
			<div class="form-group">
				<label>비밀 번호</label> <input type="password" name="userPassword"
					class="form-control" placeholder="Password">
			</div>

			<div class="form-group">
				<label>이 름</label> <input type="text" name="userName"
					class="form-control" placeholder="Name">
			</div>
			<p>
				<input type="submit" value="전송">
		</form>
	</section>