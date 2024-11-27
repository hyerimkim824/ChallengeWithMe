<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 수정</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff8e1; /* 이미지 배경과 동일한 색상 */
        }

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

        .container {
            display: flex;
            flex-direction: row;
        }

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

        .content {
            width: 80%;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #fdd835;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #ffeb3b;
        }

        #sup_pwd {
            display: none;
        }

        #visibility option[value="1"]:checked ~ #sup_pwd {
            display: block;
        }

    </style>

    <script>
        // 비공개 상태 선택 시 비밀번호 입력 필드 활성화
        function togglePasswordField() {
            var visibility = document.getElementById("visibility").value;
            var passwordField = document.getElementById("sup_pwd");
            var passwordInput = document.getElementById("sup_pwd_input");

            // 비공개 선택 시 비밀번호 입력 필드 보여주고, 공개 선택 시 숨기기
            if (visibility === "1") { 
                passwordField.style.display = "block";
                passwordInput.setAttribute("required", "true"); // 비공개일 때만 required 속성 추가
            } else {
                passwordField.style.display = "none";
                passwordInput.removeAttribute("required"); // 공개일 때는 required 속성 제거
            }
        }

        // 페이지 로드 시 비공개 상태일 경우 비밀번호 입력 필드 표시
        window.onload = function() {
            togglePasswordField(); // 초기 로드 시 호출해서 비공개 상태 체크
        };
    </script>

</head>
<body>

    <div class="header">
        <h1>고객센터</h1>
        <div class="search-bar">
            <input type="text" placeholder="자주 묻는 질문 검색">
            <button>검색</button>
        </div>
    </div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/support/List.do">문의 내역</a>
        <a href="${pageContext.request.contextPath}/support/FaqList.do">자주 묻는 질문</a> 
        <a href="${pageContext.request.contextPath}/support/FeedBackList.do">고객의 소리</a>
    </div>

    <div class="container">
        <div class="sidebar">
            <a href="${pageContext.request.contextPath}/support/FaqList.do">자주 묻는 질문</a> 
            <a href="${pageContext.request.contextPath}/support/LoginaAcount.do">로그인 및 계정</a> 
            <a href="${pageContext.request.contextPath}/support/RefundGuide.do">결제 및 환불</a> 
            <a href="${pageContext.request.contextPath}/support/ChallengeHelp.do">꼬박꼬박 챌린지</a> 
            <a href="${pageContext.request.contextPath}/support/CommunityHelp.do">꼬박꼬박 커뮤니티</a>
        </div>
        <div class="content">
        
            <h2>1:1 문의 수정</h2>

            <!-- 수정 폼 -->
            <form action="${pageContext.request.contextPath}/support/Update.do" method="post" enctype="multipart/form-data">
                
                <!-- 문의 번호 (숨겨진 필드) -->
                <input type="hidden" name="sup_num" value="${support.sup_num}">
                
                <!-- 제목 입력 -->
                <div class="form-group">
                    <label for="sup_title">문의 제목</label>
                    <input type="text" id="sup_title" name="sup_title" value="${support.sup_title}" required>
                </div>

                <!-- 내용 입력 -->
                <div class="form-group">
                    <label for="sup_content">문의 내용</label>
                    <textarea id="sup_content" name="sup_content" rows="6" required>${support.sup_content}</textarea>
                </div>

                <!-- 공개 여부 -->
                <div class="form-group">
                    <label for="sup_visi">공개 여부</label>
                    <select id="sup_visi" name="sup_visi" onchange="togglePasswordField()">
                        <option value="1" ${support.sup_visi == 1 ? "selected" : ""}>공개</option>
                        <option value="0" ${support.sup_visi == 0 ? "selected" : ""}>비공개</option>
                    </select>
                </div>

                <!-- 비공개 비밀번호 -->
                <div class="form-group" id="sup_pwd">
                    <label for="sup_pwd_input" class="form-label">비공개 비밀번호 (숫자 4자리)</label>
                    <input type="password" id="sup_pwd_input" name="sup_pwd" class="form-control" placeholder="비공개 비밀번호를 입력해주세요" maxlength="4">
                </div>

                <!-- 수정하기 버튼 -->
                <div>
                    <button type="submit">수정하기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
