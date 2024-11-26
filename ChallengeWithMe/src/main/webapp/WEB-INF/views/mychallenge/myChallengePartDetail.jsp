<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이첼린지 메인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/header.css" type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/khr.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
	
<head>
<meta charset="UTF-8">
<title>참여 챌린지</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<h1>개설 챌린지</h1>

<div class ="page-main">
	<div class="mychallenge-content-detail">
			<div class="mychallenge-div">
				<h4>프로필 사진</h4>
				<ul>
					<li>
						<c:if test="${empty xuser.photo}">
								<img src="${pageContext.request.contextPath}/images/face.png"
									width="150" height="150" class="my-photo">
							</c:if> 
							<c:if test="${!empty xuser.photo}">
								<img
									src="${pageContext.request.contextPath}/upload/${xuser.photo}"
									width="150" height="150" class="my-photo">
							</c:if>
						</li>
				</ul>
			</div>
			
			<div>
			
			<input type="button" value="챌린지 인증" id="proved_button"
				onclick="location.href='${pageContext.request.contextPath}/pvchallenge/pvChallengePhoto.do'">
			
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>