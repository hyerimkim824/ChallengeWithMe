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
<script src="${pageContext.request.contextPath}/js/challenge.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">

		<div class="space100-div"></div>
		<div class="ch-top-container">
			<div class="dropdown">
				<button class="btn dropdown-toggle" type="button" id="list_cat"
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
					<li><a class="dropdown-item list-dd" id="cat_all"
						data-category="0" href="challengeList.do">전체</a></li>
					<li><a class="dropdown-item list-dd" id="cat_health"
						data-category="1" href="challengeList.do?category=1">건강</a></li>
					<li><a class="dropdown-item list-dd" id="cat_food"
						data-category="2" href="challengeList.do?category=2">식습관</a></li>
					<li><a class="dropdown-item list-dd" id="cat_develop"
						data-category="3" href="challengeList.do?category=3">자기계발</a></li>

				</ul>
			</div>
			<button class="btn ch-create" style="background-color: #FFE066"
				onclick="location.href='challengeCreateForm.do'" type="button">
				<p>챌린지 개설</p>
			</button>
		</div>
		<div class="ch-container">
			<c:if test="${!empty chall_list}">
				<c:forEach var="list" items="${chall_list}">

					<div class="ch-item">

						<div class="item-header">
							<div class="ch-category">${list.cate_name}</div>
							<c:if test="${list.heart_status}">
								<div class="item-heart" data-chnum="${list.ch_num}">
									<img src="${pageContext.request.contextPath}/images/red-heart.png" width="15px" height="15px">
								</div>
							</c:if>
							<c:if test="${!list.heart_status}">
								<div class="item-heart" data-chnum="${list.ch_num}"><img src="${pageContext.request.contextPath}/images/heart.png" width="15px" height="15px">
								</div>
							</c:if>
						</div>
						<a
							href="${pageContext.request.contextPath}/challenge/challengeDetail.do?ch_num=${list.ch_num}">
							<div class="ch-background">
								<c:if test="${empty list.ch_img}">
									<c:choose>
										<c:when test="${list.cate_num == 1}">
											<img class="ch-bgImg" src="../images/health.jpg"
												style="max-width: 100%; max-height: 100%;" />
										</c:when>
										<c:when test="${list.cate_num == 2}">
											<img class="ch-bgImg" src="../images/food.jpg"
												style="max-width: 100%; max-height: 100%;" />
										</c:when>
										<c:when test="${list.cate_num == 3}">
											<img class="ch-bgImg" src="../images/self-develop.jpg"
												style="max-width: 100%; max-height: 100%;" />
										</c:when>
										<c:otherwise>
											<img class="ch-bgImg" src="../images/face.jpg"
												style="max-width: 100%; max-height: 100%;" />
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${!empty list.ch_img}">
									<img class="ch-bgImg"
										src="${pageContext.request.contextPath}/upload/${list.ch_img}"
										style="max-width: 100%; max-height: 100%;">
								</c:if>
								<p class="ch-title">${list.ch_title}</p>
								<div class="ch-dueDate">D-${list.dateDifference}</div>
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
						</a>
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