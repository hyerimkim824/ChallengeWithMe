<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 및 계정 FAQ</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .faq-header {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            border-bottom: 2px solid #ffcc00;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .faq-item {
            margin-bottom: 20px;
        }
        .faq-question {
            font-size: 18px;
            font-weight: bold;
            color: #555;
            cursor: pointer;
        }
        .faq-answer {
            font-size: 16px;
            color: #666;
            margin-top: 5px;
            display: none;
        }
        .faq-question:hover {
            color: #ff9900;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            text-decoration: none;
            color: #333;
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 0 5px;
        }
        .pagination a:hover {
            background-color: #ffcc00;
            color: #fff;
        }
        .pagination .active {
            background-color: #ff9900;
            color: #fff;
            border: 1px solid #ff9900;
        }
    </style>
    <script>
        // 자바스크립트로 질문 클릭 시 답변 보이기/숨기기
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
    <div class="container">
        <div class="faq-header">로그인 및 계정 FAQ</div>
        <!-- FAQ 리스트 -->
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer1')">Q1. 비밀번호를 잊어버렸어요. 어떻게 해야 하나요?</div>
            <div class="faq-answer" id="answer1">
                A1. 로그인 화면에서 "비밀번호 찾기" 버튼을 클릭한 후 이메일 주소를 입력하면 비밀번호 재설정 링크를 받을 수 있습니다.
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer2')">Q2. 이메일 주소를 변경하고 싶어요. 어떻게 하나요?</div>
            <div class="faq-answer" id="answer2">
                A2. 마이페이지에서 "계정 설정" 메뉴로 이동한 후, 이메일 주소를 수정할 수 있습니다. 이메일 인증이 필요할 수 있습니다.
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer3')">Q3. 회원 탈퇴는 어떻게 하나요?</div>
            <div class="faq-answer" id="answer3">
                A3. 마이페이지에서 "회원 탈퇴" 버튼을 클릭하면 탈퇴 신청이 진행됩니다. 탈퇴 시 모든 데이터가 삭제됩니다.
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer4')">Q4. 한 개의 이메일로 여러 계정을 생성할 수 있나요?</div>
            <div class="faq-answer" id="answer4">
                A4. 한 개의 이메일 주소는 한 개의 계정만 등록할 수 있습니다. 추가 계정을 생성하려면 다른 이메일 주소를 사용해야 합니다.
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer5')">Q5. 계정이 잠겼어요. 어떻게 복구하나요?</div>
            <div class="faq-answer" id="answer5">
                A5. 여러 번 비밀번호를 잘못 입력하면 계정이 잠길 수 있습니다. 10분 후 다시 시도하거나 고객센터로 문의하세요.
            </div>
        </div>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
        </div>
    </div>
</body>
</html>
