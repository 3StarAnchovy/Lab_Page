<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="bbs.NoticeBbs"%>
<%@ page import="bbs.NoticeBbsDAO"%>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<style>
 td {background-color:#F6F6F6;}
</style>
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
		<a class="btn btn-primary mx-1 mt-2" href="NoticeWrite.jsp">공지 하기</a>
		<%
			}
				}else{
		%>
		<a class="btn btn-primary mx-1 mt-2" href="./Login.jsp">로그인 하러가기</a>
		<%
			}
		%>		
	</form>
<div class="card bg-light mt-3">
   <div class="card-header bg-light">
      <div class="row">
      <!--  -->
      <%
      NoticeBbs notice = new NoticeBbsDAO().getNotice(1);
      
      for(int i=1 ; ;i++){
         if(notice.getNoticeAvailable()==0)
         	notice = new NoticeBbsDAO().getNotice(i+1);
         else{
            notice = new NoticeBbsDAO().getNotice(1);
            break;
         }
      }
      String content;
  	  if(notice.getNoticeContent().length()>30)
 		content=notice.getNoticeContent().substring(0, 30);
 	  else
 		content = notice.getNoticeContent();
      %>
         <div class="col-8 text-left"><%=notice.getNoticeManagerName()%>&nbsp;<small> | <%=notice.getNoticeDate().substring(0,11)+ "  " + notice.getNoticeDate().substring(11,13)+" : "+notice.getNoticeDate().substring(14,16) %></small></div>
      </div>
   </div>
   <div class="card-body">
      <strong class="card-title" style="font-size:15;"><a href="./NoticeView.jsp?NoticeID=<%=notice.getNoticeID() %>" style="color: #000000;"><%=notice.getNoticeTitle()%></a></strong>
      <p class="card-text mt-1"><%=content%>....
      <div class="row">
         <div class="col-9 text-left">
            <span><small>조회 (<%=notice.getNoticehit() %>)</small></span>
         </div>
         <%
         	if(userID==notice.getNoticeManager()){
         %>
            <div class="col-3 text-right">
               <a onclick="return confirm('삭제하시겠습니까?')" href="./NoticeDeleteAction.jsp?NoticeID=<%=notice.getNoticeID()%>">삭제</a>
            </div>
           <%
         	}
           %>
      </div>
   </div>
</div>
<hr>
<div class="container">
 	<table class="table table-striped" style="border-collpse:collapse;">
 		<%
 			 NoticeBbsDAO noticeDAO = new NoticeBbsDAO();
 			 ArrayList<NoticeBbs> list = noticeDAO.getList(pageNumber);
 			 for(int i=0;i<list.size();i++){
 		 %> 
 		<tr>
 			<td style="text-align:left;"><a href="NoticeView.jsp?NoticeID=<%=list.get(i).getNoticeID()%>" style="color:#000000; font-size:13px;"><%= list.get(i).getNoticeTitle()%></a></td>
 			<td style="font-size:13px;"><%= list.get(i).getNoticeDate().substring(0,11) %></td>
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
 			} if(noticeDAO.nextPage(pageNumber +1)){
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