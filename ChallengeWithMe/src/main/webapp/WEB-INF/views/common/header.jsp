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
		<c:choose>
      	  <c:when test="${!empty us_img}">
            <img src="${pageContext.request.contextPath}/upload/${us_img}" 
                 width="30" height="30" style="border-radius: 50%;" class="profile_img">
      	  </c:when>
       	  <c:otherwise>
            <img src="${pageContext.request.contextPath}/images/face.png" 
                 width="30" height="30" 
                 style="border-radius: 50%;"  class="profile_img">
     	  </c:otherwise>
   		  </c:choose>
	
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
					<div class="brief-box1 align-center">
						<p class="brief-box-img">
						<c:if test="${!empty us_img}"><img src="${pageContext.request.contextPath}/upload/${us_img}"
								width="30" height="30"></c:if>
						<c:if test="${empty us_img}"><img src="${pageContext.request.contextPath}/images/face.png"></c:if>
						<input type="button" value="마이 페이지" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage.do'">
					</div>
				
					<div class="brief-box2">	
						<c:if test="${ !empty xuser.nickname }">
						<p class="brief-box-nic-text" style="font-size: 14px"><b>${xuser.nickname}님</b> 
						오늘도 힘찬 도전을 응원합니다!💪</p>
						</c:if>
						<c:if test="${ empty xuser.nickname }">
						<p class="brief-box-nic-text" style="font-size: 14px"><b>${ us_nickname }님</b> 
						오늘도 힘찬 도전을 응원합니다!💪</p>
						</c:if>
					</div>
				</div>
				<div class="brief-box3">
					<div class="a-div"><a href="${pageContext.request.contextPath}/mychallenge/myChallengeMake.do">개설 챌린지</a></div>
					<div class="a-div"><a href="${pageContext.request.contextPath}/charge/deposit.do">금액 충전</a></div>
					<div class="a-div"><a href="${pageContext.request.contextPath}/support/CommunityHelp.do">사용가이드</a></div>
					<div class="a-div"><a href="${pageContext.request.contextPath}/support/FeedBack.do">고객의소리</a></div>
				</div>	
			
			</div>
		<div class="brief-rogout"><a href="${pageContext.request.contextPath}/xuser/logout.do">로그아웃</a>
		</div>
	</div>
</div>

<!-- header 끝 -->



