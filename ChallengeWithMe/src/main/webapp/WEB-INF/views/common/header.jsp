<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header 시작 -->
<div id="main_nav">
	
	<img src="${pageContext.request.contextPath}/images/logo.png" width="25" height="25" class="nav-logo left">
	
	<!-- 유저 계정으로 로그인된 경우 -->
	<c:if test="${!empty us_num && admin == 0}">
		<div class="nav-a">
			<a>홈</a>
			<a>챌린지</a>
			<a>커뮤니티</a>
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
			<a>관리페이지</a>
			<a>공개챌린지</a>
		</div>
		
		<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="profile_img">
	</c:if>
	
	<!-- 로그인되지 않은 경우 -->
	<c:if test="${empty us_num}">
		<div class="right">
			<a>로그인</a>
			<a>회원가입</a>
		</div>
	</c:if>
</div>
<!-- header 끝 -->



