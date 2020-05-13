<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="bbs.TaskBbs"%>
<%@ page import="bbs.TaskBbsDAO"%>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>

<% 
    String userID = null;
    if(session.getAttribute("userID")!=null){
        userID = (String) session.getAttribute("userID");
    }
    
    User user = new UserDAO().getUser(userID);
    
    int pageNumber =1;
    if(request.getParameter("pageNumber")!=null){
       pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
    
%>

<jsp:include page="/navbar.jsp" />

<section class="container" style="min-height:420px;">
	<form method="get" action="./Index.jsp" class="form-inline mt-3">
		<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
		<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
	    <%
			if(userID!=null){
				if(user.getUserPower()==1 || user.getUserPower()==2){ //1은 메니저 2는 관리자
		%>
		<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록 하기</a>
		<%
				}
			}else{
		%>
		<a class="btn btn-primary mx-1 mt-2" href="./Login.jsp">로그인 하러가기</a>
		<%
			}
		%>
	</form>
	<%
 		TaskBbsDAO taskDAO = new TaskBbsDAO();
 		ArrayList<TaskBbs> list = taskDAO.getList(pageNumber);
 		String content=null;
 		for(int i=0;i<list.size();i++){
 		
 		if(list.get(i).getTaskContent().length()>30)
 			content=list.get(i).getTaskContent().substring(0, 30)+"....";
 		else
 			content=list.get(i).getTaskContent();
	%>
	<div class="card bg-light mt-3">
		<div class="card-header bg-light">
			<div class="row"> 
				<div class="col-8 text-left"><a href="MyPage.jsp?userID=<%=list.get(i).getTaskManager() %>" style="color: #000000;"><%=list.get(i).getTaskManagerName()%></a>&nbsp;<small><%=list.get(i).getTaskDate().substring(0,11)+ "  " + list.get(i).getTaskDate().substring(11,13)+" : "+list.get(i).getTaskDate().substring(14,16) %></small></div>
			</div>
		</div>
		<div class="card-body">
			<p class="card-title"><a href="TaskView.jsp?TaskID=<%=list.get(i).getTaskID()%>" style="color:#000000"><strong><%=list.get(i).getTaskTitle()%></strong></a>
			<p class="card-text"><%=content%></p>
			<div class="row">
				<div class="col-11 text-right">
					<span>조회 : <%=list.get(i).getTaskHit()/2%></span> <!-- hit가 2씩 늘어남. 이유 모름. -->
				</div>
				<%
						if(list.get(i).getTaskManager().equals(userID)){
				%>
				<div class="col-1 text-left">
					<a onclick="return confirm('삭제하시겠습니까?')" href="./TaskDeleteAction.jsp?TaskID=<%=list.get(i).getTaskID()%>"><small>삭제</small></a>
				</div>
				<%
 						}
				%>
			</div>
		</div>	
	</div>
		<%
 		}
			
 			if(pageNumber!=1){
 		%>
 				<a href="Task.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn=success btn-arraw-left" style="color:#000000;">이전</a>
 		<%
 			} if(taskDAO.nextPage(pageNumber +1)){
 		%>
 			<a href="Task.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn=success btn-arraw-left" style="color:#000000;">다음</a>
 		<%
 			}
 		%>
</section>

<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">과제 등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="./TaskUploadAction.jsp" method="post">
				<div class="row">
					<div class="form-group col-4">
						<label>제출년(년도)</label>
						<select name="TaskDoneYear" class="form-control">
						<option value="2020" selected>2020</option>
						<option value="2021">2021</option>
						<option value="2022">2022</option>
						</select>
					</div>
					<div class="form-group col-4">
						<label>제출월</label>
						<select name="TaskDoneMonth" class="form-control">
						<option value="01" selected>1월</option>
						<option value="02">2월</option>
						<option value="03">3월</option>
						<option value="04">4월</option>
						<option value="05">5월</option>
						<option value="06">6월</option>
						<option value="07">7월</option>
						<option value="08">8월</option>
						<option value="09">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
						</select>
					</div>
					<div class="form-group col-4">
						<label>제출일</label>
						<select name="TaskDoneDay" class="form-control">
						<option value="01" selected>1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
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
					<div class="form-group col-sm-12">
						<label>제목</label>
						<input type="text" name="TaskTitle" class="form-control" maxlength="40" placeholder="Up to 40">
					</div>
					<div class="form-group col-sm-12">
						<label>내용</label>
						<textarea name="TaskContent" class="form-control" maxlength="2048" style="height: 180px"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./resources/js/jquery.min.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="./resources/js/popper.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>