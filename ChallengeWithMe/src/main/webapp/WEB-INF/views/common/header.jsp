<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css">
<div id="header">	
	<img src="${pageContext.request.contextPath}/images/logo.png" width="25" height="25" class="nav-logo left">
	
	<!-- 유저 계정으로 로그인된 경우 -->
	<c:if test="${!empty us_num && admin == 0}">
		<div class="nav-a">
			<a href="${pageContext.request.contextPath}/main/main.do">홈</a>
			<a href="${pageContext.request.contextPath}/challenge/challengeMain.do">챌린지</a>
			<a href="${pageContext.request.contextPath}/post/list.do">커뮤니티</a>
			<a>마이챌린지</a>
		</div>
		<div class="nav-btn">
			<img src="${pageContext.request.contextPath}/images/magnifier.png" class="img-btn">
			<img src="${pageContext.request.contextPath}/images/heart.png" class="img-btn">
			<img src="${pageContext.request.contextPath}/images/alarm.png" class="img-btn">
		</div>
		<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="profile_img">
	</c:if>
	
	<!-- 관리자 계정으로 로그인된 경우 -->
	<c:if test="${!empty us_num  && admin == 9}">
		<div class="right">
			<a href="${pageContext.request.contextPath}/member/adminList.do">관리페이지</a>
			<a>공개챌린지</a>
		</div>
		
		<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="profile_img">
	</c:if>
	
	<!-- 로그인되지 않은 경우 -->
	<c:if test="${empty us_num}">
		<div class="right">
			<a href="${pageContext.request.contextPath}/xuser/registerXuserForm.do">로그인</a>
			<a href="${pageContext.request.contextPath}/xuser/registerXuserForm.do">회원가입</a>
		</div>
	</c:if>
	
</div>
<!-- header 끝 -->



