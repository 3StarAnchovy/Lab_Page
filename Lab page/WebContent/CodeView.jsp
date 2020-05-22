<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.CodeBbs" %>
<%@ page import="bbs.CodeBbsDAO" %>
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
    
    
	int CodeID=0;
	if(request.getParameter("CodeID") != null){
		CodeID = Integer.parseInt(request.getParameter("CodeID"));
	}
	
    CodeBbs code = new CodeBbsDAO().getCode(CodeID);
    
	if(CodeID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'Index.jsp'");
		script.println("</script>");
	}
	
%>
<jsp:include page="/navbar.jsp" />

<section class="container" style="min-height:420px;">
<div class="card bg-light mt-3">
	<div class="card-header bg-light">
		<div class="row">
			<div class="col-8 text-left"><%=code.getCodeManagerName()%>&nbsp;<small> | <%=code.getCodeDate().substring(0,11)+ "  " + code.getCodeDate().substring(11,13)+" : "+code.getCodeDate().substring(14,16) %></small></div>
		</div>
	</div>
	<div class="card-body">
		<h3 class="card-title"><%=code.getCodeTitle() %></h3>
		<p class="card-text mt-3"><pre><%=code.getCodeContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></pre>
	</div>
</div>
<hr>
<div class="row">
	<a class="mt-3" href="Code.jsp?CodeType=<%=code.getCodeType() %>" style="color:#000000"><%=code.getCodeType()%>의 다른 코드 보기 &gt;&gt;</a>
	
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