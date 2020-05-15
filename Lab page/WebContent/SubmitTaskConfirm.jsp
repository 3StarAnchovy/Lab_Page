<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="bbs.SubmitTaskDAO" %>
<%@ page import="bbs.SubmitTask" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
			String userID = null;
			if(session.getAttribute("userID")!=null){
				userID = (String) session.getAttribute("userID");
			}
			if(userID == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요.')");
				script.println("location.href = 'Login.jsp'");
				script.println("</script>");
			}
			
			int SubmitTaskID=0;
			if(request.getParameter("SubmitTaskID") != null){
				SubmitTaskID = Integer.parseInt(request.getParameter("SubmitTaskID"));
			}
			if(SubmitTaskID==0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글 입니다.')");
				script.println("location.href = 'Task.jsp'");
				script.println("</script>");
			}
			User user = new UserDAO().getUser(userID);
			
			if(user.getUserPower()==0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				SubmitTaskDAO taskDAO = new SubmitTaskDAO();
				int result = taskDAO.Confirm(SubmitTaskID);
					
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('과제 승인에 실패 했습니다.')");
					script.println("location.href = 'Login.jsp'");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'Task.jsp'"); 
					script.println("</script>");
				}
			}
	
			
	%>
</body>
</html>