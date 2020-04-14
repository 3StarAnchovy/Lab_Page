<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter"%>
<!-- 자바 클래스 사용 -->
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>



<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->

<jsp:useBean id="user" class="user.user" scope="page" />

<jsp:setProperty name="user" property="userID" />
<!-- 빈즈 세팅 -->
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />


<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
		//라긴된 회원들은 페이지에 접속 할 수 없도록
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		String directory = application.getRealPath("/upload/"); //경로 세팅
		int maxSize = 1024 * 1024 * 1000; //사이즈
		String encoding = "UTF-8"; //인코딩 규격 utf-8
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());

		String userprofileName = multipartRequest.getOriginalFileName("file");
		String userprofileRealName = multipartRequest.getFilesystemName("file");
		String ID = multipartRequest.getParameter("userID"); // multipart/form-data여서 setproperty가 안됨 시발
		String Password = multipartRequest.getParameter("userPassword");
		String Name = multipartRequest.getParameter("userName");
		if (ID == null || Password == null || Name == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");

		}
		
		/* else if(request.getParameter("userPassword") != request.getParameter("userPassword2"))
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}*/
		
		else {
			user.setUserID(ID); //빈즈세팅
			user.setUserPassword(Password);
			user.setUserName(Name); 
			user.setUserprofileName(userprofileName);
			user.setUserprofileRealName(userprofileName);
			UserDAO userDAO = new UserDAO(); //인스턴스생성
			int result = userDAO.join(user);

			if (result == -1) { // 아이디가 기본키기. 중복되면 오류.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//가입성공
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</body>
</html>