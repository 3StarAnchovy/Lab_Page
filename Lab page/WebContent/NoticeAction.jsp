<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8"); //set���ξ��½������̼���.
%>

<!-- �Ѹ��� ȸ�������� ��� userŬ������ �ڹ� ����� ��� / scope:������ ������ ������������ ���-->

<jsp:useBean id="bbs" class="bbs.bbs" scope="page" />

<!-- // Bbs bbs = new Bbs(); -->

<jsp:setProperty name="bbs" property="bbsTitle" /><!-- bbs.setBbsTitle(requrst) -->
<jsp:setProperty name="bbs" property="fileName" />
<jsp:setProperty name="bbs" property="bbsContent" />

<%
	System.out.println(bbs);
%>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>�� ���ε�</title>

</head>

<body>

	<%
		String userID = null;
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 1000;
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());

		Enumeration fileNames = multipartRequest.getFileNames(); //���� ���� üũ�� ���� Enumertaion ��ü ����, getFileNames �޼ҵ�� ��� �ִ� �޼ҵ尡 �ƴ� �� ����

		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		String thumbnailName = multipartRequest.getOriginalFileName("thumbnail");
		String thumbnailRealName = multipartRequest.getFilesystemName("thumbnail");

		String a = multipartRequest.getParameter("NoticeTitle");
		String b = multipartRequest.getParameter("NoticeContent");
		System.out.println(a + b); //�Ķ���� �ǳʿ��°� üũ
		if (session.getAttribute("userID") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			userID = (String) session.getAttribute("userID");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {

			if (a == null || b == null) {
				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�')");

				script.println("history.back()");
				script.println("</script>");

			} else {
				bbs.setBbsTitle(a);
				bbs.setBbsContent(b);
				BbsDAO BbsDAO = new BbsDAO();

				int result = BbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent(), bbs.getHit(),
						bbs.getRef(), fileName, fileRealName, bbs.getFileSrc(), thumbnailName, thumbnailRealName);

				if (result == -1) {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('�۾��⿡ �����߽��ϴ�')");

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