<%@page import="kr.support.vo.SupportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>문의 내역</title>
    <style>
        /* 🐤 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        /* 🐤 헤더 스타일 */
        .header {
            background-color: #fdd835;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 24px;
            color: #333;
            margin: 0;
        }

        .header .search-bar {
            display: flex;
            align-items: center;
        }

        .header input[type="text"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .header button {
            background-color: #ffeb3b;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
            margin-left: 5px;
        }

        /* 🐤 사이드 메뉴 스타일 */
        .menu {
            display: flex;
            flex-direction: column;
            width: 20%;
            float: left;
            background-color: #fff9c4;
            padding: 10px;
            margin-right: 20px;
        }

        .menu a {
            text-decoration: none;
            color: #333;
            margin: 5px 0;
            padding: 5px;
            display: block;
        }

        .menu a:hover {
            background-color: #fdd835;
            color: #fff;
        }

        /* 🐤 메인 콘텐츠 스타일 */
        .content {
            float: left;
            width: 75%;
        }

        .content h2 {
            font-size: 20px;
            color: #333;
            margin-bottom: 15px;
        }

        /* 🐤 테이블 스타일 */
        .inquiry-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .inquiry-table th, .inquiry-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .inquiry-table th {
            background-color: #fdd835;
            color: #333;
            font-weight: bold;
        }

        .inquiry-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .inquiry-table tr:hover {
            background-color: #fffde7;
        }

        /* 🐤 페이징 스타일 */
        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .pagination a:hover {
            background-color: #fdd835;
            color: #fff;
        }

        .pagination .current {
            background-color: #fdd835;
            color: #fff;
            border: 1px solid #fdd835;
        }

        /* 🐤 푸터 스타일 */
        footer {
            background-color: #ffeb3b;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- 🐤 헤더 -->
    <div class="header">
        <h1>고객센터</h1>
        <div class="search-bar">
            <input type="text" placeholder="자주 묻는 질문 검색">
            <button>검색</button>
        </div>
    </div>

    <!-- 🐤 메인 컨테이너 -->
    <div class="container">
        <!-- 🐤 사이드 메뉴 -->
        <div class="menu">
            <a href="${ pageContext.request.contextPath}/support/faqList.jsp">자주 묻는 질문</a>
            <a href="${ pageContext.request.contextPath}/support/loginaAcount.jsp">로그인 및 계정</a>
            <a href="refundGuide.jsp">결제 및 환불</a>
            <a href="challengeHelp.jsp">꼬박꼬박 챌린지</a>
            <a href="communityHelp.jsp">꼬박꼬박 커뮤니티</a>
        </div>

        <!-- 🐤 콘텐츠 -->
        <div class="content">
            <h2>문의 내역</h2>
            <table class="inquiry-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>문의 유형</th>
                        <th>문의 제목</th>
                        <th>문의 날짜</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- 🐤 문의 내역 데이터 출력 --%>
                    <%
                        List<SupportVO> inquiryList = (List<SupportVO>) request.getAttribute("inquiryList");
                        if (inquiryList != null && !inquiryList.isEmpty()) {
                            for (SupportVO inquiry : inquiryList) {
                    %>
                                <tr>
                                    <td><%= inquiry.getSup_num() %></td>
                                    <td><%= inquiry.getSup_pick() == 3 ? "환불" : "기타" %></td> <!-- 유형 조건 -->
                                    <td><a href="inquiryDetail.do?sup_num=<%= inquiry.getSup_num() %>"><%= inquiry.getSup_title() %></a></td>
                                    <td><%= inquiry.getSup_date() %></td>
                                    <td><%= inquiry.isSup_visi() ? "비공개" : "공개" %></td>
                                </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="5">문의 내역이 없습니다.</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <!-- 🐤 페이징 -->
            <div class="pagination">
                <%-- 페이지 링크 추가 --%>
                <a href="?page=1">&laquo;</a>
                <a href="?page=prev">&lt;</a>
                <span class="current">2</span>
                <a href="?page=3">3</a>
                <a href="?page=4">&gt;</a>
                <a href="?page=10">&raquo;</a>
            </div>
        </div>
    </div>

    <!-- 🐤 푸터 -->
    <footer>
        ⓒ 꼬박꼬박 챌린지 고객센터
    </footer>
</body>
</html>
