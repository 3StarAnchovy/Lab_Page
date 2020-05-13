<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript">
   function checkForm() {
      if (!document.newMember.userEail.value) {
         alert("이메일을 입력하세요.");
         return false;
      }

      if (!document.newMember.userPassword.value) {
         alert("비밀번호를 입력하세요.");
         return false;
      }

      if (document.newMember.userPassword.value != document.newMember.userPassword_confirm.value) {
         alert("비밀번호를 동일하게 입력하세요.");
         return false;
      }
   }
</script>
</head>
<body>

<jsp:include page="/navbar.jsp" />

<section class="container mt-3"  style="max-width: 560px;min-height:420px;"><!-- mt-3 //위쪽으로 마진 3만큼(공백) -->

    <div class="text-center mb-4">
       <h1 class="h3 mb-3 font-weight-normal">Sign Up</h1>    
    </div>
	<form method="post" action="./JoinAction.jsp">
		<div class="form-group">
			<label class="col-sm-3">아이디</label>
			<input type="text" name="userID" class="form-control" placeholder="ID">
		</div>
		<div class="form-group">
			<label class="col-sm-3">비밀 번호</label>
			<input type="password" name="userPassword" class="form-control" placeholder="Password">	
		</div>
		<div class="form-group">
               <label class="col-sm-3">비밀번호 확인</label>
               <input name="userPassword_confirm" type="text" class="form-control" placeholder="password confirm" >
        </div>
        <div class="form-group">
               <label class="col-sm-3">성명</label>
               <input name="userName" type="text" class="form-control" placeholder="Name">
        </div>
		<div class="form-group">
			<label class="col-sm-3">이메일</label>
			<input type="email" name="userEmail" class="form-control" placeholder="Email">	
		</div>
         <div class="form-group">
               <label class="col-sm-3">전화번호</label>
               <input name="userPhnum" type="text" class="form-control" placeholder="Please input with '-'" >
          </div>
          <div class="row mt-4">
          		  <div class="form-group col-sm-4">
				<select name="userBirthday_year" class="form-control">
					<option value="0" selected>출생 년</option>
					<option value="1995">1995</option>
					<option value="1996">1996</option>
					<option value="1997">1997</option>
					<option value="1998">1998</option>
					<option value="1999">1999</option>
					<option value="2000">2000</option>
					<option value="2001">2001</option>
					<option value="2002">2002</option>
				</select>
		  </div>         
		  <div class="form-group col-sm-4">
				<select name="userBirthday_month" class="form-control">
					<option value="1" selected>출생 월</option>
					<option value="1">1월</option>
					<option value="2">2월</option>
					<option value="3">3월</option>
					<option value="4">4월</option>
					<option value="5">5월</option>
					<option value="6">6월</option>
					<option value="7">7월</option>
					<option value="8">8월</option>
					<option value="9">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
				</select>
		  </div>
		  <div class="form-group col-sm-4">
				<select name="userBirthday_day" class="form-control">
					<option value="0" selected>출생 일</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
				</select>
		  </div>
		  </div>
		<button type="submit" class="btn btn-primary">가입</button>
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
