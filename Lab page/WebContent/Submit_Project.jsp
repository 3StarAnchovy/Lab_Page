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

<section class="container mt-3"  style="max-width: 560px;min-height:420px;"><!-- mt-3 //위쪽으로 마진 3만큼(공백) -->
    <div class="text-center mb-4">
       <h1 class="h3 mb-3 font-weight-normal">Submit Your Project</h1>    
    </div>
	<form method="post" action="./Submit_ProjectAction.jsp">
		<div class="form-group">
			<label>제출일</label>
			<input type="text" name="TaskDate" class="form-control" placeholder="Date">
		</div>
		<div class="form-group">
			<label>제목</label>
			<input type="email" name="TaskTitle" class="form-control" placeholder="Title">	
		</div>
         <div class="form-group">
            <label>코드</label>
            <textarea name="TaskContent" class="form-control" maxlength="10000" style="height: 180px"></textarea>
          </div>
		<button type="submit" class="btn btn-primary">제출</button>
		<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
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