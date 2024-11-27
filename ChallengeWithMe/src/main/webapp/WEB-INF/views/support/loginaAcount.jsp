<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 및 계정 FAQ</title>
    <style>
        /* 🌟 스타일 시작 🌟 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fffde7;
        }
        .container {
            width: 70%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 25px;
        }
        .faq-header {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            border-bottom: 2px solid #ffcc00;
            padding-bottom: 15px;
            margin-bottom: 30px;
            text-align: center;
        }
        .faq-item {
            margin-bottom: 25px;
        }
        .faq-question {
            font-size: 20px;
            font-weight: bold;
            color: #555;
            cursor: pointer;
            background-color: #fff9c4;
            padding: 10px;
            border-radius: 5px;
        }
        .faq-answer {
            font-size: 16px;
            color: #666;
            margin-top: 10px;
            background-color: #fffbde;
            padding: 10px;
            border-left: 4px solid #ffcc00;
            display: none;
            border-radius: 5px;
        }
        .faq-question:hover {
            color: #ff9900;
            background-color: #fff3b0;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            text-decoration: none;
            color: #333;
            padding: 8px 15px;
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
        // 🐥 질문 클릭 시 답변 토글 스크립트 🐥
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
        <!-- 🌟 헤더 🌟 -->
        <div class="faq-header">로그인 및 계정 FAQ ✨</div>

        <!-- 🌟 FAQ 리스트 🌟 -->
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer1')">🐥 Q1. 비밀번호를 잊어버렸어요. 어떻게 해야 하나요?</div>
            <div class="faq-answer" id="answer1">
                A1. 로그인 화면에서 <strong>"비밀번호 찾기"</strong>를 클릭하세요! 이메일 주소를 입력하면 비밀번호 재설정 링크를 받을 수 있답니다. 💌
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer2')">🐤 Q2. 이메일 주소를 변경하고 싶어요!</div>
            <div class="faq-answer" id="answer2">
                A2. 마이페이지 > 계정 설정에서 이메일 주소를 수정할 수 있어요! 인증 메일 확인을 꼭 해주세요. 📧
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer3')">🐣 Q3. 회원 탈퇴는 어떻게 하나요?</div>
            <div class="faq-answer" id="answer3">
                A3. 마이페이지 하단의 <strong>"회원 탈퇴"</strong> 버튼을 클릭하시면 탈퇴 절차가 진행됩니다. 😢 탈퇴 시 데이터는 삭제되니 신중히 결정해주세요.
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer4')">🐤 Q4. 이메일 한 개로 여러 계정을 만들 수 있나요?</div>
            <div class="faq-answer" id="answer4">
                A4. 한 개의 이메일 주소는 한 계정만 가능해요! 다른 이메일로 추가 계정을 만들어 보세요. 💌
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer5')">💛 Q5. 계정이 잠겼어요. 어떻게 복구하나요?</div>
            <div class="faq-answer" id="answer5">
                A5. 여러 번 비밀번호를 잘못 입력하면 계정이 잠길 수 있어요. 10분 후 다시 시도하거나 고객센터에 문의해주세요. 🛠️
            </div>
        </div>
         <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer6')">🌼 Q6. 닉네임은 변경 가능한가요? </div>
            <div class="faq-answer" id="answer6">
                A6. 네, 변경가능합니다. 닉네임은 마이페이지 > <strong>"닉네임 변경"</strong> 버튼을 통해 변경할 수 있습니다. 🛠️
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer7')">⭐️ Q7. 꼬박꼬박은 왜 가입시 핸드폰 번호 확인을 요구하나요? </div>
            <div class="faq-answer" id="answer7">
                A7. 꼬박꼬박은 회원님들에게 공정한 환경에서 목표를 달성할 수 있는 서비스를 제공합니다. 이를 위해 본인 확인 및 중복 회원가입을 막고자 휴대폰 번호를 확인하고 있습니다. 📞️
            </div>
        </div>
         <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer8')">🌝 Q8. 핸드폰을 바꿔도 동일한 계정을 사용할 수 있나요? </div>
            <div class="faq-answer" id="answer8">
                A8.네, 사용 가능 합니다. 휴대폰 번호는 마이페이지 > <strong>"번호 변경"</strong> 버튼을 통해 변경할 수 있습니다. 🥸
            </div>
        </div>
           <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer9')">🧀 Q9. 탈퇴는 어디서 하나요? </div>
            <div class="faq-answer" id="answer9">
                A9. 마이페이지 > <strong>"회원탈퇴"</strong> 버튼을 통해 탈퇴가 가능합니다. 탈퇴 시 3개월간 재가입이 불가능한 점 유의해 주시기 바랍니다.<br>
                회원 탈퇴의 사유를 남겨주시면, 말씀해 주신 의견을 바탕으로 더 나은 서비스를 만들도록 노력하겠습니다. 🙏 
            </div>
        </div>
         <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer10')">🐥 Q10. 비밀번호를 변경하고 싶어요. </div>
            <div class="faq-answer" id="answer10">
                A10. 마이페이지 > <strong>"비밀번호 변경"</strong> 버튼을 통해 비밀번호를 변경할 수 있습니다. 😉
             
            </div>
        </div>

        <!-- 🌟 페이지네이션 🌟 -->
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="#" >2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            
        </div>
    </div>
</body>
</html>
