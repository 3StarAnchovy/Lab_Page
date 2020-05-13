<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.TaskBbs" %>
<%@ page import="bbs.TaskBbsDAO" %>
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
    
    
	int TaskID=0;
	if(request.getParameter("TaskID") != null){
		TaskID = Integer.parseInt(request.getParameter("TaskID"));
	}
    
	if(TaskID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'Index.jsp'");
		script.println("</script>");
	}
%>
<jsp:include page="/navbar.jsp" />

<section class="container" style="min-height:420px;">
 	<div class="row">
 		<form enctype="multipart/form-data" method ="post" action = "SubmitTaskAction.jsp?TaskID=<%=TaskID%>">
 			<table class="table table-striped mt-3" style=" width:1100px; text-align: center; border: 1px solid #dddddd;">
 				<thead>
 					<tr>
 					 <th colspan="2" style="background-color:#eeeee; text-align: center;">과제를 제출해주세요.</th>
 					</tr>
 				</thead>
 				<tbody>
 				 	<tr>
 						<td><input type="text" class="form-control" placeholder="글 제목" name="SubmitTaskTitle" maxlength="100"></td>
 					</tr>
 					<tr>
 						<td><input type="file" class="form-control" name="SubmitTaskfile" maxlength="200"></td>
 					</tr>
 					<tr>
 						<td><textarea class="form-control" placeholder="작성해 주세요." name="SubmitTaskContent" maxlength="10000" style="height: 350px;"></textarea></td>
 					</tr>
 				</tbody>
 			</table>
 			<input type="submit" class="btn btn-primary pull-right" value="제출">
 			<a class="btn btn-primary pull-right" onclick="return confirm('과제를 제출하지 않으시겠습니까?')" href="./TaskView.jsp?TaskID=<%=TaskID%>">돌아가기</a>
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