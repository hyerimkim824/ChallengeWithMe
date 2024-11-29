<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문구 인증 챌린지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/khr.css" type="text/css">
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>	
</head>
 
<body>    
     <h1>화살표 돌림판</h1>
    <div class="wheel" id="wheel">
        <div class="game_arrow"></div>  <!-- 화살표 추가 -->
    </div>
    <button onclick="spinWheel()">돌리기</button>

    
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/pvchallengeGame.js"></script>
    
    
    
</body>
</html>