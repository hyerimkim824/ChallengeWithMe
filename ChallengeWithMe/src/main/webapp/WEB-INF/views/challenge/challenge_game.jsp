<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/game.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/game.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">
		
		<div class="auth-title align-center">챌린지 게임 인증</div>
		<hr>
		<div class="game-selection">
			<div class="selection-title align-center">게임 선택</div>
			<div class="gameBtn-container align-center">
				<div class="gameItem align-center" id="game1">화살 피하기</div>
				<div class="gameItem align-center" id="game2">연산 게임</div>
			</div>
		</div>
		<div class="game-guideline">
			<p>
				<b>화살 피하기</b>
			<p>
			<div>방향키(왼쪽, 오른쪽)을 이용하여 화살을 피하세요! 30점을 넘으면 챌린지 인증이 가능합니다!</div>
			<p>
				<b>연산 게임</b>
			
			<p>
			<div>랜덤으로 생성된 정수들로 이루어진 간단한 수학 문제 풀기! 연산 문제를 해결하고 챌린지 인증을
				성공하세요!</div>
		</div>
		<hr>
		<div class="empty-space100"></div>
		<div class="game-board">
			<c:if test="${game_num == 1}">
				<div class="game-name align-center">화살 피하기</div>
			</c:if>
			<c:if test="${game_num == 2}">
				<div class="game-name align-center">연산 게임</div>
			</c:if>
			<c:if test="${game_num != 1 && game_num != 2}">
				<div class="game-name align-center">게임 선택</div>
			</c:if>
			<div class="leftgb shadow-effect">
				<div class="left-deco1">
					<div class="joystick shadow-effect"></div>
				</div>
				<div class="left-deco2">
					<div class="joystick shadow-effect">
						<div class="top">
							<div class="arrows up shadow-effect"></div>
						</div>
						<div class="left-right">
							<div class="arrows left shadow-effect"></div>
							<div class="arrows right shadow-effect"></div>
						</div>
						<div class="bottom">
							<div class="arrows down shadow-effect"></div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="maingb shadow-effect">
				<div class="main-board">
					 <c:if test="${game_num == 1}">
					 	<div id="game-area">
					 		<div id="ground"></div>
					 	</div>
    					<div id="score">Score: 0</div>
   					 	<div id="start-btn">게임 시작</div>
   					 	<div id="alert-div" class="hidden"></div>
					 </c:if>
					 <c:if test="${game_num == 2}">
						<div id="game-area2">
							<div class="area2-guide">정수만 입력해주세요</div>
							<div class="empty-space100"></div>
							<c:forEach var="i" begin="0" end="4">
								<div class="area2-item"><label>${i+1}번.</label><span>${num1[i]}</span><span>${opt[i]}</span><span>${num2[i]}</span><input type="number" class="asw-input" id="asw${i+1}"></div>
								<input type="hidden" id="answer${i+1}" value="${answer[i]}">
							</c:forEach>
						</div>
					</c:if>
					 <c:if test="${game_num != 1 && game_num != 2}">
					 	<div class="no-game align-center">게임을 선택해 주세요!</div>
					 </c:if>
				</div>
			</div>
			<div class="rightgb shadow-effect">
				
				<div class="right-deco1 shadow-effect">
					<div class="right-btn">
						<div class="rbtn">1</div>
						<div class="rbtn">2</div>
						<div class="rbtn">3</div>
					</div>
					<div class="right-btn">
						<div class="rbtn">4</div>
						<div class="rbtn">5</div>
						<div class="rbtn">6</div>
					</div>
				</div>
				<div class="left-deco2">
					<div class="right-joystick shadow-effect">
						<div class="r1">
							<div class="round btn1 shadow-effect">A</div>
						</div>
						<div class="r2">
							<div class="round btn2 shadow-effect">B</div>
							<div class="round btn3 shadow-effect">C</div>
						</div>
						<div class="r3">
							<div class="round btn4 shadow-effect">D</div>
						</div>
						
					</div>
				</div>
				<div class="submit-answer">
					<c:if test="${game_num==1}">
						<div class="submit-btn align-center">인증</div>
					</c:if>
					<c:if test="${game_num==2}">
						<div class="submit-btn2 align-center">인증</div>
					</c:if>
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>