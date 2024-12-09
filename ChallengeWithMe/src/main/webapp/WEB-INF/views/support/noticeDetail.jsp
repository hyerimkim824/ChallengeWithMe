<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 | 꼬박꼬박 고객센터</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
  
</head>
<body>
    <header>
        <div class="logo">꼬박꼬박 고객센터</div>
        <div class="menu">
            <a href="#">한국어</a> | 
            <a href="<%= request.getContextPath() %>/login.do">로그인</a>
        </div>
    </header>

    <div class="container">
        <div class="title-section">
            <h1>공지사항</h1>
            <p>꼬박꼬박 고객센터에서 알려드립니다.</p>
        </div>

        <div class="notice-list">
            <div class="notice-item">
                <span class="badge">중요</span>
                <span class="title">꼬박꼬박 챌린지 웹사이트 개설 </span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-item">
                <span class="title">챌린지 불법 행위 관련 조치 및 대응 안내</span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-item">
                <span class="title">[안내] 피해 접수자 안내 메일 발송</span>
                <span class="date">2024-11-09</span>
            </div>
                    <div class="notice-item">
                <span class="title">[안내] 꼬박꼬 사칭 문자에 주의하세요.</span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-item">
                <span class="title">[안내] 11/9 부터 꼬박꼬박 고객센터 전화상담이 1:1 상담으로 전환됩니다.</span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-item">
                <span class="title">[안내] 추석 연휴 꼬박꼬박 고객센터 휴무 안내</span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-item">
                <span class="title">[안내] 신규 업데이트 안내</span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-item">
                <span class="title">[안내] 신규 업데이트 안내</span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-item">
                <span class="title"></span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-item">
                <span class="title"></span>
                <span class="date">2024-11-09</span>
            </div>
    
        </div>

        <!-- Pagination -->
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">다음</a>
        </div>
    </div>
</body>
</html>
