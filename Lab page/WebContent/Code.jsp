<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="bbs.CodeBbs"%>
<%@ page import="bbs.CodeBbsDAO" %>
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
    
    String CodeType ="etc";
    if(request.getParameter("CodeType")!=null){
    	CodeType = request.getParameter("CodeType");
    }else if(session.getAttribute("CodeType")!=null){
    	CodeType = (String) session.getAttribute("CodeType");
    }
%>
<jsp:include page="/navbar.jsp" />
<section style="min-height:420px;">
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
	<hr>
	<aside class="mt-4 ml-4" style="float:left; width:80px;">
	<h3>Category</h3>
	<ul>
		<li style="text-align:left;"><a href="Code.jsp?CodeType=C">C</a></li>
		<li style="text-align:left;"><a href="Code.jsp?CodeType=JAVA">JAVA</a></li>
		<li style="text-align:left;"><a href="Code.jsp?CodeType=JSP">JSP</a></li>
		<li style="text-align:left;"><a href="Code.jsp?CodeType=HTML" style="font-size:15px">HTML</a></li>
		<li style="text-align:left;"><a href="Code.jsp?CodeType=etc">etc</a></li>
	</ul>
	</aside>
	<%
 	CodeBbsDAO codeDAO = new CodeBbsDAO();
 	
 	if(CodeType.equals("etc")){
 	 
 	ArrayList<CodeBbs> list = codeDAO.getList(pageNumber);
 		
 	for(int i=0;i<list.size();i++){
 		
 		String content="내용이 없습니다.";
 		
 		if(list.get(i).getCodeAvailable()!=0){
 			if(list.get(i).getCodeContent().length()>30)
 				content=list.get(i).getCodeContent().substring(0, 30).replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")+"...";
 			else
 				content=list.get(i).getCodeContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")+"...";
 		}
 			
	%>
	<div class="container card bg-light mt-3">
		<div class="card-header bg-light">
			<div class="row"> 
				<div class="col-8 text-left"><a href="MyPage.jsp?userID=<%=list.get(i).getCodeManager() %>" style="color: #000000;"><%=list.get(i).getCodeManagerName()%></a>&nbsp;<small><%=list.get(i).getCodeDate().substring(0,11)+ "  " + list.get(i).getCodeDate().substring(11,13)+" : "+list.get(i).getCodeDate().substring(14,16) %></small></div>
			</div>
		</div>
		<div class="card-body">
			<p class="card-title"><a href="CodeView.jsp?CodeID=<%=list.get(i).getCodeID() %>" style="color:#000000"><strong><%=list.get(i).getCodeTitle() %></strong></a>
			<p class="card-text"><%=content %></p>
			<div class="row">
				<div class="col-11 text-right">
					<span>추천 : <%=list.get(i).getCodeLike() %></span>
				</div>
				<%
					if(userID == list.get(i).getCodeManager() || user.getUserPower()==2){
				%>
				<div class="col-1 text-left">
					<a onclick="return confirm('삭제하시겠습니까?')" href="./CodeDeleteAction.jsp?CodeID=#"><small>삭제</small></a>
				</div>
				<%
 					}
				%>
			</div>
		</div>	
	</div>
	<%
 		}
 	}else{
 		
 		ArrayList<CodeBbs> list = codeDAO.getTypeList(pageNumber,CodeType);
 		
 		for(int i=0;i<list.size();i++){
 			
 		String content="내용이 없습니다.";
 		
 		if(list.get(i).getCodeAvailable()!=0){
 			if(list.get(i).getCodeContent().length()>30)
 				content=list.get(i).getCodeContent().substring(0, 30).replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")+"...";
 			else
 				content=list.get(i).getCodeContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")+"...";
 		}
 	%>
 	<div class="container card bg-light mt-3">
		<div class="card-header bg-light">
			<div class="row"> 
				<div class="col-8 text-left"><a href="MyPage.jsp?userID=<%=list.get(i).getCodeManager() %>" style="color: #000000;"><%=list.get(i).getCodeManagerName()%></a>&nbsp;<small><%=list.get(i).getCodeDate().substring(0,11)+ "  " + list.get(i).getCodeDate().substring(11,13)+" : "+list.get(i).getCodeDate().substring(14,16) %></small></div>
			</div>
		</div>
		<div class="card-body">
			<p class="card-title"><a href="CodeView.jsp?CodeID=<%=list.get(i).getCodeID() %>" style="color:#000000"><strong><%=list.get(i).getCodeTitle() %></strong></a>
			<p class="card-text"><%=content %></p>
			<div class="row">
				<div class="col-11 text-right">
					<span>추천 : <%=list.get(i).getCodeLike() %></span>
				</div>
				<%
					if(userID == list.get(i).getCodeManager() || user.getUserPower()==2){
				%>
				<div class="col-1 text-left">
					<a onclick="return confirm('삭제하시겠습니까?')" href="./CodeDeleteAction.jsp?CodeID=<%=list.get(i).getCodeID()%>"><small>삭제</small></a>
				</div>
				<%
 					}
				%>
			</div>
		</div>	
	</div>
 	<%
 	}
 	}
 		if(pageNumber!=1){
 	%>
 			<a href="Code.jsp?pageNumber=<%=pageNumber - 1%>?CodeType=<%=CodeType%>" class="btn btn=success btn-arraw-left" style="color:#000000;">이전</a>
 	<%
		} if(codeDAO.nextPage(pageNumber +1)){
 	%>
 		<a href="Code.jsp?pageNumber=<%=pageNumber + 1%>?CodeType=<%=CodeType%>" class="btn btn=success btn-arraw-left" style="color:#000000;">다음</a>
 	<%
 		}
 	%>
</section>
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">코드 등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="CodeAction.jsp" method="post">
					<div class="form-group col-sm-12">
						<label>타입</label>
						<div class="row">
						<input class="ml-3" type="radio" name="CodeType" value="C">C 언어&nbsp;
						<input type="radio" name="CodeType" value="JAVA">JAVA 언어&nbsp;
						<input type="radio" name="CodeType" value="JSP">JSP 언어&nbsp;
						<input type="radio" name="CodeType" value="HTML">HTML 언어&nbsp;
						<input type="radio" name="CodeType" value="etc">기타
					    </div>
				  	</div>
					<div class="form-group col-sm-12">
						<label>제목</label>
						<input type="text" name="CodeTitle" class="form-control" maxlength="40" placeholder="Up to 40">
					</div>
					<div class="form-group col-sm-12">
						<label>내용</label>
						<textarea name="CodeContent" class="form-control" maxlength="2048" style="height: 180px" placeholder="도움이 될만한 코드를 작성해 주세요."></textarea>
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
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/popper.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
