<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.TaskBbs" %>
<%@ page import="bbs.TaskBbsDAO" %>
<%@ page import="bbs.SubmitTask" %>
<%@ page import="bbs.SubmitTaskDAO" %>
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
	
    int pageNumber =1;
    if(request.getParameter("pageNumber")!=null){
       pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
    
    TaskBbs task = new TaskBbsDAO().getTask(TaskID);
    
    TaskBbsDAO hitmaking = new TaskBbsDAO();
    int hit=hitmaking.hitMaker(TaskID);
	
%>
<jsp:include page="/navbar.jsp" />

<section class="container" style="min-height:420px;">
<div class="card bg-light mt-3">
	<div class="card-header bg-light">
		<div class="row">
			<div class="col-8 text-left"><%=task.getTaskManagerName() %>&nbsp; |  <small><%=task.getTaskDate().substring(0,11)%> ~ <%=task.getTaskDoneDate()%></small></div>
		</div>
	</div>
	<div class="card-body">
		<h4 class="Task-title"><%=task.getTaskTitle() %></h4>
		<p class="Task-content"><%=task.getTaskContent() %></p>
		<div class="row">
		<%
			if(userID!=null){
		%>
			<div class="col-12 text-right">
				<a href="SubmitTask.jsp?TaskID=<%=TaskID%>" role="button" style="color:#000000"><strong>제출 하기</strong> &raquo;</a>
			</div>
		<%
			}
		%>
		</div>
	</div>
</div>
<hr>
<div class="container">
	<%
		SubmitTaskDAO submittaskDAO = new SubmitTaskDAO();
		ArrayList<SubmitTask> list = submittaskDAO.getList(pageNumber,TaskID);
	%>
 	<table class="table table-striped" style="border-collpse:collapse;">
 		<%
			for(int i=0 ; i<list.size();i++){
 		%>
 		<tr>
 			<td style="text-align:left; font-size:13px;"><%=list.get(i).getSubmitTaskUserName()%></td>
 			<td style="text-align:left;"><a href="SubmitTaskView.jsp?SubmitTaskID=<%=list.get(i).getSubmitTaskID() %>" style="color:#000000; font-size:13px;"><%=list.get(i).getSubmitTaskTitle()%></a></td>
 			<td style="font-size:13px; text-align:right;"><%=list.get(i).getSubmitTaskDate().substring(0,11)+ "  " + list.get(i).getSubmitTaskDate().substring(11,13)+" : "+list.get(i).getSubmitTaskDate().substring(14,16)%></td>
 		</tr>
 		<%
			}
 		%>
 	</table>
 	 <%
 		if(pageNumber!=1){
 	%>
 			<a href="Notice.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn=success btn-arraw-right" style="color:#000000;">이전</a>
 	<%
 		} if(submittaskDAO.nextPage(pageNumber +1)){
 	%>
 			<a href="Notice.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn=success btn-arraw-right" style="color:#000000;">다음</a>
 	<%
 		}
 	%>
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