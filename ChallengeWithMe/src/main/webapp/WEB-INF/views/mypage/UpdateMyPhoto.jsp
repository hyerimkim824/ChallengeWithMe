<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 수정</title>
<style type="text/css">
	ul{
		list-style: none;
	}
</style>
</head>
<body>
	<div id="overlay">
		<div class="container">
			<h3>프로필 사진 수정</h3>
			<ul>
				<li>
					<c:if test="${empty xuser.img}">
					<img src="${pageContext.request.contextPath}/images/face.png" 
						                  width="200" height="200" class="my-photo">
					</c:if>
					<c:if test="${!empty xuser.img}">
					<img src="${pageContext.request.contextPath}/upload/${ xuser.img }" 
						                  width="200" height="200" class="my-photo">
					</c:if>
				</li>
				<li>
					<div id="photo_choice">
						<input type="file" id="photo" 
						accept="image/gif,image/png,image/jpeg"><br>
						<input type="button" value="변경" id="photo_submit">
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>