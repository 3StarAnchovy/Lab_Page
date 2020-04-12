<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<%@ page import="bbs.bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!-- src 받아오기 위한 다오 import -->
<%@ page import="java.util.ArrayList"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>

	<jsp:include page="/navbar.jsp" />

	<section class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<input type="text" name="search" class="form-control mx-1 mt-2"
				placeholder="내용을 입력하세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>

			<%
				//시발 세션 
				String userID = null;
				if (session.getAttribute("userID") != null) {
					userID = (String) session.getAttribute("userID");
				}
				System.out.println(userID);

				if (userID.equals("admin")) {
			%>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal"
				href="#registerModal">공지 하기</a>
			<%
				} //관리자면 공지하기 버튼 출력
			%>
		</form>

		<%
			int pageNumber = 1; //기본 페이지 넘버
			//페이지넘버값이 있을때
			//if (request.getParameter("pageNumber") != null) {
			//pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			//}
			bbs bbs = new bbs();
			BbsDAO bbsDAO = new BbsDAO(); //

			ArrayList<bbs> list = bbsDAO.getList(pageNumber);
			String[] thumbnailPaths = new String[list.size()];

			for (int i = 0; i < list.size(); i++) {
		%>
		<div class="card bg-light mt-3">
			<!-- 여기 수정 //지민 -->
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
						<%=list.get(i).getUserID()%>&nbsp;<small>2020.04.05</small>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h4 class="card-title"><%=list.get(i).getBbsTitle()%></h4>
				<p class="card-text"><%=list.get(i).getBbsContent()%></p>
				<div class="row">
					<div class="col-9 text-left">
						<span><small>조회 (<%=list.get(i).getHit()%>)
						</small></span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('삭제하시겠습니까?')"
							href="./NoticeDeleteAction.jsp?NoticeID=">삭제</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%
		}
	%>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">공지 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form enctype="multipart/form-data" action="./NoticeAction.jsp"
						method="post">
						<div class="form-group col-sm-12">
							<label>제목</label> <input type="text" name="NoticeTitle"
								class="form-control" maxlength="40" placeholder="Up to 40">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="NoticeContent" class="form-control"
								maxlength="2048" style="height: 180px"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 정지혁 김지민 김성현 정선규 All Right Reserver tel :
		010-1111-2222 <br> add : 이학관 207 <a href="./Map.jsp"
			class="btn btn-secondary" role="button" class="form-control"> 위치
			보기 &raquo;</a>
	</footer>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./resources/js/jquery.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./resources/js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>