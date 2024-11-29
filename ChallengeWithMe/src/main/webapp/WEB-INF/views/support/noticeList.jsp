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
            cursor: pointer;
        }

        .notice-item:hover {
            background-color: #f9f9f9;
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

        .notice-content {
            display: none;
            padding: 10px;
            border-left: 4px solid #6200ee;
            background-color: #f7f7ff;
            margin-top: 10px;
            font-size: 14px;
            color: #333;
        }

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
        function toggleAnswer(id) {
            const content = document.getElementById(id);
            if (content.style.display === "none" || content.style.display === "") {
                content.style.display = "block";
            } else {
                content.style.display = "none";
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
            <!-- 공지사항 1 -->
            <div class="notice-item" onclick="toggleAnswer('notice1')">
                <span class="badge">중요</span>
                <span class="title">[공지] 꼬박꼬박 챌린지 웹사이트 개설</span>
                <span class="date">2024-11-29</span>
            </div>
            <div class="notice-content" id="notice1">
                꼬박꼬박 챌린지가 웹사이트로 새롭게 단장되었습니다. 챌린지 진행과 참여가 더 쉬워집니다!
            </div>

            <!-- 공지사항 2 -->
            <div class="notice-item" onclick="toggleAnswer('notice2')">
                <span class="title">[공지] 챌린지 불법 행위 관련 조치 및 대응 안내</span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-content" id="notice2">
                최근 불법 행위에 대한 대응 조치가 강화되었습니다. 자세한 내용은 공지를 확인하세요.
            </div>

            <!-- 공지사항 3 -->
            <div class="notice-item" onclick="toggleAnswer('notice3')">
                <span class="title">[안내] 피해 접수자 안내 메일 발송</span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-content" id="notice3">
                피해 접수자에게 안내 메일이 발송되었습니다. 자세한 문의는 고객센터로 부탁드립니다.
            </div>

            <!-- 공지사항 4 -->
            <div class="notice-item" onclick="toggleAnswer('notice4')">
                <span class="title">[안내] 꼬박꼬 사칭 문자에 주의하세요</span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-content" id="notice4">
                최근 꼬박꼬박을 사칭한 문자가 발견되었습니다. 의심스러운 연락은 즉시 고객센터에 신고해 주세요.
            </div>

            <!-- 공지사항 5 -->
            <div class="notice-item" onclick="toggleAnswer('notice5')">
                <span class="title">[안내] 추석 연휴 꼬박꼬박 고객센터 휴무 안내</span>
                <span class="date">2024-11-09</span>
            </div>
            <div class="notice-content" id="notice5">
                추석 연휴 기간 동안 고객센터 운영이 제한됩니다. 자세한 일정은 공지사항을 확인하세요.
            </div>
        </div>

        <!-- Pagination -->
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">다음</a>
        </div>
    </div>
    <script>
        window.onload = function () {
            const hash = window.location.hash; // 현재 URL에서 #id 값 가져오기
            if (hash) {
                const target = document.querySelector(hash); // 해당 id를 가진 요소 선택
                if (target) {
                    target.scrollIntoView({ behavior: "smooth" }); // 부드럽게 스크롤
                    const answer = target.querySelector(".notice-content"); // notice-content 열기
                    if (answer) {
                        answer.style.display = "block"; // 내용을 표시
                    }
                }
            }
        };
    </script>
</body>
</html>
