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
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
	<div class="box">
		<div class="box-h1">
		<h1>꼬박꼬박 뱃지 리스트</h1>
		<div class="info-rightbtn">
		<input type="button" value="마이페이지"
		onclick="location.href='${ pageContext.request.contextPath }/mypage/mypage.do'">
		<c:if test="${!empty xuser.us_num && xuser.admin >= 1}">
		<input type="button" value="뱃지등록"
		onclick="location.href='${ pageContext.request.contextPath }/mypage/adminbadgeform.do'">
		</c:if>
		</div>
		</div>
		<div class="badge-box">
			<ul>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
			</ul>
			<ul>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
			</ul>
			<ul>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
			</ul>
			<ul>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
				<li>
					<img src="${ pageContext.request.contextPath }/images/fav01.gif">
					<span><b>대충뱃지이름</b></span>
				</li>
			</ul>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>