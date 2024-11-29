<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선호 카테고리 선택</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/pref.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-wrapper">
		<div class="content-head">
			<h1>선호 카테고리 선택</h1>
			<h3>선호 카테고리를 선택해주세요! (최대 6개)</h3>
		</div>
		<div class="content-result">
			<ul>
				<c:forEach var="pref" items="${ list }">
				<li>
					<img src="${ pageContext.request.contextPath }/upload/${ pref.cate_img }">
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>