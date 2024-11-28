<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="official-status-container">
				<button class="official-status-btn user-ch" type="button"
					onclick="location.href='challengeList.do'">사용자 챌린지</button>
				<button class="official-status-btn admin-ch">공식 챌린지</button>
			</div>
			<button class="btn ch-create" style="background-color: #FFE066"
				onclick="location.href='challengeCreateForm.do'" type="button">
				챌린지 개설
			</button>
		</div>
		<div class="space50-div"></div>
		<form id="search_form" class="search-container shadow-effect"
			action="challengeOfficialList.do" method="get">

			<select class="search-select" name="keyfield">
				<option value="0">전체</option>
				<option value="1">제목</option>
			</select> <input type="text" class="search-field" name="keyword">
			<img class="search-submitBtn" src="../images/magnifier.png">
			<input type="submit" id="submit_form" class="submit-form" value="검색">
		</form>
		<div class="space50-div"></div>

		<div class="space100-div"></div>
		<div class="och-container">
			<c:if test="${count > 0}">
				<c:forEach var="list" items="${chall}">
					<div class="och-item shadow-effect">
						<div class="link-div"
							onclick="location.href='${pageContext.request.contextPath}/challenge/challengeDetail.do?ch_num=${list.ch_num}'"></div>
						<div class="och-detail">
							<div class="och-detailItem">
								<img src="../images/chat-square-heart.svg">
								${list.ch_like}
							</div>
							<div class="och-detailItem">
								<img src="../images/eye.svg"> ${list.ch_view}
							</div>
						</div>
						<c:if test="${pv_chall.heart_status}">
							<div class="item-heart" data-chnum="${list.ch_num}">
								<img
									src="${pageContext.request.contextPath}/images/red-heart.png"
									width="30px" height="30px">
							</div>
						</c:if>
						<c:if test="${!pv_chall.heart_status}">
							<div class="item-heart" data-chnum="${list.ch_num}">
								<img src="${pageContext.request.contextPath}/images/heart.png"
									width="30px" height="30px">
							</div>
						</c:if>
						<div class="och-title">${list.ch_title}</div>
						<div class="och-date">${list.ch_start}~${list.ch_end}</div>
						<img class="och-backgroundImg" src="../images/health.jpg">

					</div>
					<hr>
				</c:forEach>

			</c:if>
			<c:if test="${count==0}">
				<div class="align-center">진행 중인 공식 챌린지가 없습니다</div>
			</c:if>
		</div>
		<div class="space100-div"></div>
		<div class="page-div align-center">${page}</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>