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
          <a class="dropdown-item" href="#">강의 자료실</a>
          <a class="dropdown-item" href="#">사진 자료실</a>
          <a class="dropdown-item" href="#">레포트 자료실</a>
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
<p><br><br><br><br></p>
<div class="container">
		<div class="row">
 			<table class="table table-striped form-control" style="text-align: center; border: 1px solid #dddddd">
 				<tbody>
 					<tr>
 						<td colspan="2">Java 15장 20번 질문입니다.</td>
  					</tr>
 					<tr>
 					 	<td>정지혁</td>
 						<td colspan="2"> 2020년 04월 10일 </td>
 					</tr>
 					<tr>
 						<td colspan="2" style="min-height: 200px; text-align: left;">
<pre>
 public class MyPoint {

   int x;
   int y;

   MyPoint(int x , int y){
      this.x=x;
      this.y=y;
   }
   public String toString() {
      return "("+x+","+y+")";
   }
   public boolean equals(Object obj) {
      MyPoint p = (MyPoint)obj;
      if(x==p.x && y==p.y)
         return true;
      else
         return false;
   }
   public static void main(String[] args) {
      MyPoint p = new MyPoint(3,50);
      MyPoint q = new MyPoint(4,50);
      System.out.println(p);
      System.out.println(q);
      if(p.equals(q))
         System.out.println("같은점");
      else
         System.out.println("다른점");
   }
}
                   </pre>
 						</td>
 					</tr>
 				</tbody>
 			</table>
 		</div>
</div>
    
<div class="container mt-3">
   <div class="row">
      <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
         <thead> <!-- 테이블의 가장 윗줄 -->
            <tr>
                <th style="background-color:#eeeee; text-align: left;">답을 남겨주세요.</th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <th>
               <form method ="post" action = "AnswerAction.jsp?QuestionID=#">
                  <textarea class="form-control" placeholder="Please Write a Answer" name="Answer_Content" maxlength="800" style="height: 75px;"></textarea>
                    <a href="Question.jsp" class="btn btn-primary mt-2">목록</a>
                    <input type="submit" class="btn btn-primary pull-right mt-2" value="작성">         
               </form>
               </th>
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