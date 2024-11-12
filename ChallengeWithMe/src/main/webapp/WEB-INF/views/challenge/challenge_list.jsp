<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 챌린지 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sw.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">
		

		<div class="cat-list">
			<div class="cat-btn" id="cat-btn"></div>
			<div class="cat-item" id="cat-item"></div>
		</div>
		<div class="ch-container">
			<div id="ch-item"></div>
		</div>
	
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>