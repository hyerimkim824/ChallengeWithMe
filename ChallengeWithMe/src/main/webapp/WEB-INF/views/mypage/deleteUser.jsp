<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ check }">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/infomodify.css" type="text/css">
</head>
<body>
	<h2>회원탈퇴 완료</h2>
	<div class="container-wrapper">
		<div class="container2" id="container2">
			<div class="form-container2" id="detail-container">
			    <form id="register_form2" action="${ pageContext.request.contextPath }/mypage/modifyPwd.do" method="post">
			      <h1>회원탈퇴가</h1>
			      <h1>완료되었습니다.</h1>
			      <input class="main" type="button" value="메인으로"
		          onclick="location.href='${ pageContext.request.contextPath }/main/main.do'">
			    </form>
			 </div>
		</div>
	</div>
</body>
</html>
</c:if>
<c:if test="${ !check }">
	<script>
		alert('입력한 정보가 정확하지 않습니다!')
		history.go(-1)
	</script>
</c:if>