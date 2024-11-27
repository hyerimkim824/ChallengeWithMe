<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자주 묻는 질문 FAQ</title>
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1, h2 {
            margin: 0;
            padding: 10px;
            color: #333;
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

        /* 네비게이션 */
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

        /* 컨테이너 (Flexbox 레이아웃) */
        .container {
            display: flex;
            flex-direction: row;
        }

        /* 사이드바 */
        .sidebar {
            width: 20%;
            background-color: #fff9c4;
            padding: 15px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar a {
            display: block;
            text-decoration: none;
            color: #333;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background-color: #fdd835;
            color: #fff;
        }

        /* 메인 콘텐츠 */
        .content {
            flex-grow: 1;
            padding: 20px;
            background-color: #ffffff;
        }

        .faq-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .faq-table th, .faq-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .faq-table th {
            background-color: #fdd835;
            color: #333;
        }

        .faq-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .faq-table tr:hover {
            background-color: #fffde7;
        }

        /* 🐤 페이징 스타일 */
        .pagination {
            text-align: center;
            margin: 20px 0;
        }

        .pagination a {
            display: inline-block;
            margin: 0 5px;
            padding: 10px 15px;
            color: #333;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-decoration: none;
            background-color: #fff;
            transition: all 0.3s ease;
        }

        .pagination a:hover {
            background-color: #ffcc00;
            color: #fff;
        }

        .pagination .current {
            background-color: #ffcc00;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            border: none;
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
    <!-- 헤더 -->
    <div class="header">
        <h1>고객센터</h1>
          <div class="search-bar">
            <input type="text" placeholder="자주 묻는 질문 검색">
            <button>검색</button>
        </div>
    </div>

    <!-- 네비게이션 -->
    <div class="nav">
        <a href="${pageContext.request.contextPath}/support/List.do">문의 내역</a>
        <a href="${pageContext.request.contextPath}/support/FaqList.do">자주 묻는 질문</a>
        <a href="${pageContext.request.contextPath}/support/FeedBackList.do">고객의 소리</a>
    </div>

    <!-- 메인 컨테이너 -->
    <div class="container">
        <!-- 사이드바 -->
        <div class="sidebar">
            <a href="${pageContext.request.contextPath}/support/FaqList.do">자주 묻는 질문</a>
            <a href="${pageContext.request.contextPath}/support/LoginaAcount.do">로그인 및 계정</a>
            <a href="${pageContext.request.contextPath}/support/RefundGuide.do">결제 및 환불</a>
            <a href="${pageContext.request.contextPath}/support/ChallengeHelp.do">꼬박꼬박 챌린지</a>
            <a href="${pageContext.request.contextPath}/support/CommunityHelp.do">꼬박꼬박 커뮤니티</a>
        </div>

        <!-- 메인 콘텐츠 -->
        <div class="content">
            <h2>자주 묻는 질문 FAQ</h2>
            <table class="faq-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>질문</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty faqList}">
                        <c:forEach var="faq" items="${faqList}">
                            <tr>
                                <td>${faq.faqNum}</td>
                                <td>${faq.faqQuestion}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty faqList}">
                        <tr>
                            <td colspan="2">등록된 FAQ가 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>

           <!-- 🐤 페이징 -->
    <div class="pagination">
        <a href="?page=1">&laquo;</a>
        <a href="?page=prev">&lt;</a>
        <span class="current">1</span> <!-- 현재 페이지 -->
        <a href="?page=2">2</a>
        <a href="?page=next">&gt;</a>
        <a href="?page=last">&raquo;</a>
        </div>
        </div>
    </div>
  

    <!-- 푸터 -->
    <div class="footer">
        <a href="ChallengeHelp.do">챌린지 안내</a> 
        <a href="SupportWrite.do">1:1 문의</a> 
        <a href="${pageContext.request.contextPath}/mypage/mypage.do">마이페이지</a> 
        <a href="#">공지사항</a>
    </div>
</body>
</html>
