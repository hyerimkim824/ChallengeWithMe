<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sw.css" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">
		<form id="create_form">
			<div class="chc-one">
				<div class="chc-title">챌린지 개설</div>
				<div class="chc-visi">
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
				<div class="auth-dur">인증빈도</div> 
			</div>
			<div class="chc-four">
				<div>
					<input type="text" id="chc_title" class="shadow-effect" placeholder="제목을 입력해주세요">
				</div>
				<div class="nickname-container">
					<img class="user-img">
					<p class="user-nickname">닉네임</p>
				</div>
			</div>
			<div class="chc-five">
				<div class="chc-image">
					<div class="image">
						<p><b>이미지 등록</b></p>
						<div class="chc-imageBtn">
							<button class="imageBtn">파일 찾기</button>
						</div>
					</div>
				</div>
				<div class="chc-info">
					<div class="chc-desc shadow-effect">
						<div class="info-title">챌린지 소개</div>
						<textarea id="chc_desc" class="ta1" placeholder="소개 글을 입력해주세요"></textarea>
					</div>
					<div class="chc-authm shadow-effect">
						<div class="info-title">인증방법</div>
						<div class="chc-authm-header">
							<div class="authm-title"><b>인증방식</b></div>
							<div class="dropdown">
								<button class="btn dropdown-toggle custom-btn shadow-effect" type="button" style="background-color:white" 
								data-bs-toggle="dropdown" aria-expanded="true">
									<c:if test="${!empty cat_name}">
										${cat_name}
									</c:if>
									<c:if test="${empty cat_name}">
										전체
									</c:if>
								</button>

								<ul class="dropdown-menu" style="background-color: #FFFAE5">
									<li><a class="dropdown-item" id="auth_pic" data-auth="0">사진
											인증</a></li>
									<li><a class="dropdown-item" id="auth_time" data-auth="1">시간
											인증</a></li>
									<li><a class="dropdown-item" id="auth_quote" data-auth="2">문구
											인증</a></li>
									<li><a class="dropdown-item" id="auth_qr" data-auth="3">QR코드
											인증</a></li>
									<li><a class="dropdown-item" id="auth_game" data-auth="4">게임
											인증</a></li>
									<li><a class="dropdown-item" id="auth_report"
										data-auth="5">가계부 인증</a></li>
									<li><a class="dropdown-item" id="auth_zoom" data-auth="6">줌
											인증</a></li>
								</ul>
							</div>
						</div>

						<textarea  class="ta2" placeholder="인증 방식을 입력해주세요"></textarea>
					</div>
				</div>
			</div>
			<div class="chc-six">
				<div class="extra-info shadow-effect">
					<ul>
						<li><label>참가인원</label> <input type="text"  class="extra-input" id="chc_people" placeholder="클릭 후 입력"></li>
						<li><label>고정 예치금</label> <input type="text" class="extra-input" id="chc_price" placeholder="클릭 후 입력"></li>
						<li><label>챌린지 기간</label> <input type="text" class="input-date" id="chc_start" placeholder="시작 날짜 (YY-MM-DD)"> <input type="text" class="input-date" id="chc_end" placeholder="종료 날짜 (YY-MM-DD)"></li>
						<li><label>참여 코드</label> EXAMPLE CODE</li>
					</ul>
				</div>
				<div class="auth-method shadow-effect">
					<div class="method-title align-center shadow-effect">인증방법</div>
					<br><br>
					<ul>
						<li><label>사진 인증</label><div class="info-detail shadow-effect">사진 올리기(일정 시간 내에 사진을 올리고 인증)</div></li>
						<li><label>시간 인증</label><div class="info-detail shadow-effect">시간 설정 버튼(온클릭 방식으로 눌러서 시작과 끝을 CHECK)</div></li>
						<li><label>문구 인증</label><div class="info-detail shadow-effect">문구따라쓰기(기상 미션 중 하나로 명언 따라쓰기)</div></li>
						<li><label>QR코드 인증</label><div class="info-detail shadow-effect">QR코드 : 일정 시간 내에 QR코드를 통해 인증</div></li>
						<li><label>게임 인증</label><div class="info-detail shadow-effect">간단한 아침 기상용게임(e.g 구구단 문제 등)</div></li>
						<li><label>가계부 인증</label><div class="info-detail shadow-effect">간단한 가계부 작성(e.g 소비,저축,지출)</div></li>
						<li><label>줌 인증</label><div class="info-detail shadow-effect">줌 링크 공유를 통한 챌린지 인증</div></li>
					</ul>
				</div>
			</div>



			<div class="chc-end align-center">
				<button class="submit-btn" type="submit">개설하기</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>