<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="bbs.SubmitTask" %>
<%@ page import="bbs.SubmitTaskDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //넘겨오는 데이터를 한글로
	
		String realFolder="C:\\Users\\정지혁\\eclipse-workspace\\FANTA\\WebContent\\resources\\file\\SubmitTask\\"; 
		int maxSize = 1000*1024*1024; //최대 업로드될 파일 크기
		String encType = "utf-8";

		MultipartRequest multi = new MultipartRequest(request,realFolder, maxSize,encType,new DefaultFileRenamePolicy());

		String SubmitTaskTitle=multi.getParameter("SubmitTaskTitle");
		String SubmitTaskContent=multi.getParameter("SubmitTaskContent");
		String file=multi.getFilesystemName("SubmitTaskfile");
	
		String filesrc = realFolder+file;
		
		
		int TaskID=0;
		if(request.getParameter("TaskID") != null){
			TaskID = Integer.parseInt(request.getParameter("TaskID"));
		}
		
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
			if(SubmitTaskTitle==null || SubmitTaskContent== null){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('입력 안 된 사항이 있습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						
						SubmitTaskDAO submittaskDAO = new SubmitTaskDAO();
						
						int result = submittaskDAO.Write(TaskID, userID,user.getUserName(), SubmitTaskTitle,SubmitTaskContent,filesrc);
						
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