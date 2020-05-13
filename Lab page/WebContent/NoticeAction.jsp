<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="bbs.NoticeBbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //넘겨오는 데이터를 한글로
	
		String realFolder="C:\\Users\\정지혁\\eclipse-workspace\\FANTA\\WebContent\\resources\\file\\Notice\\"; 
		int maxSize = 1000*1024*1024; //최대 업로드될 파일 크기
		String encType = "utf-8";

		MultipartRequest multi = new MultipartRequest(request,realFolder, maxSize,encType,new DefaultFileRenamePolicy());

		String NoticeTitle=multi.getParameter("NoticeTitle");
		String NoticeContent=multi.getParameter("NoticeContent");
		String filesrc=multi.getFilesystemName("NoticefileSrc");
	
		String Noticefilesrc = realFolder+filesrc;
		
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
			if(NoticeTitle==null || NoticeContent== null){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('입력 안 된 사항이 있습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						
						NoticeBbsDAO noticeDAO = new NoticeBbsDAO();
						
						int result = noticeDAO.Write(NoticeTitle, userID,user.getUserName(), NoticeContent,Noticefilesrc);
						
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
							script.println("location.href = 'Notice.jsp'"); 
							script.println("</script>");
						}
					}
		}			
	%>
</body>
</html>