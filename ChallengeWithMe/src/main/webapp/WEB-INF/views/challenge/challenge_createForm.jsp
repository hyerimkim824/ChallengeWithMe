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
<script src="${pageContext.request.contextPath}/js/challenge.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">
	<!-- =====================form 시작 ============================ -->
		<form id="create_form" action="challengeCreate.do" method="post" enctype="multipart/form-data">
			<div class="chc-one">
				<div class="chc-title">챌린지 개설</div>
				<div class="chc-visi">
					<img id="visi_img" src="${pageContext.request.contextPath}/images/unlock.svg">
					<div id="visi_text">공개</div>
				</div>
				<input type="hidden" name="visi" id="visiState" value="0">
				<c:if test="${admin == 9}">
					<div class="chc-official align-center">
						<div id="official_text">사용자 챌린지</div>
					</div>
				</c:if>
				<input type="hidden" name="official" id="officialState" value="0">
			</div>
			<div class="chc-two">
				<p>챌린지를 만들어주세요</p>
			</div>
			<div class="chc-three">
				<div class="dropdown"> 
					<button class="btn dropdown-toggle create-dd-btn" type="button"
						style="background-color: #FFE066" data-bs-toggle="dropdown"
						aria-expanded="true">
						<c:if test="${!empty cat_name}">
							${cat_name}
						</c:if>
						<c:if test="${empty cat_name}">
							카테고리
						</c:if>
					</button>
					
					<ul class="dropdown-menu" style="background-color: #FFFAE5">
						<li><a class="dropdown-item create-dd" id="cat_health" data-category="1">건강</a></li>
						<li><a class="dropdown-item create-dd" id="cat_food" data-category="2">식습관</a></li>
						<li><a class="dropdown-item create-dd" id="cat_develop" data-category="3">자기계발</a></li>
						<li><a class="dropdown-item create-dd" id="cat_wakeup" data-category="4">기상</a></li>
						<li><a class="dropdown-item create-dd" id="cat_economy" data-category="5">경제</a></li>
						<li><a class="dropdown-item create-dd" id="cat_moderation" data-category="6">금연/금주</a></li>
					</ul>
					<input type="hidden" id="cate_num" name="cate_num">
				</div>
				
				<div class="auth-dur">인증주기 <input class="authd-input" name="chc_auth_duration" required>일마다</div> 
			</div>
			<p class="warning cat-warn">카테고리가 선택되지 않았습니다!</p>
			<div class="chc-four">
				<div>
					<input type="text" id="chc_title" name="chc_title" class="shadow-effect" placeholder="제목을 입력해주세요" required>
				</div>
				<div class="nickname-container">
					<c:if test="${us_img == null}">
						<img class="user-img" src="${pageContext.request.contextPath}/images/face.png">
					</c:if>
					<c:if test="${us_img != null}">
						<img class="user-img" src="${pageContext.request.contextPath}/images/${us_img}">
					</c:if>
					<p class="user-nickname">${us_nickname}</p>
				</div>
			</div>
			<div class="chc-five">
				<div class="chc-image">
				
					<div class="image">
						<img id="previewImage" src="" alt="이미지 미리보기" />
						<button type="button" class="image-reselectBtn">사진 재선택</button>
						<p class="image-text"><b>이미지 등록</b></p>
						<div class="chc-imageBtn">
							<input type="file" name="img" id="fileInput" accept="image/*" style="display:none;" />
							<button class="imageBtn" id="imageBtn">사진 선택</button>
						</div>
						
					</div>
				
				</div>
				<div class="chc-info">
					<div class="chc-desc shadow-effect">
						<div class="info-title">챌린지 소개</div>
						<textarea id="chc_desc" class="ta1" name="chc_desc" placeholder="소개 글을 입력해주세요" maxlength="500"></textarea>
					</div>
					<div class="chc-authm shadow-effect">
						<div class="info-title">인증방법</div>
						<div class="chc-authm-header">
							<div class="authm-title"><b>인증방식</b></div>
							<div class="dropdown">
								<button class="btn dropdown-toggle custom-btn shadow-effect" id="auth_btn" type="button" style="background-color:white" 
								data-bs-toggle="dropdown" aria-expanded="true">
									<c:if test="${!empty cat_name}">
										${cat_name}
									</c:if>
									<c:if test="${empty cat_name}">
										전체
									</c:if>
								</button>

								<ul class="dropdown-menu" id="auth-dd" style="background-color: #FFFAE5">
									<li><a class="dropdown-item auth-dd" id="auth_pic" data-auth="1">사진
											인증</a></li>
									<li><a class="dropdown-item auth-dd" id="auth_time" data-auth="2">시간
											인증</a></li>
									<li><a class="dropdown-item auth-dd" id="auth_quote" data-auth="3">문구
											인증</a></li>
									<li><a class="dropdown-item auth-dd" id="auth_qr" data-auth="4">QR코드
											인증</a></li>
									<li><a class="dropdown-item auth-dd" id="auth_game" data-auth="5">게임
											인증</a></li>
									<li><a class="dropdown-item auth-dd" id="auth_report"
										data-auth="6">가계부 인증</a></li>
								</ul>
								<input type="hidden" id="ah_num" name="ah_num">
							</div>
						</div>

						<textarea  class="ta2" id="auth_desc" name="auth_desc" placeholder="인증 방식의 구체적인 정보를 입력해주세요" maxlength="500"></textarea>
					</div>
				</div>
			</div>
			<p class="warning auth-warn">인증방식이 선택되지 않았습니다!</p>
			<div class="chc-six">
				<div class="auth-info shadow-effect" id="time_auth">
					<div class="authInfo-title">시간 인증</div>
					<label>인증 시작시간</label> <input type="number" name="auth2_startTime" class="extra-input" id="auth2_startTime" placeholder="클릭 후 입력">
				</div>
				<div class="auth-info shadow-effect" id="game_auth">
					<div class="authInfo-title">게임 인증</div>
					<div class="game-list">
						<div class="game-item" id="game1">
							<img width="80px" height="80px">
							<div class="game-name">연산게임</div>
						</div>
						<div class="game-item" id="game2">
							<img width="80px" height="80px">
							<div class="game-name">수학 문제</div>
						</div>
						
					</div>
					<input type="hidden" name="game" id="game">	
				</div>
				
				<div class="extra-info shadow-effect">
					<ul>
						<li><label>최소인원</label> <input type="number" name="min" class="extra-input min-people" id="min" placeholder="1 ~ 10명 입력" min="1" max="10" required><span class="warning member-warn">최소 인원이 최대인원보다 크지 않게 입력해주세요</span></li>
						<li><label>최대인원</label> <input type="number" name="max" class="extra-input max-people" id="max" placeholder="1 ~ 999명 입력" min="1" max="999" required></li>
						<li><label>고정 예치금</label> <input type="number" class="extra-input" id="chc_price" name="chc_price" placeholder="최소 금액 1000원" min="1000" required></li>
						<li><label>챌린지 기간</label><b> 시작: </b><input type="date" class="input-date" id="chc_start" name="start" placeholder="시작 날짜 (YY-MM-DD)" min="">    <b>종료: </b><input type="date" class="input-date" id="chc_end" name="end" placeholder="종료 날짜 (YY-MM-DD)" required></li>
						<li class="warning duration-warn">시작 날짜가 종료 날짜보다 빨라야합니다</li>
						<li id="join_code"><label>참여 코드</label><input style="color:blue" id="join_code_input" name="join_code" value="${join_code}"></li>
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
					</ul>
				</div>
			</div>



			<div class="chc-end align-center">
				<input class="submit-btn background-main" type="submit" value="개설하기">
			</div>
		</form>
		<!-- =====================form 끝 ============================ -->
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>