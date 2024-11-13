<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
<div id="footer">	
	<div class="ft-nav">
		<img src="${pageContext.request.contextPath}/images/logo.png" width="25" height="25" class="nav-logo left">
		<a>ⓒ챌린지 윗미</a>
		<!-- 관리자 계정으로 로그인된 경우 -->
	<c:if test="${!empty us_num && admin == 9}">
		<a>관리페이지</a>
		<a>공개챌린지</a>
		<a href="${pageContext.request.contextPath}/xuser/logout.do">로그아웃</a>
	</c:if>
		<!-- 유저 계정으로 로그인된 경우 -->
	<c:if test="${!empty us_num}">
		<a href="${pageContext.request.contextPath}/support/supportWrite.do">1:1 문의</a>
		<a  href="${pageContext.request.contextPath}/mypage/mypage.do">마이페이지</a>
		[<span>${ us_id }</span>]
		<a href="${pageContext.request.contextPath}/xuser/logout.do">로그아웃</a>
	</c:if>
	<!-- 로그인되지 않은 경우 -->
	<c:if test="${empty us_num}">
		<div>
			<a href="${pageContext.request.contextPath}/xuser/loginForm.do">로그인</a>
			<a href="${pageContext.request.contextPath}/xuser/registerXuserForm.do">회원가입</a>
		</div>
	</c:if>
		<img class="right bird-img" src="${pageContext.request.contextPath}/images/bird.png" width="25" height="25">
	</div>
	
</div>
<!-- header 끝 -->



