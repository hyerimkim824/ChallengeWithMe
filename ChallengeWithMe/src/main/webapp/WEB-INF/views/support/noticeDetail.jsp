<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 | 꼬박꼬박 고객센터</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
    <style>
        /* 공통 스타일 */
        body {
            font-family: 'Noto Sans', 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            border-bottom: 1px solid #ddd;
        }

        header .logo {
            font-size: 20px;
            font-weight: bold;
        }

        header .menu {
            font-size: 14px;
            color: #666;
        }

        header .menu a {
            margin-left: 10px;
        }

        /* 메인 컨테이너 */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 15px;
        }

        .title-section {
            text-align: center;
            margin-bottom: 20px;
        }

        .title-section h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .title-section p {
            font-size: 14px;
            color: #888;
        }

        /* 공지사항 목록 스타일 */
        .notice-list {
            border-top: 2px solid #000;
        }

        .notice-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }

        .notice-item .title {
            flex: 1;
            font-weight: bold;
        }

        .notice-item .date {
            width: 100px;
            text-align: right;
            color: #888;
        }

        .notice-item .badge {
            display: inline-block;
            background-color: #ffeb3b;
            color: #333;
            font-size: 12px;
            padding: 3px 8px;
            border-radius: 3px;
            margin-right: 10px;
        }

        /* 페이징 스타일 */
        .pagination {
            display: flex;
            justify-content: center;
            padding: 20px 0;
            font-size: 14px;
        }

        .pagination a {
            margin: 0 5px;
            padding: 5px 10px;
            color: #333;
            border: 1px solid #ddd;
            border-radius: 3px;
        }

        .pagination a.active {
            background-color: #6200ee;
            color: #fff;
            border-color: #6200ee;
        }

        .pagination a:hover {
            background-color: #6200ee;
            color: #fff;
        }
    </style>
    <script>
        // 🐥 공지사항 클릭 시 토글 형식으로 내용 표시 🐥
        function toggleAnswer(id) {
            const answer = document.getElementById(id);
            if (answer.style.display === "none") {
                answer.style.display = "block";
            } else {
                answer.style.display = "none";
            }
        }
    </script>
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
