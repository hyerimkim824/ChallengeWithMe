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

<script type="text/javascript">


function hideFunction(id) {
    // 모든 토글 요소를 닫음
    var toggles = document.querySelectorAll('.ch-button');
    toggles.forEach(function (toggle) {
        toggle.style.display = "none";
    });

    // 클릭한 요소만 표시
    var current = document.getElementById(id);
    if (current.style.display === "none" || current.style.display === "") {
			current.style.display = "block"; // 표시
		} else {
			current.style.display = "none"; // 닫기
		}
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="page-main">	
<div class="mychallenge-content-main">
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
</div>

	<div class="align-left">
    <!-- 공통 버튼 -->
    <div class="common-button">
        <input type="button" value="참여 챌린지" id="part_ch_btn"
            onclick="location.href='${pageContext.request.contextPath}/mychallenge/myChallengePart.do'">
        <input type="button" value="개설 챌린지" id="gen_ch_btn"
            onclick="location.href='${pageContext.request.contextPath}/mychallenge/myChallengeMake.do'">
    </div>

    <!-- 챌린지 리포트 -->
    <div class="ch-report">
    <h2>챌린지 리포트</h2>

    <!-- 버튼들을 가로로 정렬하는 컨테이너 추가 -->
    <div class="button-container">
        <button id="mybutton" onclick="hideFunction('part')">챌린지 참가수</button>
        <button id="mybutton" onclick="hideFunction('get')">챌린지 달성률</button>
        <button id="mybutton" onclick="hideFunction('like')">챌린지 선호도</button>
    </div>

    <div id="part" class="ch-button">
        <h4>MY챌린지 참가수</h4>
        ${partNum}
        <h4>MY평균 챌린지 참가수</h4>
        ${ongoingCount}
    </div>

    <div id="get" class="ch-button">
        <h4>현재 참여 챌린지 달성률</h4>
        ${list}
        <c:forEach var="ch_list" items="${list}">
            <tr>
                <td>${board.board_num}</td>
                <td><a href="detail.do?board_num=${board.board_num}">${board.title}</a></td>
                <td>${board.id}</td>
                <td>${board.reg_date}</td>
                <td>${board.hit}</td>
            </tr>
        </c:forEach>

        <h4>한달 평균 챌린지 달성률</h4>
        ${list_month}
    </div>

    <div id="like" class="ch-button">
        <h4>챌린지 선호도</h4>
        ${list_prefer}
    </div>
</div>
</div>

</div>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>