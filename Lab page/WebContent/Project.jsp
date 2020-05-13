<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/navbar.jsp" />

<section class="container" style="min-height:420px;">
	<form method="get" action="./Index.jsp" class="form-inline mt-3">
		<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
		<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
		<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록 하기</a>
	</form>
<div class="card bg-light mt-3">
	<div class="card-header bg-light">
		<div class="row">
			<div class="col-8 text-left">이름, 이름, 이름 &nbsp;<small>2020.04.05</small>~<small>2020.04.05</small></div>
		</div>
	</div>
	<div class="card-body">
		<h4 class="card-title">프로젝트 명</h4>
		<p class="card-text"> 설명 <br>Ex) 연구실 페이지 만들기 프로젝트</p>
		<div class="row">
			<div class="col-9 text-left">
				<span><small>조회 (15)</small></span>
			</div>
			<div class="col-3 text-right">
				<a href="ShowProject.jsp" class="btn btn-secondary" role="button" class="form-control">자세히 보기 &raquo;</a>
				<a onclick="return confirm('삭제하시겠습니까?')" href="./NoticeDeleteAction.jsp?NoticeID=">삭제</a>
			</div>
		</div>
	</div>
</div>
</section>

<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">프로젝트 등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="./ProkectAction.jsp" method="post">
				<div class="form-row">
					<div class="form-group col-sm-6">
						<label>시작년</label>
						<select name="ProjectStartYear" class="form-control">
						<option value="2017" selected>2019</option>
						<option value="2017">2020</option>
						<option value="2017">2021</option>
						<option value="2017">2022</option>
						</select>
					</div>
					<div class="form-group col-sm-6">
						<label>시작월</label>
						<select name="ProjectStartMonth" class="form-control">
						<option value="1" selected>1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
						<option value="4">4월</option>
						<option value="5">5월</option>
						<option value="6">6월</option>
						<option value="7">7월</option>
						<option value="8">8월</option>
						<option value="9">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
						</select>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-sm-6">
						<label>제출년</label>
						<select name="ProjectDoneYear" class="form-control">
						<option value="2017" selected>2019</option>
						<option value="2017">2020</option>
						<option value="2017">2021</option>
						<option value="2017">2022</option>
						</select>
					</div>
					<div class="form-group col-sm-6">
						<label>제출월</label>
						<select name="ProjectDoneMonth" class="form-control">
						<option value="1" selected>1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
						<option value="4">4월</option>
						<option value="5">5월</option>
						<option value="6">6월</option>
						<option value="7">7월</option>
						<option value="8">8월</option>
						<option value="9">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
						</select>
					</div>
				</div>
					<div class="form-group col-sm-12">
						<label>제목</label>
						<input type="text" name="NoticeTitle" class="form-control" maxlength="40" placeholder="Up to 40">
					</div>
					<div class="form-group col-sm-12">
						<label>내용</label>
						<textarea name="NoticeContent" class="form-control" maxlength="2048" style="height: 180px"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="./resources/js/jquery.min.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="./resources/js/popper.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>