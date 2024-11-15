<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 챌린지 목록</title>
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


</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">

		<div class="space100-div"></div>
		<div class="ch-top-container">
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
					<li><a class="dropdown-item" id="cat_all" data-catagory="0"
						href="challengeList.do?category=0">전체</a></li>
					<li><a class="dropdown-item" id="cat_health" data-catagory="1"
						href="challengeList.do?category=1">건강</a></li>
					<li><a class="dropdown-item" id="cat_food" data-catagory="2"
						href="challengeList.do?category=2">식습관</a></li>
					<li><a class="dropdown-item" id="cat_develop"
						data-catagory="3" href="challengeList.do?category=3">자기계발</a></li>

				</ul>
			</div>
			<button class="btn ch-create" style="background-color: #FFE066" 
				onclick="location.href='challengeCreateForm.do'" type="button"><p>챌린지 개설</p></button>
		</div>
		<div class="ch-container">
			<c:if test="${!empty chall_list}">
				<c:forEach var="list" items="${chall_list}">
					<div class="ch-item">
						<div class="ch-category">${list.cate_name}</div>
						<div class="ch-background">
							<img class="ch-bgImg"
								src="${pageContext.request.contextPath}/images/study.jpg">
							<p class="ch-title">${list.ch_title}</p>
							<div class="ch-dueDate">D-10</div>

						</div>


						<div class="ch-info">
							<div class="ch-people">
								<img class="people-img"
									src="${pageContext.request.contextPath}/images/person.svg">
								<p>${list.ch_person}/${list.ch_max}</p>
							</div>
							<div class="ch-like">
								<img class="like-img"
									src="${pageContext.request.contextPath}/images/chat-square-heart.svg">
								<p>${list.ch_like}</p>
							</div>
							<div class="ch-view">
								<img class="view-img"
									src="${pageContext.request.contextPath}/images/eye.svg">
								<p>${list.ch_view}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty chall_list}">
				표시할 챌린지가 없습니다.
			</c:if>

		</div>

	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>