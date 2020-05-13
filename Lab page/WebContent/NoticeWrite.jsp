<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
%>

<jsp:include page="/navbar.jsp" />

<section class="container" style="min-height:420px;">
 	<div class="row">
 		<form enctype="multipart/form-data" method ="post" action = "NoticeAction.jsp">
 			<table class="table table-striped mt-3" style=" width:1120px; text-align: center; border: 1px solid #dddddd;">
 				<thead>
 					<tr>
 					 <th colspan="2" style="background-color:#eeeee; text-align: center;">공지사항 작성</th>
 					</tr>
 				</thead>
 				<tbody>
 					<tr>
 						<td><input type="text" class="form-control" placeholder="글 제목" name="NoticeTitle" maxlength="100"></td>
 					</tr>
 					<tr>
 						<td><input type="file" class="form-control" name="Noticefilesrc" maxlength="200"></td>
 					</tr>
 					<tr>
 						<td><textarea class="form-control" placeholder="글 내용" name="NoticeContent" maxlength="10000" style="height: 350px;"></textarea></td>
 					</tr>
 				</tbody>
 			</table>
 			<input type="submit" class="btn btn-primary pull-right" value="작성">
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