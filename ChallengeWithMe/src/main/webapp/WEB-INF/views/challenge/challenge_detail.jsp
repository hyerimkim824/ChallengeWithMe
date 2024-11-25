<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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


		<div class="chc-one">
			<div class="chc-title"><b>챌린지 정보</b></div>
			<div class="chc-visi">
				<c:if test="${chall.ch_visi == 0}">
					<img id="visi_img"
						src="${pageContext.request.contextPath}/images/unlock.svg">
					<div id="visi_text">공개</div>
				</c:if>
				<c:if test="${chall.ch_visi == 1}">
					<img id="visi_img"
						src="${pageContext.request.contextPath}/images/lock.svg">
					<div id="visi_text">비공개</div>
				</c:if>
			</div>
			<a href="${pageContext.request.contextPath}/challenge/challengeList.do"><div class="linkToList align-center">목록으로</div></a>
		</div>
		<div class="chc-three">
			<div class="chd-catname align-center">${chall.cate_name}</div>
			<div class="chd-auth">
				#
				<c:out value="${auth_name[chall.ahDetail_num]}" />
			</div>
		</div>

		<div class="chc-four">
			<div class="chd-title">참가 챌린지 명: ${chall.ch_title}</div>
			<div class="nickname-container">
				<c:if test="${us_img == null}">
					<img class="user-img"
						src="${pageContext.request.contextPath}/images/face.png">
				</c:if>
				<c:if test="${us_img != null}">
					<img class="user-img"
						src="${pageContext.request.contextPath}/images/${us_img}">
				</c:if>
				<p class="user-nickname">${us_nickname}</p>
			</div>
		</div>
		<div class="chd-info-container shadow-effect">
			<div class="chd-five">
				<div class="img-container">
					<img class="chd-img" src="../images/food.jpg">
				</div>
				<div class="chc-info">
					<div class="chc-desc shadow-effect">
						<div class="info-title">챌린지 소개</div>
						<textarea id="chc_desc" class="ta1" placeholder="소개 글을 입력해주세요"
							maxlength="900" disabled>${chall.ch_desc}</textarea>
					</div>
					<div class="chc-authm shadow-effect">
						<div class="info-title">인증방법</div>
						<textarea class="ta1" maxlength="500" disabled>${chall.auth_desc}</textarea>
					</div>
				</div>
			</div>
			<div class="chd-six">
				<div class="chd-extra-info shadow-effect">
					<ul>
						<li><label>참가현황</label>${chall.ch_person}명&nbsp;&nbsp;/&nbsp;&nbsp;${chall.ch_max}명</li>
						<li><label>고정 예치금</label>${chall.trans_bal}원</li>
						<li><label>기간</label>${chall.ch_start} ~ ${chall.ch_end}</li>

					</ul>
				</div>
			</div>
		</div>
		<div class="chc-six">
			<div class="auth-method shadow-effect">
				<div class="method-title align-center shadow-effect">인증방법</div>
				<br>
				<br>
				<ul>
					<li><label>사진 인증</label>
					<div class="info-detail shadow-effect">사진 올리기(일정 시간 내에 사진을
							올리고 인증)</div></li>
					<li><label>시간 인증</label>
					<div class="info-detail shadow-effect">시간 설정 버튼(온클릭 방식으로 눌러서
							시작과 끝을 CHECK)</div></li>
					<li><label>문구 인증</label>
					<div class="info-detail shadow-effect">문구따라쓰기(기상 미션 중 하나로 명언
							따라쓰기)</div></li>
					<li><label>QR코드 인증</label>
					<div class="info-detail shadow-effect">QR코드 : 일정 시간 내에 QR코드를
							통해 인증</div></li>
					<li><label>게임 인증</label>
					<div class="info-detail shadow-effect">간단한 아침 기상용게임(e.g 구구단
							문제 등)</div></li>
					<li><label>가계부 인증</label>
					<div class="info-detail shadow-effect">간단한 가계부 작성(e.g
							소비,저축,지출)</div></li>
					<li><label>줌 인증</label>
					<div class="info-detail shadow-effect">줌 링크 공유를 통한 챌린지 인증</div></li>
				</ul>
			</div>
		</div>



		<div class="chc-end align-center">
			<input class="submit-btn" type="submit" value="참가하기">
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>