<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 결과</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* 기본 스타일 */
        body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fcfcfc;
}

h1, h2 {
	margin: 0;
	padding: 10px;
	color: #333;
}
h2{
	margin-bottom: 30px;
	margin-left: 15px;
}
/* 헤더 */
.header {
	background-color: #ffeb3b;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header input[type="text"] {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.header button {
	padding: 5px 10px;
	background-color: #fdd835;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

        .header a {
            display: inline-block;
            margin-top: 8px;
            text-decoration: none;
            color: #333;
            background-color: #fff;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .header a:hover {
            background-color: #ffcc00;
            color: #fff;
        }
.nav {
	display: flex;
	justify-content: space-around;
	background-color: #fff;
	padding: 10px 0;
}

.nav a {
	text-decoration: none;
	color: #333;
	padding: 10px 20px;
}

.nav a:hover {
	background-color: #fdd835;
	color: #fff;
	border-radius: 5px;
}
        
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        /* 헤더 */
        .header2 {
            background-color: #ffe600;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #333;
     
        }

        /* 검색창 스타일 */
        .search-container {
            max-width: 600px;
            margin: 20px auto;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .search-container input[type="text"] {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .search-container button {
            padding: 10px 20px;
            background-color: #ffe600;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            color: #333;
        }

        .search-container button:hover {
            background-color: #ffcc00;
        }

        /* 검색 결과 섹션 */
        .results-container {
            max-width: 800px;
            margin: 20px auto;
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .results-header {
            background-color: #ffe600;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            color: #333;
            
        }
         .results-header2 {
            background-color;
            padding: 16px;
            font-size: 13px;
            text-align;
            color: #666;
           
        }

        .result-item {
            border-bottom: 1px solid #eee;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: background 0.3s;
        }

        .result-item:hover {
            background-color: #f8f8f8;
        }

        .result-title {
            font-size: 16px;
            font-weight: bold;
            color: #0073e6;
            text-decoration: none;
        }

        .result-title:hover {
            text-decoration: underline;
        }

        .result-description {
            font-size: 14px;
            color: #666;
            margin-top: 5px;
        }

        .view-more {
            display: flex;
            align-items: center;
            gap: 5px;
            font-size: 14px;
            color: #0073e6;
            cursor: pointer;
            text-decoration: none;
        }

        .view-more:hover {
            text-decoration: underline;
        }

        /* 빈 결과 */
        .no-results {
            text-align: center;
            padding: 30px;
            font-size: 18px;
            color: #999;
        }
          /* 푸터 */
        .footer {
            clear: both;
            text-align: center;
            padding: 10px 0;
            background-color: #fdd835;
        }

        .footer a {
            text-decoration: none;
            color: #333;
            padding: 5px 10px;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
   <!-- 🐤 헤더 -->
<div class="header">
    <h1>고객센터</h1>
    <a href="List.do">고객센터 홈으로 🏡</a>
  
</div>

	<div class="nav">
		<a href="${pageContext.request.contextPath}/support/List.do">문의 내역</a>
		<a href="${pageContext.request.contextPath}/support/FaqList.do">자주
			묻는 질문</a> <a
			href="${pageContext.request.contextPath}/support/FeedBackList.do">고객의
			소리</a>
	</div>

    <!-- 검색창 -->
    <div class="search-container">
     <form action="Search.do" method="get" style="display: flex; align-items: center;"></form>
        <input type="text" placeholder="검색어를 입력하세요">
        <button>검색</button>
    </div>

    <!-- 검색 결과 -->
	   <div class="results-container">
	    <c:choose>
	        <c:when test="${not empty param.keyword}">
	            <div class="results-header">
	                "<strong>${param.keyword}</strong>"에 대한 검색 결과를 확인하세요
	            </div>
	            <div class="results-header2">
            "<span>${param.keyword}</span>" 검색 결과 <span>${totalCount}</span>개를 찾았습니다.
        </div>
	        </c:when>
	        <c:otherwise>
	            <div class="results-header">
	                검색 결과를 확인하세요
	            </div>
	        </c:otherwise>
	    </c:choose>
	
	    <c:if test="${not empty searchList}">
	        <c:forEach var="result" items="${searchList}">
	            <div class="result-item">
	                <div>
	                    <!-- {[sup_pick] sup_title} 형식으로 출력 -->
	                    <span class="result-title"> [<c:out value="${result.supPickString}" />] <c:out value="${result.sup_title}" /></span>
	                </div>
	               <a href="Detail.do?sup_num=${result.sup_num}" class="view-more">자세히 보기 ➜</a>
	            </div>
	        </c:forEach>
	    </c:if>
	
	    <c:if test="${empty searchList}">
	        <div class="no-results">검색 결과가 없습니다. 😔</div>
	    </c:if>
	</div>
      <!-- 푸터 -->
    <div class="footer">
        <a href="ChallengeHelp.do">챌린지 안내</a> |
        <a href="SupportWrite.do">1:1 문의</a> |
        <a href="${pageContext.request.contextPath}/mypage/mypage.do">마이페이지</a> |
        <a href="${pageContext.request.contextPath}/common/notice.do">공지사항</a>
    </div>
</body>
</html>
