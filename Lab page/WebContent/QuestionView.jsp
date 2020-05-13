<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="bbs.QuestionBbs" %>
<%@page import="bbs.QuestionBbsDAO" %>
<%@page import="user.User" %>
<%@page import="user.UserDAO" %>
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

<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
    userID = (String) session.getAttribute("userID");
	}

	User user = new UserDAO().getUser(userID);
	
	int QuestionID=0;
	if(request.getParameter("QuestionID") != null){
		QuestionID = Integer.parseInt(request.getParameter("QuestionID"));
	}
	QuestionBbs question = new QuestionBbsDAO().getQuestion(QuestionID);
	
    QuestionBbsDAO hitmaking = new QuestionBbsDAO();
    int hit=hitmaking.hitMaker(QuestionID);
    
	String src = question.getQuestionfilesrc();
%>
<section class="container mt-3" style="min-height:420px;">
<div class="card bg-light mt-3">
	<div class="card-header bg-light">
		<div class="row">
			<div class="col-12 text-left"><%=question.getQuestionManagerName()%>&nbsp;<small> | <%=question.getQuestionDate().substring(0,11)+ "  " + question.getQuestionDate().substring(11,13)+" : "+question.getQuestionDate().substring(14,16) %> | <%=question.getQuestionType() %></small></div>
		</div>
	</div>
	<div class="card-body">
		<h3 class="card-title"><%=question.getQuestionTitle() %></h3>
		<p class="card-title"><%=question.getQuestionContent() %></p>
		<p class="card-text"><pre><%=question.getQuestionCode() %></pre>
		<br>
		<%
			if(src.equals("C:\\Users\\정지혁\\eclipse-workspace\\FANTA\\WebContent\\resources\\file\\Question\\null")){
				src="파일이 존재하지 않습니다.";
			} 
		%>
		<p class="card-file"><%=src%></p>
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

<jsp:include page="/footer.jsp" />
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./resources/js/jquery.min.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="./resources/js/popper.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>