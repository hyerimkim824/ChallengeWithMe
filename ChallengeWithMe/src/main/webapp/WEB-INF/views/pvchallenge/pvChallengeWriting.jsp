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
    <h1>문구 인증 챌린지</h1>
    <h1>랜덤 숫자 생성기</h1>
    <p>버튼을 눌러 랜덤 숫자를 생성하세요.</p>
    <p id="randomNumber">여기에 랜덤 숫자가 표시됩니다.</p>
    <button onclick="generateRandomNumber()">랜덤 숫자 생성</button>

    <!-- Java에서 전달된 wiselist를 HTML 리스트로 출력 -->
    <ul id="wiseList">
        <c:forEach var="saying" items="${wiselist}">
            <li>${saying}</li>
        </c:forEach>
    </ul>

    <script>
        // 랜덤 숫자 생성 함수
        function generateRandomNumber() {
            // 1~100 사이의 랜덤 숫자 생성
            const randomNum = Math.floor(Math.random() * 100) + 1;
            // 랜덤 숫자를 표시
            document.getElementById('randomNumber').textContent = `랜덤 숫자: ${randomNum};
        }
    </script>
</body>
</html>