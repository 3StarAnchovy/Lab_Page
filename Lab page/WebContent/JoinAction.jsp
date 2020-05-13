<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 utf-8로 -->
<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope='page' 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userPhnum" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FNATA_WEB</title>
</head>
<body>
	<% 
	
			String Year = request.getParameter("userBirthday_year");
			String Month = request.getParameter("userBirthday_month");
			String Day = request.getParameter("userBirthday_day");
			String Birthday = Year+"."+Month+"."+Day;
			
			String userProfileSrc=".//resources//images//ProfileImages//empty-profile.png";
	
			//로그인된 사람이 또 로그인 하는 것을 방지
			String userID = null;
			if(session.getAttribute("userID")!=null){
				userID = (String) session.getAttribute("userID");
			}
			if(userID != null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 로그인이 되어있습니다.')");
				script.println("location.href = 'Index.jsp'");
				script.println("</script>");
			}	
		
			
		if(user.getUserID()==null || user.getUserPassword()==null || user.getUserName()==null ||
		   user.getUserEmail()==null || user.getUserPhnum()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			
			UserDAO userDAO = new UserDAO(); //인스턴스생성
			int result = userDAO.Join(user,Birthday,userProfileSrc);
			
			//회원가입 실패
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				//UserID가 데이터베이스 기본 키이므로 중복되면 DB오류 발생
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("location.href = 'login.jsp'"); //이전 페이지 login.jsp로 돌려보냄.
				script.println("</script>");
			}
			//회원가입 성공
			else{ 
				session.setAttribute("userID",user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'Index.jsp'"); 
				script.println("</script>");
			}
		}			
	%>
</body>
</html>