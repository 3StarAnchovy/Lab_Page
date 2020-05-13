<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
<% 
    String userID = null;
    if(session.getAttribute("userID")!=null){
        userID = (String) session.getAttribute("userID");
    }
    
    if(request.getParameter("userID")!=null)
  		 userID = request.getParameter("userID");
    
    User user = new UserDAO().getUser(userID);
%>

<jsp:include page="/navbar.jsp" />

<section class="container mt-3"  style="max-width: 560px; min-height:420px;"><!-- mt-3 //위쪽으로 마진 3만큼(공백) -->
<div class="container">
	<%
		String userGrade;
		if(user.getUserPower()==0)
			userGrade="회원";
		else if(user.getUserPower()==1)
			userGrade="매니저";
		else if(user.getUserPower()==2)
			userGrade="관리자";
		else
			userGrade="비회원";
	%>
	<p align="center">
	<img width="75" height="75" src="<%=user.getUserProfileSrc()%>" style="clear:both;"/>
	<p style="text-align:center;">[<%=userGrade%>] <%=user.getUserName()%>님 안녕하세요.</p>
	<p style="text-align:center;">아이디 :<%=userID%></p>
	<p style="text-align:center;">생일 : <%=user.getUserBirthday()%></p>
	<p style="text-align:center;">전화 번호 : <%=user.getUserPhnum() %></p>
</div>
<%
	if(user.getUserPower()==1 || user.getUserPower()==2){
%>
<p align="center"><a href="./Supervise.jsp" class="btn btn-primary" role="button" class="form-control" style="">페이지 관리하기 &raquo;</a></p>
<%
	}
%>
<p><br><br><br><br></p>
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