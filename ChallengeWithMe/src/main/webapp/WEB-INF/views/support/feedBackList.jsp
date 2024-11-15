<%@page import="kr.support.vo.FeedBackVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>피드백 리스트</title>
    <style>
        /* 🐤 전체 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        /* 🐤 헤더 스타일 */
        .header {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 24px;
            margin: 0;
        }

        .header a {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
            margin-left: 15px;
        }

        .header a:hover {
            text-decoration: underline;
        }

        /* 🐤 테이블 스타일 */
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #4CAF50;
            color: #fff;
            font-weight: bold;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #e8f5e9;
        }

        /* 🐤 페이징 스타일 */
        .pagination {
            text-align: center;
            margin: 20px 0;
        }

        .pagination a {
            display: inline-block;
            margin: 0 5px;
            padding: 8px 12px;
            color: #4CAF50;
            border: 1px solid #4CAF50;
            border-radius: 5px;
            text-decoration: none;
        }

        .pagination a:hover {
            background-color: #4CAF50;
            color: #fff;
        }

        .pagination .current {
            background-color: #4CAF50;
            color: #fff;
            border: none;
        }
    </style>
</head>
<body>
    <!-- 🐤 헤더 -->
    <div class="header">
        <h1>피드백 리스트</h1>
        <a href="supportMain.jsp">고객센터 홈으로 🏡</a>
    </div>

    <!-- 🐤 피드백 테이블 -->
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>작성자 ID</th>
                <th>피드백 내용</th>
                <th>작성 날짜</th>
            </tr>
        </thead>
        <tbody>
            <%-- 🐤 피드백 데이터 반복 출력 --%>
            <%
                List<FeedBackVO> feedbackList = (List<FeedBackVO>) request.getAttribute("feedbackList");
                if (feedbackList != null && !feedbackList.isEmpty()) {
                    for (FeedBackVO feedback : feedbackList) {
            %>
                        <tr>
                            <td><%= feedback.getFeedback_id() %></td>
                            <td><%= feedback.getUser_id() %></td>
                            <td><%= feedback.getFeedback_content() %></td>
                            <td><fmt:formatDate value="<%= feedback.getFeedback_date() %>" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="4">아직 등록된 피드백이 없습니다! 🐇</td>
                </tr>
            <%
                }
            %>
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
</body>
</html>
