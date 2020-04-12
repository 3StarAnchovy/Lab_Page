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
		<div class="container col-12">
			<h1 style="text-align: center;">환영합니다!</h1>
			<p style="text-align: center;">Fanta 연구실 프로젝트 입니다.</p>
		</div>
		<div class="container">
			<p align="center">
				<img width="75" height="75"
					src="./resources/images/AlbumImages/Example.PNG"
					style="clear: both;" />
			<p style="text-align: center;">정지혁님 안녕하세요.</p>
		</div>


		<div class="container">
			<div class="row">
				<table class="table table-striped col-6"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<!-- 테이블의 가장 윗줄 -->
						<tr>
							<th
								style="background-color: #eeeee; clear: both; text-align: center;"><a
								href="Notice.jsp">공지 사항</a></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><small>2019.04.074</small>
							<td><small>4월 세미나 안내</small>
						</tr>
					</tbody>
				</table>
				<table class="table table-striped col-6"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th
								style="background-color: #eeeee; clear: both; text-align: center;"><a
								href="Task.jsp">과제 게시판</a></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><small>2019.04.07 | Java 연습문제 15~17 제출</small>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>

	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 정지혁 홍지민 김성현 정선규 All Right Reserver tel :
		010-1111-2222 <br> add : 이학관 207 <a href="./Map.jsp"
			class="btn btn-secondary" role="button" class="form-control"> 위치
			보기 &raquo;</a>
	</footer>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./resources/js/jquery.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./resources/js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
