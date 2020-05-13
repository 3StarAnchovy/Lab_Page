<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">

<style type="text/css">
 	body{
 		background-image: url('./resources/images/background-picture1.jpg');
 		background-size: cover;
 		background-repeat: no-repeat;
    	background-position: center center;
 	}
</style>

</head>
<body>

<%
   String userID = (String) session.getAttribute("userID");

%>

<jsp:include page="/navbar.jsp" />
<section class="container mt-3"  style="max-width: 560px; min-height:420px;"><!-- mt-3 //위쪽으로 마진 3만큼(공백) -->
<div class="container col-12">
 		<h1 style="text-align:center;">환영합니다!</h1>
 		<p style="text-align:center;">Fanta 연구실 프로젝트 입니다.</p>
</div>
<p><br><br><br></p>

<div class="container" style="width:600px;">
	<div class="row"><!-- row클래스는 가로로 그룹 지을 칼럼들 묶음-->
	  <div class="col-lg-6 col-md-6">
      <table class="table table-striped" style="text-align:left; border: 1px solid #FFFFFF; border-left:none;border-right:none;border-collapse:collapse;">
         <thead> <!-- 테이블의 가장 윗줄 -->
            <tr>
                <th style="width:50%; background-color:#eeeee; clear:both; text-align: center;"><a style="color: #000000;" href="Notice.jsp">공지 사항</a></th>
            </tr>
         </thead>
         <tbody>
            <tr>
              <td><a style="color: #000000; font-size: 13px;" href="#"><strong>4월 세미나 일정 안내</strong></a></td>
            </tr>
          </tbody>
      </table>
      </div>
      <div class="col-lg-6 col-md-6 form-group">
      <table class="table table-striped" style="text-align:left; border: 1px solid #FFFFFF; border-left:none;"><!-- border-collapse:collapse 테이블 사이에 공백 없도록 -->
         <thead>
            <tr>
                <th style="width:50%; background-color:#eeeee; clear:both; text-align:center;"><a style="color: #000000;" href="Task.jsp">과제 게시판</a></th>
            </tr>
         </thead>
         <tbody>
            <tr>
              <td><a style=" color: #000000; font-size: 13px;" href="#"><strong>Java 연습문제 15~17 제출</strong></a>
            </tr>
            <tr>
              <td><a style="color: #000000; font-size: 13px;" href="#"><strong>프로젝트 제출</strong></a>
            </tr>
          </tbody>
       </table>
       </div>
    </div>
</div>
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