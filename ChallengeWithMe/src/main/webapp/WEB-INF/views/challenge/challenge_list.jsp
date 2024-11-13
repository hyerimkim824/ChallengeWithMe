<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 챌린지 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sw.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">


		<div class="cat-list">
			<div class="cat-btn" id="cat_btn">Hi</div>
			<form id="cat_form">
				<div class="item-list" id="item_list">
					<div class="cat-item" id="cat_item">1</div>
					<div class="cat-item" id="cat_item">2</div>
					<div class="cat-item" id="cat_item">3</div>
					<div class="cat-item" id="cat_item">4</div>
					
				</div>
			</form>
		</div>
		<div class="ch-container">
			<c:if test="${!empty chall_list}">
				<c:forEach var="list" items="${chall_list}">
					<div class="ch-item">
						<p>${list.ch_title}</p>

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