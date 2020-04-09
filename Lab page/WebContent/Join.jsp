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
        </div>
       </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
                   프로그램 관리
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdown">
          <a class="dropdown-item" href="#">과제 게시판</a>
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
          <a class="dropdown-item" href="#">공지 사항</a>
        </div>
       </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
                    기   타
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdown">
          <a class="dropdown-item" href="Album.jsp">앨범</a>
          <a class="dropdown-item" href="#">질문하기</a>
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

    <div class="text-center mb-4">
       <h1 class="h3 mb-3 font-weight-normal">Sign Up</h1>
    </div>
   
   <form method="post" action="./JoinAction.jsp"> <!-- join form -->
      <div class="form-group">
         <label>아이디</label>
         <input type="text" name="userID" class="form-control" placeholder="ID">
      </div>
      <div class="form-group">
         <label>비밀 번호</label>
         <input type="password" name="userPassword" class="form-control" placeholder="Password">
      </div>
      
      <div class="form-group">
         <label>이 름</label>
         <input type="text" name="userName" class="form-control" placeholder="Name">
      </div>
      <p><input type = "submit" value = "전송">
    </form>