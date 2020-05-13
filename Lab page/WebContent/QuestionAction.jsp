<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="bbs.QuestionBbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //넘겨오는 데이터를 한글로
	    
		String QuestionTitle=request.getParameter("QuestionTitle");
		String QuestionContent=request.getParameter("QuestionContent");
		String Type=request.getParameter("QuestionType");
		
		
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
		 User user = new UserDAO().getUser(userID);
		 
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'Login.jsp'");
			script.println("</script>");
		}else{
			if(QuestionTitle==null || QuestionContent== null){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('입력 안 된 사항이 있습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						
						QuestionBbsDAO questionDAO = new QuestionBbsDAO();
						
						int result = questionDAO.Write(QuestionTitle, QuestionContent, userID, user.getUserName(),Type);
						
						if(result == -1){
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기에 실패 했습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						else{
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href='QuestionWrite.jsp'");
							script.println("</script>");
						}
					}
		}	
		%>
</body>
</html>