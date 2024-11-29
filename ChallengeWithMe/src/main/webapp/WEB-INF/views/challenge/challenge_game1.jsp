<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/game.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">
		
		<div class="auth-title align-center">챌린지 게임 인증</div>
		<hr>
		
		<div class="game-board">
			<div class="game-name align-center">연산 게임</div>
			<div class="leftgb shadow-effect">
				<div class="left-deco1">
					<div class="joystick shadow-effect"></div>
				</div>
				<div class="left-deco2">
					<div class="joystick shadow-effect">
						<div class="top">
							<div class="arrow up shadow-effect"></div>
						</div>
						<div class="left-right">
							<div class="arrow left shadow-effect"></div>
							<div class="arrow right shadow-effect"></div>
						</div>
						<div class="bottom">
							<div class="arrow down shadow-effect"></div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="maingb shadow-effect">
				<div class="main-board"></div>
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
					<div class="submit-btn align-center">확인</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>