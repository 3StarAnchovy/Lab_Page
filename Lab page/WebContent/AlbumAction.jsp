<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="album.AlbumDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
%>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->

<jsp:useBean id="album" class="album.album" scope="page" />

<!-- // Bbs bbs = new Bbs(); -->

<jsp:setProperty name="album" property="bbsTitle" /><!-- bbs.setBbsTitle(requrst) -->
<jsp:setProperty name="album" property="fileName" />
<jsp:setProperty name="album" property="bbsContent" />

<%
	System.out.println(album);
%>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>글 업로드</title>

</head>

<body>

	<%
		String userID = null;
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 1000;
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());

		Enumeration fileNames = multipartRequest.getFileNames(); //다중 파일 체크를 위한 Enumertaion 객체 생성, getFileNames 메소드는 빈즈에 있는 메소드가 아님 헷갈 ㄴㄴ

		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		String thumbnailName = multipartRequest.getOriginalFileName("thumbnail");
		String thumbnailRealName = multipartRequest.getFilesystemName("thumbnail");

		String a = multipartRequest.getParameter("AlbumTitle");
		String b = multipartRequest.getParameter("AlbumContent");
		System.out.println(a + b); //파라미터 건너오는거 체크
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'Login.jsp'");
			script.println("</script>");
		} else {

			if (a == null || b == null) {
				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('입력이 안된 사항이 있습니다')");

				script.println("history.back()");
				script.println("</script>");

			} else {
				album.setBbsTitle(a);
				album.setBbsContent(b);
				AlbumDAO BbsDAO = new AlbumDAO();

				int result = BbsDAO.write(album.getBbsTitle(), userID, album.getBbsContent(), album.getHit(),
						album.getRef(), fileName, fileRealName, album.getFileSrc(), thumbnailName, thumbnailRealName);

				if (result == -1) {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('글쓰기에 실패했습니다')");

					script.println("history.back()");

					script.println("</script>");

				} else {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("location.href='index.jsp'");

					//script.println("history.back()");

					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>