<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="bbs.QuestionBbs"%>
<%@ page import="bbs.QuestionBbsDAO"%>
<%@ page import="java.util.ArrayList" %>
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
    User user = new UserDAO().getUser(userID); //현제 세션의 userPower를 알아야함.(글 쓰기 위해)
    
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
 	QuestionBbsDAO questionDAO = new QuestionBbsDAO();
 	ArrayList<QuestionBbs> list = questionDAO.getList(pageNumber);
 	for(int i=0;i<list.size();i++){
%>
<div class="card bg-light mt-3">
	<div class="card-header bg-light">
		<div class="row"> 
			<div class="col-8 text-left"><a href="QuestionView.jsp?QuestionID=#" style="color: #000000;"><%=list.get(i).getQuestionManagerName()%></a>&nbsp;<small><%=list.get(i).getQuestionDate().substring(0,11)+ "  " + list.get(i).getQuestionDate().substring(11,13)+" : "+list.get(i).getQuestionDate().substring(14,16) %></small></div>
		</div>
	</div>
	<div class="card-body">
		<h4 class="card-title"><%=list.get(i).getQuestionTitle() %></h4>
		<div class="row">
		<%
			if(list.get(i).getQuestionManager().equals(userID) && list.get(i).getQuestionCode().equals("null")){
		%>
			<div class="col-9 text-left">
				<a onclick="return confirm('코드를 등록하시겠습니까?')" href="./QuestionWrite.jsp?QuestionID=<%=list.get(i).getQuestionID()%>">코드 업로드</a>
			</div>
		<%
			} else{
		%>
			<div class="col-9 text-left">
				<a href="./QuestionView.jsp?QuestionID=<%=list.get(i).getQuestionID()%>">자세히 보기</a>
			</div>
		<%
			}
		%>
			<div class="col-2 text-right">
				<span><small>조회(<%=list.get(i).getQuestionhit()%>)</small></span>
			</div>
			<div class="col-1 text-right">
				<a onclick="return confirm('삭제하시겠습니까?')" href="./QuestionDeleteAction.jsp?NoticeID=<%=list.get(i).getQuestionID()%>"><small>삭제</small></a>
			</div>
		</div>
	</div>
</div>
<%
 	}
%>
</section>

<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">질문 등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="./QuestionAction.jsp" method="post">
					<div class="form-group col-sm-6">
						<label>과목</label>
						<select name="QuestionType" class="form-control">
							<option value="기타" selected>기타</option>
							<option value="C 프로그래밍">C 프로그래밍</option>
							<option value="C++ 프로그래밍">C++ 프로그래밍</option>
							<option value="Java 프로그래밍">Java 프로그래밍</option>
							<option value="JSP 프로그래밍">JSP 프로그래밍</option>
						</select>
					</div>
					<div class="form-group col-sm-12">
						<label>제목</label>
						<input type="text" name="QuestionTitle" class="form-control" maxlength="40" placeholder="Up to 40">
					</div>
					<div class="form-group col-sm-12">
						<label>내용</label>
						<textarea name="QuestionContent" class="form-control" maxlength="2048" style="height: 180px" placeholder="질문 내용을 입력해 주세요."></textarea>
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