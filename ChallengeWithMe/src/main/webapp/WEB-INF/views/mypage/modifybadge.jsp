<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 뱃지 리스트</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/mybadgelist.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<title>뱃지 수정</title>
</head>
<body>
	<div class="box">
		<div class="info-rightbtn">
		<input type="button" value="마이페이지"
		onclick="location.href='${ pageContext.request.contextPath }/mypage/mypage.do'">
		</div>
		<div class="badge-box">
			<ul class="flex-wrap-list">
				<c:forEach var="badge" items="${ list }">
				<li>
				<form method="post" action="${ pageContext.request.contextPath }/mypage/modifybadgedetailform.do" class="badge-form">
					<input type="hidden" name="bg_num" id="bg_num" value="${ badge.bg_num }">
					<img src="${ pageContext.request.contextPath }/upload/${ badge.bg_img }"
					class="badge-img" alt="${ badge.bg_name }"
					onclick="this.closest('form').submit()">
					<span><b>${ badge.bg_name }</b></span>
					<span><b>${ badge.bg_desc }</b></span>
				</form>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>