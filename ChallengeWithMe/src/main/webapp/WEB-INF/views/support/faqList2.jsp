<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 및 계정 FAQ</title>
    <style>
        /* 🌟 스타일 시작 🌟 */

h1, h2 {
	margin: 0;
	padding: 10px;
	color: #333;
}
h2{
	margin-bottom: 30px;
	margin-left: 15px;
}
/* 헤더 */
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

.container{
	display: flex;
	flex-direction: row;
}

/* 사이드바 */
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





        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fffde7;
        }
        .container2 {
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
            border-bottom: 2px solid #4CAF50;
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
            background-color: rgba(76, 200, 80, 0.5); /* #4CAF50 with 50% opacity */
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
            background-color: #4CAF50;
            color: #fff;
            border: 1px solid #4CAF50;
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

	<!-- 🐤 헤더 -->
	<div class="header">
		<h1>고객센터</h1>
		<div class="search-bar">
		
			<input type="text" placeholder="자주 묻는 질문 검색">
			
			<button>검색</button>
		</div>
	</div>

	<div class="nav">
		<a href="${pageContext.request.contextPath}/support/List.do">문의 내역</a>
		<a href="${pageContext.request.contextPath}/support/FaqList.do">자주
			묻는 질문</a> <a
			href="${pageContext.request.contextPath}/support/FeedBackList.do">고객의
			소리</a>
	</div>

	<div class="container">
		<div class="sidebar">
			<a href="${pageContext.request.contextPath}/support/FaqList.do">자주
				묻는 질문</a> <a
				href="${pageContext.request.contextPath}/support/LoginaAcount.do">로그인
				및 계정</a> <a
				href="${pageContext.request.contextPath}/support/RefundGuide.do">결제
				및 환불</a> <a
				href="${pageContext.request.contextPath}/support/ChallengeHelp.do">꼬박꼬박
				챌린지</a> <a
				href="${pageContext.request.contextPath}/support/CommunityHelp.do">꼬박꼬박
				커뮤니티</a>
		</div>
</head>
<body>
    <div class="container2">
        <!-- 🌟 헤더 🌟 -->
        <div class="faq-header">자주 묻는 질문 FAQ ✨</div>

        <!-- 🌟 FAQ 리스트 🌟 -->
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer1')">🐥 Q1. 참가비 및 상금 환급 프로세스</div>
            <div class="faq-answer" id="answer1">
                A1. 꼬박꼬박에서 참가비와 상금을 환급받는 프로세스는 다음과 같습니다. <br>
                 1️챌린지 결과 확인 
                 *챌린지는 종료 다음날(낮 12시:30분 기준) 결과를 발표합니다.<br>
                 (예외적으로 종료+2일에 결과를 발표하는 챌린지가 존재하며, 진행 중인 챌린지의 발표일은<br>
                 상세페이지에서 확인 가능)
                 
                 * 결과 확인 즉시, 참가비가 상금으로 환급됩니다.<br>
                 *85%이상 달성 시 전액 환급, 85% 미만 달성 시 달성률 만큼 환급됩니다.<br> ex) 10,000 참가비로 80% 달성 시, 8000원 환급
              
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer2')">🐤 Q2. 불가피한 사정으로 챌린지 진행이 어려워요 </div>
            <div class="faq-answer" id="answer2">
                A2. 마이페이지 > 계정 설정에서 이메일 주소를 수정할 수 있어요! 인증 메일 확인을 꼭 해주세요. 📧
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer3')">🐣 Q3. 챌린지 취소가 왜 안되나요?</div>
            <div class="faq-answer" id="answer3">
                A3. 마이페이지 하단의 <strong>"회원 탈퇴"</strong> 버튼을 클릭하시면 탈퇴 절차가 진행됩니다. 😢 탈퇴 시 데이터는 삭제되니 신중히 결정해주세요.
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer4')">🐤 Q4. 혼자 개설해도 진행이 될까요?</div>
            <div class="faq-answer" id="answer4">
                A4. 한 개의 이메일 주소는 한 계정만 가능해요! 다른 이메일로 추가 계정을 만들어 보세요. 💌
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer5')">💛 Q5. 예치금과 상금은 소멸되나요? 유효기간이 있나요?</div>
            <div class="faq-answer" id="answer5">
                A5. 여러 번 비밀번호를 잘못 입력하면 계정이 잠길 수 있어요. 10분 후 다시 시도하거나 고객센터에 문의해주세요. 🛠️
            </div>
        </div>
         <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer6')">🌼 Q6. 챌린지를 완료했는데 환급은 언제되나요? </div>
            <div class="faq-answer" id="answer6">
                A6. 네, 변경가능합니다. 닉네임은 마이페이지 > <strong>"닉네임 변경"</strong> 버튼을 통해 변경할 수 있습니다. 🛠️
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer7')">⭐️ Q7. 인증 패스는 무엇인가요? </div>
            <div class="faq-answer" id="answer7">
                A7. 꼬박꼬박은 회원님들에게 공정한 환경에서 목표를 달성할 수 있는 서비스를 제공합니다. 이를 위해 본인 확인 및 중복 회원가입을 막고자 휴대폰 번호를 확인하고 있습니다. 📞️
            </div>
        </div>
         <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer8')">🌝 Q8. 지난 챌린지에서 지불했던 벌금을 다시 받을 수 있나요? </div>
            <div class="faq-answer" id="answer8">
                A8.네, 사용 가능 합니다. 휴대폰 번호는 마이페이지 > <strong>"번호 변경"</strong> 버튼을 통해 변경할 수 있습니다. 🥸
            </div>
        </div>
           <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer9')">🧀 Q9. 계좌이체 시 수수료가 있나요? </div>
            <div class="faq-answer" id="answer9">
                A9. 마이페이지 > <strong>"회원탈퇴"</strong> 버튼을 통해 탈퇴가 가능합니다. 탈퇴 시 3개월간 재가입이 불가능한 점 유의해 주시기 바랍니다.<br>
                회원 탈퇴의 사유를 남겨주시면, 말씀해 주신 의견을 바탕으로 더 나은 서비스를 만들도록 노력하겠습니다. 🙏 
            </div>
        </div>
         <div class="faq-item">
            <div class="faq-question" onclick="toggleAnswer('answer10')">🐥 Q10. 개설한 챌린지 내용을 변경하고 싶어요. </div>
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
