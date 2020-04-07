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
<header style=" width: 100%; background-color: #515963">
<a href="Index.jsp"><img id="logo" src="./resources/images/pineapple.png" alt="FANTA" style="display: block; width: 100px; margin: 0 auto; clear: both; align:center; line-height: 104px;"/></a>
<a class="navbar-brand" href="Index.jsp" style="display: block; width: 100px; margin: 0 auto; clear: both; align:center; line-height: 40px;">FANTA</a>
<nav  class="navbar navbar-expand-lg navbar-light bg-#515963">
<p><br><br></p>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
     <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbar">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Index.jsp">메인</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
                   회원 관리
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdown">
          <a class="dropdown-item" href="Login.jsp">로그인</a>
          <a class="dropdown-item" href="Join.jsp">회원가입</a>
          <a class="dropdown-item" href="Logout.jsp">로그아웃</a>
          <a class="dropdown-item" href="#">일정 관리</a>
        </div>
       </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
                   프로그램 관리
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdown">
          <a class="dropdown-item" href="Task.jsp">과제 게시판</a>
          <a class="dropdown-item" href="#">프로젝트 게시판</a>
          <a class="dropdown-item" href="#">코드 게시판</a>
        </div>
       </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
                    자료실
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdown">
          <a class="dropdown-item" href="#">동영상 자료실</a>
          <a class="dropdown-item" href="#">사진 자료실</a>
          <a class="dropdown-item" href="Notice.jsp">공지 사항</a>
        </div>
       </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
                    기   타
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdown">
          <a class="dropdown-item" href="Album.jsp">앨범</a>
          <a class="dropdown-item" href="Question.jsp">질문하기</a>
        </div>
       </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
    </form>
  </div>
</nav>
<div style="clear:both;"></div>
</header>

<section class="container mt-3"  style="max-width: 560px;"><!-- mt-3 //위쪽으로 마진 3만큼(공백) -->
<div class="container col-12">
 		<h1 style="text-align:center;">환영합니다!</h1>
 		<p style="text-align:center;">Fanta 연구실 프로젝트 입니다.</p>
</div>
<div class="container">
	<p align="center">
	<img width="75" height="75" src="./resources/images/AlbumImages/Example.PNG" style="clear:both;"/>
	<p style="text-align:center;">정지혁님 안녕하세요.</p>
</div>
<div class="container">
   <div class="row">
      <table class="table table-striped col-6" style="text-align: center; border: 1px solid #dddddd">
         <thead> <!-- 테이블의 가장 윗줄 -->
            <tr>
                <th style="background-color:#eeeee; clear:both; text-align: center;"><a href="Notice.jsp">공지 사항</a></th>
            </tr>
         </thead>
         <tbody>
            <tr>
              <td><small>2019.04.074</small>
              <td><small>4월 세미나 안내</small>
            </tr>
          </tbody>
      </table>
      <table class="table table-striped col-6" style="text-align: center; border: 1px solid #dddddd">
         <thead>
            <tr>
                <th style="background-color:#eeeee; clear:both; text-align: center;"><a href="Task.jsp">과제 게시판</a></th>
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
	Copyright &copy; 정지혁 홍지민 김성현 정선규 All Right Reserver  tel : 010-1111-2222 <br> 
	add : 이학관 207 <a href="./Map.jsp" class="btn btn-secondary" role="button" class="form-control"> 위치 보기  &raquo;</a>
</footer>
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./resources/js/jquery.min.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="./resources/js/popper.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
