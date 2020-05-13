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

<jsp:include page="/navbar.jsp" />

<section class="container mt-3"  style="max-width: 560px; min-height:420px;"><!-- mt-3 //위쪽으로 마진 3만큼(공백) -->

	<div class="text-center mb-4">
       <h1 class="h3 mb-3 font-weight-normal">Login</h1>    
    </div>
    
	<form method="post" action="./LoginAction.jsp">
		<div class="form-group">
			<label>아이디</label>
			<input type="text" name="userID" class="form-control">
		</div>
		<div class="form-group">
			<label>비밀 번호</label>
			<input type="password" name="userPassword" class="form-control">	
		</div>
		<div class="row">
			<div class="col-3 text-left">
				<button type="submit" class="btn btn-primary form-control col-xs-3; align">로그인</button>
			</div>
			<div class="col-3 text-left">
			<a class="btn btn-primary form-control" href="Join.jsp" style="margin:3px;">회원 가입</a>
			</div>
		</div>
	</form>
</section>
<jsp:include page="/footer.jsp" />
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./resources/js/jquery.min.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="./resources/js/popper.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>