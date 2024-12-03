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



 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


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
       <table id="simple_info_table3">
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
                    <td>실패</td>
                    <td>${partTable3.part_count}</td>
                </tr>
                <tr>
                    <td>포기</td>
                    <td>${partTable4.part_count}</td>
                </tr>
                 <tr>
                    <td>완료</td>
                    <td>${partTable5.part_count}</td>
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
    
  
    </script>

    <div id="part" class="ch-button">
        <h4>MY챌린지 참가수</h4>
        
        <canvas id="myBarChart" width="400" height="200"></canvas>
         <script>
        // 자바스크립트 변수에 데이터를 할당 (여기서 ${ongoingCountX}를 실제 값으로 대체)
        var ongoingCount1 =  ${ongoingCount1};  // 예시 값
        var ongoingCount2 =  ${ongoingCount2};  // 예시 값
        var ongoingCount3 =  ${ongoingCount3};  // 예시 값
        var ongoingCount4 =  ${ongoingCount4};  // 예시 값
        var ongoingCount5 = ${ongoingCount5};  // 예시 값
        var ongoingCount6 =  ${ongoingCount6};  // 예시 값
        var ongoingCount7 =  ${ongoingCount7};  // 예시 값
        var ongoingCount8 =  ${ongoingCount8};  // 예시 값
        var ongoingCount9 =  ${ongoingCount9};  // 예시 값
        var ongoingCount10 =  ${ongoingCount10}; // 예시 값
        var ongoingCount11 =  ${ongoingCount11}; // 예시 값
        var ongoingCount12 = ${ongoingCount12}; // 예시 값

        // 막대 그래프를 그리기 위한 Chart.js 코드
        var ctx = document.getElementById('myBarChart').getContext('2d');
        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                datasets: [{
                    label: 'Ongoing Counts',
                    data: [
                        ongoingCount1,
                        ongoingCount2,
                        ongoingCount3,
                        ongoingCount4,
                        ongoingCount5,
                        ongoingCount6,
                        ongoingCount7,
                        ongoingCount8,
                        ongoingCount9,
                        ongoingCount10,
                        ongoingCount11,
                        ongoingCount12
                    ],
                    backgroundColor:  '#FFD011', // 막대 색상
                    borderColor: 'black', // 테두리 색상
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true // y축 0부터 시작
                    }
                }
            }
        });
    </script>
       
    </div>

    <div id="get" class="ch-button">
        <h4>현재 참여 챌린지 달성률</h4>
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
        
        <h4>한달 평균 챌린지 달성률</h4>
   		 <!-- HTML 테이블 삽입 -->
   		${tableHTML}
		
        
    </div>


<%@ page import="java.util.List" %>

<div id="like" class="ch-button">
    <h4>챌린지 선호도</h4>

    <%
        List<?> prefList = (List<?>) request.getAttribute("pref_list");  // pref_list 가져오기
        int i = 0;
        int j = prefList.size();  // 리스트의 길이

        while (i < j) {
            String category = "";  // 카테고리를 위한 변수 선언
            if (i == 0) {
                category = "기상";
            } else if (i == 1) {
                category = "식습관";
            } else if (i == 2) {
                category = "독서";
            } else if (i == 3) {
                category = "자기계발";
            } else if (i == 4) {
                category = "금연, 금주";
            } else if (i == 5) {
                category = "자기계발";
            }
    %>
            <p id="cate-like">선호 카테고리 : <%= category %></p>
    <%
            i++;
        }
    %>
</div>


</div>
</div>
</div>


</div>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>