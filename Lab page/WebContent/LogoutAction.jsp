<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		session.invalidate();
		//회원의 세션을 빼앗아 로그아웃 처리함.
	%>
	<script>
		location.href = 'Index.jsp';
	</script>
</body>
</html>