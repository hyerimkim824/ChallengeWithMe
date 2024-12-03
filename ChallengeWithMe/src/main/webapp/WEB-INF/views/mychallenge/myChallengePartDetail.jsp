<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>참여 챌린지</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/khr.css" type="text/css">
    
<style>


/* 제목 스타일 */
h1 {
    color: #f7b500;
    text-align: center;
    margin-top: 20px;
}

h3, h4 {
    color: #f7b500;
    margin: 15px 0;
}

/* 메인 컨테이너 */
.page-main-detail {
    background-color: #fff8dc;
    border: 2px solid #f7b500;
    padding: 20px;
    border-radius: 10px;
    margin: 20px auto;
    max-width: 800px;
}

/* 챌린지 인증 버튼 스타일 */
.prove-challenge a input[type="button"] {
    background-color: #f7b500;
    width:200px;
    border: none;
    border-radius: 5px;
    color: white;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    margin: 10px 0;
}

.prove-challenge a input[type="button"]:hover {
    background-color: #d99c00;
}

/* 이미지 스타일 */
.my-photo {
    border: 3px solid #f7b500;
    border-radius: 10px;
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    background-color: #fff;
    color: #333;
}

table th, table td {
    border: 1px solid #f7b500;
    padding: 10px;
    text-align: center;
}

table th {
    background-color: #f7b500;
    color: white;
}

table td {
    background-color: #fff8dc;
}

#autoTable td {
    font-weight: bold;
}

/* 링크 스타일 */
a {
    text-decoration: none;
    color: #f7b500;
}

a:hover {
    color: #d99c00;
}

/* 인증 달성률 스타일 */
h4 {
    margin: 10px 0;
}

</style>


    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<h1>참여 챌린지 세부 정보 및 인증</h1>

<div class="page-main-detail">
 <h3>${mychall.ch_title}</h3>
    <div class="mychallenge-content-detail">
        <div class="mychallenge-div-detail">
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
       
         <table id="simple_info_table4">
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
            <c:if test="${mychall.ah_num eq 2}">
                <a href="../pvchallenge/pvChallengePhoto.do?ch_num=${ch_num}">
                    <input type="button" value="사진인증" id="proved_button">
                </a>
            </c:if>
            <c:if test="${mychall.ah_num eq 1}">
                <a href="../pvchallenge/pvChallengeTime.do?ch_num=${ch_num}">
                    <input type="button" value="시간인증" id="proved_button">
                </a>
            </c:if>
            <c:if test="${mychall.ah_num eq 3}">
                <a href="../pvchallenge/pvChallengeWriting.do?ch_num=${ch_num}">
                    <input type="button" value="문구인증" id="proved_button">
                </a>
            </c:if>
            <c:if test="${mychall.ah_num eq 4}">
                 <a href="../challenge/challengeGame.do">
                    <input type="button" value="게임" id="proved_button">
                </a>
            </c:if>
            <c:if test="${mychall.ah_num eq 5}">
                  <a href="../pvchallenge/pvChallengeQR.do?ch_num=${ch_num}">
                    <input type="button" value="QR" id="proved_button">
                </a>
            </c:if>
            <c:if test="${mychall.ah_num eq 6}">
                <a href="../pvchallenge/pvChallengeExpense.do?ch_num=${ch_num}">
                    <input type="button" value="가계부" id="proved_button">
                </a>
            </c:if>
        </div> <!--인증 챌린지까지 -->
        
        <h4>챌린지 참가 인원 : 500</h4>
        <h4>챌린지 달성률 : 0% </h4>
       
       <table id="autoTable" border="1">
        <!-- JavaScript에서 행과 열이 추가됩니다 -->
       </table>
       
       <script type="text/javascript">
    // 리스트 데이터
       var list = ${list};
    // 테이블 컨테이너 선택
       var table = document.getElementById("autoTable");

       // 행 생성
       var row = document.createElement("tr");

       // 리스트를 순회하며 열(td)을 동적으로 생성
       list.forEach(item => {
           var cell = document.createElement("td");
           cell.textContent = item === 0 ? "X" : "O"; // 조건에 따라 X 또는 O로 설정
           row.appendChild(cell); // 행에 셀 추가
       });

       // 테이블에 행 추가
       table.appendChild(row);      

       </script>
      
        
        <h4>챌린지 상세정보 링크</h4>
        
        
        
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
