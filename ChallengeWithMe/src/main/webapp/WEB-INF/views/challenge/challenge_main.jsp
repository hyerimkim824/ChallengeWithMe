<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 챌린지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sw.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">

		<div class="challenge_title">
			<p>당신의 도전을 환영합니다</p>
		</div>
		<div id="ch_container">
			<div class="ch-menu">
				<img class="ch-img"
					src="${pageContext.request.contextPath}/images/face.png">
				<p><a href="${pageContext.request.contextPath}/challenge/challengeList.do">챌린지 참여</a></p>
			</div>
			<div class="ch-menu">
				<img class="ch-img"
					src="${pageContext.request.contextPath}/images/face.png">
				<p>챌린지 개설</p>
			</div>
			<div class="ch-menu">
				<img class="ch-img"
					src="${pageContext.request.contextPath}/images/face.png">
				<p>공식 챌린지 참여</p>
			</div>

		</div>
		<div class="space-div"></div>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>