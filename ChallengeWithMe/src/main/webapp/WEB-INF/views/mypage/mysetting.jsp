<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인설정</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/mysetting.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="ground">
		<div class="box">
			<div class='box-header'>
				<ul>
					<li class="box-h1">
						<h1>개인 설정</h1>
					</li>
					<li>
						<input type="button" value="마이페이지"
						onclick="location.href='${ pageContext.request.contextPath }/mypage/mypage.do'">
					</li>
				</ul>
				<hr>
			</div>
			<div class="box-middle">
				<ul>
					<li>
						<img src="${ pageContext.request.contextPath }/images/fav01.gif" width="25px" height="25px">
						<span>알림 설정</span>
						<input type="button" value="ON" id="on">
						<input type="button" value="OFF" id="off">
					</li>
					<li>
						<img src="${ pageContext.request.contextPath }/images/fav01.gif" width="25px" height="25px">
						<span>친구 초대</span>
						<input id="left" type="image" src="${ pageContext.request.contextPath }/images/fav01.gif" width="30px" height="30px">
						<input id="right" type="image" src="${ pageContext.request.contextPath }/images/fav01.gif" width="30px" height="30px">
					</li>
					<li>
						<img src="${ pageContext.request.contextPath }/images/fav01.gif" width="25px" height="25px">
						<span>좋아요 목록</span>
					</li>
						<hr>
					<c:forEach var="chall" items="${ like }">
					<li class="li-fev"><span>${ chall }</span></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>