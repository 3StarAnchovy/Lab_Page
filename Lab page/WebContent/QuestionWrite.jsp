<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
<%
   String userID = (String) session.getAttribute("userID");

	int QuestionID=0;
	if(request.getParameter("QuestionID") != null){
		QuestionID = Integer.parseInt(request.getParameter("QuestionID"));
	}
%>
<jsp:include page="/navbar.jsp" />

<section class="container" style="min-height:420px;">
 	<div class="row">
 		<form enctype="multipart/form-data" method ="post" action = "QuestionCodeUpload.jsp?QuestionID=<%=QuestionID%>">
 			<table class="table table-striped mt-3" style=" width:1100px; text-align: center; border: 1px solid #dddddd;">
 				<thead>
 					<tr>
 					 <th colspan="2" style="background-color:#eeeee; text-align: center;">코드</th>
 					</tr>
 				</thead>
 				<tbody>
 					<tr>
 						<td><input type="file" class="form-control" name="Questionfilesrc" maxlength="200"></td>
 					</tr>
 					<tr>
 						<td><textarea class="form-control" placeholder="작성해 주세요. (10000자 이상 시 파일로 업로드)" name="QuestionCode" maxlength="10000" style="height: 350px;"></textarea></td>
 					</tr>
 				</tbody>
 			</table>
 			<input type="submit" class="btn btn-primary pull-right" value="작성">
 			<a class="btn btn-primary pull-right" onclick="return confirm('코드를 등록하지 않으시겠습니까?')" href="./Question.jsp">돌아가기</a>
 		</form>
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