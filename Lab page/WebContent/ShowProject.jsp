<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/navbar.jsp">

<section class="container" style="min-height:420px;">
<div class="card bg-light mt-3">
	<div class="card-header bg-light">
		<div class="row">
			<div class="col-8 text-left">이름, 이름, 이름&nbsp;<small>2020.04.05~2020.05.20</small></div>
		</div>
	</div>
	<div class="card-body">
		<h4 class="card-title">프로젝트 명</h4>
		<p class="card-text"> 설명 <br>Ex) 연구실 페이지 만들기 프로젝트</p>
		<div class="row">
			<div class="col-9 text-left">
				<span><small>조회 (15)</small></span>
			</div>
			<div class="col-3 text-right">
				<a href="Submit_Project.jsp" class="btn btn-secondary" role="button" class="form-control">제출 하기 &raquo;</a>
			</div>
		</div>
	</div>
</div>
</section> 	

<div class="container">
 	<div class="card-bg-light mt-3">
 		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
 			<thead> <!-- 테이블의 가장 윗줄 -->
 				<tr>
 				 <th style="background-color:#eeeee; text-align: center;">파일명</th>
 				 <th style="background-color:#eeeee; text-align: center;">제출자</th>
 				 <th style="background-color:#eeeee; text-align: center;">제출일</th>
 				</tr>			
 			</thead>
 			<tbody>
 				<tr>
 					<td><a href="ProjectCode.jsp?ProjectID=#">Main.jsp</a></td>
 					<td>Jihyeok123</td>
 					<td>2019.04.06</td>
 				</tr>

 			</tbody>
 		</table>
 	</div>
</div>

<jsp:include page="/footer.jsp" />
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./resources/js/jquery.min.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="./resources/js/popper.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>