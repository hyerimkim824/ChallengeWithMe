<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>삭제 실패</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>고객센터</h1>
            <nav>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/support/List.do">문의 내역</a></li>
                    <li><a href="<%= request.getContextPath() %>/support/FaqList.do">자주 묻는 질문</a></li>
                    <li><a href="<%= request.getContextPath() %>/support/RefundGuide.do">환불 안내</a></li>
                </ul>
            </nav>
        </header>
        
        <main class="main-content">
            <h2>삭제 실패</h2>
            <p>삭제 작업 중 문제가 발생했습니다. 😔</p>
            <p>잠시 후 다시 시도하거나, 문제가 지속되면 관리자에게 문의해주세요.</p>
            <div class="btn-container">
                <a href="<%= request.getContextPath() %>/support/List.do" class="btn">문의 내역으로 돌아가기</a>
                <a href="<%= request.getContextPath() %>/main/main.do" class="btn">홈으로 돌아가기</a>
            </div>
        </main>
        
        <footer class="footer">
            <p>ⓒ 꼬박꼬박 챌린지 | 고객센터 | 마이페이지 | 공지사항</p>
        </footer>
    </div>
</body>
</html>
