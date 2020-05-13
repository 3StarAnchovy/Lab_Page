<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="bbs.QuestionBbsDAO" %>
<%@ page import="bbs.QuestionBbs" %> 
<%@ page import="java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
	
			String realFolder="C:\\Users\\정지혁\\eclipse-workspace\\FANTA\\WebContent\\resources\\file\\Question\\"; 
			int maxSize = 1000*1024*1024; //최대 업로드될 파일 크기
			String encType = "utf-8";

			MultipartRequest multi = new MultipartRequest(request,realFolder, maxSize,encType,new DefaultFileRenamePolicy());
	
			String Code=multi.getParameter("QuestionCode");
			String filesrc=multi.getFilesystemName("Questionfilesrc");
	
			String Questionfilesrc = realFolder+filesrc;
	
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
			
			int QuestionID=0;
			if(request.getParameter("QuestionID") != null){
				QuestionID = Integer.parseInt(request.getParameter("QuestionID"));
			}
			if(QuestionID ==0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			QuestionBbs question = new QuestionBbsDAO().getQuestion(QuestionID);
			if(!userID.equals(question.getQuestionManager())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				if(Code=="null"){
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('입력 안 된 사항이 있습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}else{
							QuestionBbsDAO questionDAO = new QuestionBbsDAO(); //인스턴스생성
							int result = questionDAO.CodeUpdate(QuestionID, Code, Questionfilesrc);
							
							if(result == -1){
								PrintWriter script = response.getWriter();
								script.println("<script>");
								script.println("alert('글 수정에 실패 했습니다.')");
								script.println("location.href = 'Login.jsp'"); //이전 페이지 login.jsp로 돌려보냄.
								script.println("</script>");
							}
							else{
								PrintWriter script = response.getWriter();
								script.println("<script>");
								script.println("location.href = 'Question.jsp'"); 
								script.println("</script>");
							}
						}
			}		
	%>
</body>
</html>