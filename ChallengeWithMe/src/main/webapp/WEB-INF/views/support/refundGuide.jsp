<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>환불 가이드</title>
    <style>
        /* 🐇 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        /* 🐇 헤더 스타일 */
        .header {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            text-align: center;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        /* 🐇 컨테이너 스타일 */
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* 🐇 환불 가이드 리스트 스타일 */
        .refund-guide-list {
            list-style-type: none;
            padding: 0;
        }

        .refund-guide-list li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .refund-guide-list li:last-child {
            border-bottom: none;
        }

        .refund-guide-list .title {
            font-weight: bold;
            color: #4caf50;
        }

        .refund-guide-list .date {
            font-size: 14px;
            color: #888;
        }

        .refund-guide-list .content {
            margin-top: 10px;
            font-size: 16px;
            color: #333;
        }

        /* 🐇 페이징 스타일 */
        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .pagination a:hover {
            background-color: #4caf50;
            color: white;
        }

        .pagination .current {
            background-color: #4caf50;
            color: white;
            border: 1px solid #4caf50;
        }

        /* 🐇 푸터 스타일 */
        footer {
            text-align: center;
            margin-top: 20px;
            color: #888;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- 🐇 헤더 -->
    <div class="header">
        <h1>환불 방법 안내</h1>
    </div>

    <!-- 🐇 컨테이너 -->
    <div class="container">
        <h2>환불 방법 및 절차</h2>
        <p>아래의 내용을 확인하시고, 환불 절차를 따라 주세요. 문제가 발생하면 고객센터로 문의해 주세요. 😊</p>

        <!-- 🐇 환불 가이드 리스트 -->
        <ul class="refund-guide-list">
            <c:forEach var="refund" items="${refundList}">
                <li>
                    <div class="title"><c:out value="${refund.sup_title}" /></div>
                    <div class="date">작성일: <fmt:formatDate value="${refund.sup_date}" pattern="yyyy-MM-dd" /></div>
                    <div class="content"><c:out value="${refund.sup_content}" /></div>
                </li>
            </c:forEach>
            <c:if test="${empty refundList}">
                <li>환불 안내 내용이 없습니다. 😢</li>
            </c:if>
        </ul>

        <!-- 🐇 페이징 -->
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="?page=1">처음</a>
                <a href="?page=${currentPage - 1}">이전</a>
            </c:if>

            <c:forEach begin="1" end="${totalPages}" var="page">
                <a href="?page=${page}" class="${page == currentPage ? 'current' : ''}">${page}</a>
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <a href="?page=${currentPage + 1}">다음</a>
                <a href="?page=${totalPages}">마지막</a>
            </c:if>
        </div>
    </div>

    <!-- 🐇 푸터 -->
    <footer>
        ⓒ 꼬박꼬박 챌린지 고객센터
    </footer>
</body>
</html>
