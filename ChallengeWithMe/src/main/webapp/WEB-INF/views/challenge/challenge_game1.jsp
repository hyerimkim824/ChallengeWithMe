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
		<div class="empty-space100"></div>
		<div class="challenge-title">
			<div class="title-blank">
				<div class="blank-deco"></div>
			</div>
			<div class="title">챌린지 인증 게임</div>
			<div class="title-blank">
				<div class="blank-deco"></div>
			</div>
		</div>
		<div class="empty-space100"></div>
		<div class="game-area">
			<div class="game-name align-center">
			<div class="name-deco align-center">연산 게임</div>
			</div>
			<div class="game-contents">
				<form id="game_form">
					<div class="guideline">Q.연산 문제를 해결하세요</div>
					<div class="content-box">
						<div class="question-box">
							<ul>
								<li><label class="item-label">7 x 19 = ?</label><input type="text"></li>
								<li><label class="item-label">13 x (3 + 9) - 10 = ?</label><input type="text"></li>
								<li><label class="item-label">27 - 8 x 3 = ?</label><input type="text"></li>
								<li><label class="item-label">64 % (7 - 3) = ?</label><input type="text"></li>
							</ul>
						</div>
					</div>
					<input class="submit-btn" type="submit" value="해결!">
				</form>
			
			</div>
		</div>
		<div class="empty-space100"></div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>