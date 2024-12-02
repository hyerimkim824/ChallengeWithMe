<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/header.js"></script>

<div id="header">	
	<a href="${pageContext.request.contextPath}/main/main.do"><img src="${pageContext.request.contextPath}/images/logo.png" class="nav-logo left"></a>
	
	<!-- 유저 계정으로 로그인된 경우 -->
	<c:if test="${!empty us_num && admin == 0}">
		<div class="nav-a">
			<a href="${pageContext.request.contextPath}/main/main.do">홈</a>
			<a href="${pageContext.request.contextPath}/challenge/challengeMain.do">챌린지</a>
			<a href="${pageContext.request.contextPath}/post/list.do">커뮤니티</a>
			<a href="${pageContext.request.contextPath}/mychallenge/myChallengeMain.do">마이챌린지</a>
		</div>
		
		<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="profile_img">
	</c:if>
	
	<!-- 관리자 계정으로 로그인된 경우 -->
	<c:if test="${!empty us_num  && admin == 9}">
		<div class="right">
			<a href="${pageContext.request.contextPath}/main/main.do">홈</a>
			<a href="${pageContext.request.contextPath}/challenge/challengeMain.do">챌린지</a>
			<a href="${pageContext.request.contextPath}/post/list.do">커뮤니티</a>
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
	
	<div class="myBrief profileOn-background">
		<div class="brief-box">
				<div class="brief-box-info" style="font-size: 13px;">
					<div class="brief-box1">
						<p class="brief-box-img"><img src="../images/face.png"></p>
						<input type="button"  value="프로필 수정" onclick="location.href='${pageContext.request.contextPath}/support/FeedBack.do'">
					</div>
				
					<div class="brief-box2">	
						<p class="brief-box-nickname">님</p><br>
						<p class="brief-box-text" >오늘도 멋진 도전을 응원합니다!💪</p>
					</div>
				</div>
				<div class="brief-box3">
					<ul class="brief-box-menu" style="font-size: 13px;">
						<li><a href="location.href='${pageContext.request.contextPath}/support/FeedBack.do'">개설한 챌린지</a></li>
						<li><a href="location.href='${pageContext.request.contextPath}/support/FeedBack.do'">잔고 잔액</a></li>
						<li><a href="location.href='${pageContext.request.contextPath}/support/FeedBack.do'">사용가이드</a></li>
						<li><a href="location.href='${pageContext.request.contextPath}/support/FeedBack.do'">고객의 소리</a></li>
					</ul>
				</div>	
			
			</div>
		<div class="brief-rogout">로그아웃
		</div>
	</div>
</div>

<!-- header 끝 -->



