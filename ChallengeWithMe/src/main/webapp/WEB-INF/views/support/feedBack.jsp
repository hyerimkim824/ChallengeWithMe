<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>피드백 관리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            text-align: center;
            color: #333333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #dddddd;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #007bff;
        }
        .pagination a.active {
            font-weight: bold;
            text-decoration: underline;
        }
        .feedback-form {
            margin-top: 30px;
        }
        .feedback-form textarea {
            width: 100%;
            height: 100px;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
        }
        .feedback-form button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .feedback-form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>피드백 관리</h1>
    
    <!-- 피드백 입력 폼 -->
    <form action="feedbackWrite.do" method="post" class="feedback-form">
        <textarea name="feedback_content" placeholder="피드백을 입력해주세요... 🐇"></textarea>
        <button type="submit">피드백 제출</button>
    </form>
    
    <!-- 피드백 목록 -->
    <h2>피드백 목록</h2>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>내용</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="feedback" items="${feedbackList}">
                <tr>
                    <td>${feedback.feedback_id}</td>
                    <td>${feedback.feedback_content}</td>
                    <td>${feedback.feedback_date}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- 피드백이 없을 경우 메시지 -->
    <c:if test="${empty feedbackList}">
        <p style="text-align: center; color: #999999;">아직 작성된 피드백이 없습니다. 🐥</p>
    </c:if>
    
    <!-- 페이징 처리 -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="feedbackList.do?page=1"><<</a>
            <a href="feedbackList.do?page=${currentPage - 1}"><</a>
        </c:if>
        
        <c:forEach begin="1" end="${totalPages}" var="page">
            <a href="feedbackList.do?page=${page}" class="${currentPage == page ? 'active' : ''}">${page}</a>
        </c:forEach>
        
        <c:if test="${currentPage < totalPages}">
            <a href="feedbackList.do?page=${currentPage + 1}">></a>
            <a href="feedbackList.do?page=${totalPages}">>></a>
        </c:if>
    </div>
</div>
</body>
</html>
