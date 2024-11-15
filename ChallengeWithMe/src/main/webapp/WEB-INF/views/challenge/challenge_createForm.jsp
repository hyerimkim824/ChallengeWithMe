<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sw.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">
		<form id="create_form">
			<div class="chc-one">
				<div class="chc-title">챌린지 개설</div>
				<div>
					<img>
					<p>공개</p>
				</div>
			</div>
			<div class="chc-two">
				<p>챌린지를 만들어주세요</p>
			</div>
			<div class="chc-three">
				<div class="dropdown">
					<button class="btn dropdown-toggle" type="button"
						style="background-color: #FFE066" data-bs-toggle="dropdown"
						aria-expanded="true">
						<c:if test="${!empty cat_name}">
					${cat_name}
				</c:if>
						<c:if test="${empty cat_name}">
					전체
				</c:if>
					</button>

					<ul class="dropdown-menu" style="background-color: #FFFAE5">
						<li><a class="dropdown-item" id="cat_all" data-catagory="0">전체</a></li>
						<li><a class="dropdown-item" id="cat_health"data-catagory="1">건강</a></li>
						<li><a class="dropdown-item" id="cat_food" data-catagory="2">식습관</a></li>
						<li><a class="dropdown-item" id="cat_develop" data-catagory="3">자기계발</a></li>
					</ul>
				</div>
				<div>인증빈도</div>
			</div>
			<div class="chc-main">
				<div>
					<input type="text" id="chc_title" placeholder="제목 입력하는 공간">
				</div>
				<div>
					<img>
					<p>닉네임</p>
				</div>
				<div>
					<div>
						<p>이미지 등록</p>
						<button>파일 찾기</button>
					</div>
					<div>
						<div>챌린지 소개</div>
						<textarea id="chc_desc">소개 글 입력 공간</textarea>
					</div>
					<div>
						<div>인증방법</div>
						<label>인증방식</label><input type="radio">
						<textarea>인증방법 글 입력 공간</textarea>
					</div>
					<div>
						<ul>
							<li><label>참가인원</label> <input type="text" id="chc_people"></li>
							<li><label>고정 예치금</label> <input type="text" id="chc_price"></li>
							<li><label>챌린지 기간</label> <input type="text" id="chc_duration"></li>
							<li><label>참여 코드</label> <p>EXAMPLE CODE</p></li>
						</ul>
					</div>
					<div>
						<div>인증방법</div>
						<ul>
							<li>시간 설정 버튼(온클릭 방식으로 눌러서 시작과 끝을 check)</li>
							<li>사진 올리기(일정 시간 내에 올린 것 만 인정)</li>
							<li>문구따라쓰기(기상 미션 중 하나로 명언 따라쓰기)</li>
							<li>QR코드 : 일정 시간 내에 QR코드를 통해 인정을 받아야 함</li>
							<li>간단한 아침 기상용게임(e.g 구구단 문제 등)</li>
							<li>소비,저축,지출 정도만 명시한 간단한 가계부 작성</li>
							<li>줌 링크 공유를 통한 공부감시 시스템</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="chc-end">
				<button>개설하기</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>