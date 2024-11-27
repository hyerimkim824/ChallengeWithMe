<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sw.css" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/challenge.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">
		<div class="space100-div"></div>
		<div class="ch-top-container">
			<button class="btn ch-create" style="background-color: #FFE066"
				onclick="location.href='challengeCreateForm.do'" type="button">
				<p>챌린지 개설</p>
			</button>
		</div>
		<div class="space200-div">
			<div class="search-container align-center">
				<form id="search_form" action="challengeList.do" method="get">
					<input type="radio" value="1" name="keyfield">제목 <input
						type="radio" value="2" name="keyfield">닉네임 <input
						type="text" name="keyword"> <input type="hidden"
						name="category" value="${category}"> <input type="submit"
						value="전송">
				</form>
			</div>
		</div>
		<div class="official-status-container">
			<button class="official-status-btn user-ch" type="button"
				onclick="location.href='challengeList.do'">사용자 챌린지</button>
			<button class="official-status-btn admin-ch">공식 챌린지</button>
		</div>
		<div class="space100-div"></div>
		<div class="och-container">
			<div class="och-item shadow-effect"></div>
			<div class="och-item shadow-effect"></div>
			<div class="och-item shadow-effect"></div>
			<div class="och-item shadow-effect"></div>
			<div class="och-item shadow-effect"></div>
		</div>
		<div class="space100-div"></div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>