<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.NoticeBbs" %>
<%@ page import="bbs.NoticeBbsDAO" %>
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
    
    
	int NoticeID=0;
	if(request.getParameter("NoticeID") != null){
		NoticeID = Integer.parseInt(request.getParameter("NoticeID"));
	}
	
    NoticeBbs notice = new NoticeBbsDAO().getNotice(NoticeID);
    
	if(NoticeID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'Index.jsp'");
		script.println("</script>");
	}
	
	
     NoticeBbsDAO hitmaking = new NoticeBbsDAO();
     int hit=hitmaking.hitMaker(NoticeID);
	
	 String src = notice.getNoticefilesrc();
%>
<jsp:include page="/navbar.jsp" />

<section class="container" style="min-height:420px;">
<div class="card bg-light mt-3">
	<div class="card-header bg-light">
		<div class="row">
			<div class="col-8 text-left"><%=notice.getNoticeManagerName()%>&nbsp;<small> | <%=notice.getNoticeDate().substring(0,11)+ "  " + notice.getNoticeDate().substring(11,13)+" : "+notice.getNoticeDate().substring(14,16) %></small></div>
		</div>
	</div>
	<div class="card-body">
		<h3 class="card-title"><%=notice.getNoticeTitle() %></h3>
		<p class="card-text"><pre><%=notice.getNoticeContent() %></pre>
		<br>
		<%
			if(src.equals("C:\\Users\\정지혁\\eclipse-workspace\\FANTA\\WebContent\\resources\\file\\Notice\\null")){
				src="파일이 존재하지 않습니다.";
			} 
		%>
		<p class="card-file"><a style="color:#000000" href="<%=src %>"><%=src %></a></p>
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