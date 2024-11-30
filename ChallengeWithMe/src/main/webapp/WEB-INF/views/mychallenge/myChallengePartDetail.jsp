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

<% 
    String chNum = request.getParameter("ch_num");
    session.setAttribute("ch_num", chNum); 
%>
<div class="page-main">
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
                        <img src="${pageContext.request.contextPath}/upload/${xuser.photo}"
                             width="150" height="150" class="my-photo">
                    </c:if>
                </li>
            </ul>
        </div>

        <div>
            <!-- 각각의 버튼에 대해 a 태그를 사용하여 GET 방식으로 ch_num을 전달 -->
            <a href="../pvchallenge/pvChallengePhoto.do?ch_num=${ch_num}">
                <input type="button" value="챌린지 인증(사진인증)" id="proved_button">
            </a>

            <a href="../pvchallenge/pvChallengeTime.do?ch_num=${ch_num}">
                <input type="button" value="챌린지 인증2(시간인증)" id="proved_button">
            </a>

            <a href="../pvchallenge/pvChallengeWriting.do?ch_num=${ch_num}">
                <input type="button" value="챌린지 인증3(문구인증)" id="proved_button">
            </a>

            <a href="../pvchallenge/pvChallengeGame.do?ch_num=${ch_num}">
                <input type="button" value="챌린지 인증4(게임)" id="proved_button">
            </a>

            <a href="../pvchallenge/pvChallengeQR.do?ch_num=${ch_num}">
                <input type="button" value="챌린지 인증5(QR)" id="proved_button">
            </a>

            <a href="../pvchallenge/pvChallengeExpense.do?ch_num=${ch_num}">
                <input type="button" value="챌린지 인증6(가계부)" id="proved_button">
            </a>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
