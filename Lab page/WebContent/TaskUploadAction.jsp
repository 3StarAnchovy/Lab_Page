<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="bbs.TaskBbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //넘겨오는 데이터를 한글로
	

		String Year=request.getParameter("TaskDoneYear");
		String Month=request.getParameter("TaskDoneMonth");
		String Day=request.getParameter("TaskDoneDay");
		String TaskTitle=request.getParameter("TaskTitle");
		String TaskContent=request.getParameter("TaskContent");
		
		String DoneDate = Year+"-"+ Month+"-"+Day;
		
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
			if(TaskTitle==null || TaskContent== null){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('입력 안 된 사항이 있습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						
						TaskBbsDAO noticeDAO = new TaskBbsDAO();
						
						int result = noticeDAO.Write(TaskTitle, userID,user.getUserName(), TaskContent,DoneDate);
						
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
							script.println("location.href = 'Task.jsp'"); 
							script.println("</script>");
						}
					}
		}			
	%>
</body>
</html>