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
	<div class="confirm-join">
		<c:if test="${!joined}">
			<c:if test="${us_bal >= chall.trans_bal}">
				<div class="confirm-box shadow-effect align-center">
					<div class="confirm-txt">예치금 ${chall.trans_bal}원이 차감됩니다.
						참가하시겠습니까?</div>
					<div class="current-bal">
						<label class="bal-label">현재 잔고</label> ${us_bal}원
					</div>
					<div class="left-bal">
						<label class="bal-label">예치 금액</label> ${chall.trans_bal}원
					</div>
					<div class="left-bal">
						<label class="bal-label">참가 후 잔액</label><span class="font-before"> ${us_bal - chall.trans_bal}원</span>
					</div>
					<div class="confirm-div">
						<button class="cbtn back-btn" id="cbtn_back">취소</button>
						<button class="cbtn confirm-btn background-main" id="cbtn_confirm"
							onclick="location.href='${pageContext.request.contextPath}/challenge/challengeJoin.do?ch_num=${chall.ch_num}&price=${chall.trans_bal}'">참가</button>
					</div>
				</div>
			</c:if>
			<c:if test="${us_bal < chall.trans_bal}">
				<div class="confirm-box shadow-effect align-center">
					<div class="confirm-txt">잔고 금액이 부족합니다</div>
					<div class="current-bal">
						<label class="bal-label">현재 잔고</label><span class="warning-text">
							${us_bal}원</span>
					</div>
					<div class="left-bal">
						<label class="bal-label">예치금</label> ${chall.trans_bal}원
					</div>
					<div class="confirm-div">
						<button class="cbtn back-btn" id="cbtn_back">돌아가기</button>
						<button class="cbtn confirm-btn background-main" id="cbtn_confirm" onclick="location.href='${pageContext.request.contextPath}/charge/deposit.do'">금액 충전</button>
					</div>
				</div>
			</c:if>
		</c:if>
		<c:if test="${joined}">
			<div class="confirm-box shadow-effect align-center">
					<div class="confirm-txt">정말 탈퇴하시겠습니까?</div> 
					
					<div class="confirm-div">
						<button class="cbtn back-btn" id="cbtn_back">취소</button>
						<button class="cbtn confirm-btn background-red" id="cbtn_confirm"
							onclick="location.href='${pageContext.request.contextPath}/challenge/challengeQuit.do?ch_num=${chall.ch_num}'">탈퇴</button>
					</div>
				</div>
		</c:if>
	</div>
	<div class="page-main">
	

		<div class="chd-one">
			<div class="chc-title"><b>챌린지 정보</b></div>
			<div class="chd-visi">
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
			
			<c:if test="${chall.official == 0}">
				<a href="${pageContext.request.contextPath}/challenge/challengeList.do"><div class="linkToList align-center">목록으로</div></a>
			</c:if>
			<c:if test="${chall.official == 1}">
				<a href="${pageContext.request.contextPath}/challenge/challengeOfficialList.do"><div class="linkToList align-center">목록으로</div></a>
			</c:if>
			<c:if test="${(chall.official == 0 && us_num == chall.us_num) || (chall.official == 1 && admin == 9)}">
				<a href="${pageContext.request.contextPath}/challenge/challengeModifyForm.do?ch_num=${chall.ch_num}"><div class="modify-btn align-center">챌린지 수정</div></a>
			</c:if>
		</div>
		<div class="chc-three">
			<div class="chd-catname align-center">${chall.cate_name}</div>
			<div class="chd-auth">
				#<c:out value="${auth_name[chall.ahDetail_num]}" />
			</div>
			<c:if test="${chall.ch_visi == 1}">
			<div class="chd-auth">
				#${chall.join_code}
			</div>
			</c:if>
		</div>

		<div class="chc-four">
			<div class="chd-four-header">
				<div class="chd-title">참가 챌린지 명: ${chall.ch_title}</div>
				<div class="like-container align-center">
					<c:if test="${chall.heart_status}">
						<img src="${pageContext.request.contextPath}/images/red-heart.png" width="30px" height="30px">
					</c:if>
					<c:if test="${!chall.heart_status}">
						<img src="${pageContext.request.contextPath}/images/heart.png" width="30px" height="30px">
					</c:if>
					
				</div>
			</div>
			<div class="nickname-container">
				<c:if test="${chall.us_img == null}">
					<img class="user-img"
						src="${pageContext.request.contextPath}/images/face.png">
				</c:if>
				<c:if test="${chall.us_img != null}">
					<img class="user-img"
						src="${pageContext.request.contextPath}/upload/${chall.us_img}">
				</c:if>
				<p class="user-nickname">${us_nickname}</p>
			</div>
		</div>
		<div class="chd-info-container shadow-effect">
			<div class="chd-five">
				<div class="img-container">
					<c:if test="${empty chall.ch_img || chall.ch_img == null}">
						<c:choose>
							<c:when test="${chall.cate_num == 1}">
								<img class="ch-bgImg" src="../images/health.jpg"
									style="max-width: 100%; max-height: 100%;" />
							</c:when>
							<c:when test="${chall.cate_num == 2}">
								<img class="ch-bgImg" src="../images/food.jpg"
									style="max-width: 100%; max-height: 100%;" />
							</c:when>
							<c:when test="${chall.cate_num == 3}">
								<img class="ch-bgImg" src="../images/self-develop.jpg"
									style="max-width: 100%; max-height: 100%;" />
							</c:when>
							<c:when test="${chall.cate_num == 4}">
								<img class="ch-bgImg" src="../images/wakeup.jpg"
									style="max-width: 100%; max-height: 100%;" />
							</c:when>
							<c:when test="${chall.cate_num == 5}">
								<img class="ch-bgImg" src="../images/economy.jpg"
									style="max-width: 100%; max-height: 100%;" />
							</c:when>
							<c:when test="${chall.cate_num == 6}">
								<img class="ch-bgImg" src="../images/stop.jpg"
									style="max-width: 100%; max-height: 100%;" />
							</c:when>
							<c:otherwise>
								<img class="ch-bgImg" src="../images/face.png"
									style="max-width: 100%; max-height: 100%;" />
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${!empty chall.ch_img}">
						<img class="ch-bgImg" style="max-width: 100%; max-height: 100%;" src="../upload/${chall.ch_img}">
					</c:if>
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
				<c:if test="${!joined}">
					<ul>
						<li><label>사진 인증</label><div class="info-detail shadow-effect">사진 올리기(일정 시간 내에 사진을
								올리고 인증)</div></li>
						<li><label>시간 인증</label>
							<div class="info-detail shadow-effect">시간 설정 버튼(온클릭 방식으로 눌러서 시작과 끝을 CHECK)</div></li>
						<li><label>문구 인증</label>
							<div class="info-detail shadow-effect">문구따라쓰기(기상 미션 중 하나로 명언 따라쓰기)</div></li>
						<li><label>QR코드 인증</label>
							<div class="info-detail shadow-effect">QR코드 : 일정 시간 내에 QR코드를 통해 인증</div></li>
						<li><label>게임 인증</label>
							<div class="info-detail shadow-effect">간단한 아침 기상용게임(e.g 구구단 문제 등)</div></li>
						<li><label>가계부 인증</label>
							<div class="info-detail shadow-effect">간단한 가계부 작성(e.g 소비,저축,지출)</div></li>
					</ul>
				</c:if>
				<c:if test="${joined}">
					<ul>
						<li><label>${this_auth_name}</label><div class="info-detail shadow-effect">${this_auth_detail}</div></li>
					</ul>
					<div class="align-center auth-inform">오늘의 열정을 인증해주세요</div>
					<div class="align-center auth-link">
						<a class="auth-btn align-center shadow-effect" href="${pageContext.request.contextPath}/mychallenge/myChallengePartDetail.do">인증하기</a>
					</div>
				</c:if>
			</div>
		</div>

		
		<c:if test="${!joined}">
			<div class="chc-end align-center">
				<a class="submit-btn background-main align-center" id="chd_submit" type="button">챌린지 참가</a>
			</div>
		</c:if>
		<c:if test="${joined}">
			<div class="chc-end align-center">
				<a class="submit-btn background-red align-center" id="chd_submit" type="button">챌린지 포기</a>
			</div>
		</c:if>
	
	</div>
		
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>