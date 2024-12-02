<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>참여 챌린지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/khr.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<h1>참여 챌린지 딭일</h1>

<div class="page-main">
    <div class="mychallenge-content-detail">
        <div class="mychallenge-div">
            <h4>프로필 사진</h4>
            <ul>
                <li>
                    <c:if test="${empty xuser.photo}">
                        <img src="${pageContext.request.contextPath}/images/face.png" width="150" height="150" class="my-photo">
                    </c:if>
                    <c:if test="${!empty xuser.photo}">
                        <img src="${pageContext.request.contextPath}/upload/${xuser.photo}" width="150" height="150" class="my-photo">
                    </c:if>
                </li>
            </ul>
        </div>
		<div class="align-right">
         <table id="simple_info_table">
            <thead>
                <tr>
                    <th colspan="2">MY 챌린지 참여/개설 정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>시작전</td>
                    <td>${partTable1.part_count}</td>
                </tr>
                <tr>
                    <td>참여 중</td>
                    <td>${partTable2.part_count}</td>
                </tr>
                <tr>
                    <td>포기</td>
                    <td>${partTable3.part_count}</td>
                </tr>
                <tr>
                    <td>완료</td>
                    <td>${partTable4.part_count}</td>
                </tr>
                <tr>
                    <td>개설</td>
                    <td>${partTable1.chall_count}</td>
                </tr>
            </tbody>
        </table>
        </div>

        <div class="prove-challenge">
            <c:if test="${mychall.ah_num eq 1}">
                <a href="../pvchallenge/pvChallengePhoto.do?ch_num=${ch_num}">
                    <input type="button" value="챌린지 인증(사진인증)" id="proved_button">
                </a>
            </c:if>
            <c:if test="${mychall.ah_num eq 2}">
                <a href="../pvchallenge/pvChallengeTime.do?ch_num=${ch_num}">
                    <input type="button" value="챌린지 인증2(시간인증)" id="proved_button">
                </a>
            </c:if>
            <c:if test="${mychall.ah_num eq 3}">
                <a href="../pvchallenge/pvChallengeWriting.do?ch_num=${ch_num}">
                    <input type="button" value="챌린지 인증3(문구인증)" id="proved_button">
                </a>
            </c:if>
            <c:if test="${mychall.ah_num eq 4}">
                <a href="../pvchallenge/pvChallengeGame.do?ch_num=${ch_num}">
                    <input type="button" value="챌린지 인증4(게임)" id="proved_button">
                </a>
            </c:if>
            <c:if test="${mychall.ah_num eq 5}">
                <!-- a href="../pvchallenge/pvChallengeQR.do?ch_num=${ch_num}&ah_num=${mychall.ah_num}"> -->
                    <a href="../pvchallenge/pvChallengeQR.do?ch_num=${ch_num}">
                    <input type="button" value="챌린지 인증5(QR)" id="proved_button">
                </a>
            </c:if>
            <c:if test="${mychall.ah_num eq 6}">
                <a href="../pvchallenge/pvChallengeExpense.do?ch_num=${ch_num}">
                    <input type="button" value="챌린지 인증6(가계부)" id="proved_button">
                </a>
            </c:if>
        </div> <!--인증 챌린지까지 -->
        
        <h3>${mychall.ch_title}</h3>
        <h4>챌린지 참가 인원 : </h4>
        <h4>챌린지 달성률 : </h4>
        
        <h4>날짜 별 달성 표시 : ${list}</h4>
        
        <h4>챌린지 상세정보 링크</h4>
        
        
        
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
