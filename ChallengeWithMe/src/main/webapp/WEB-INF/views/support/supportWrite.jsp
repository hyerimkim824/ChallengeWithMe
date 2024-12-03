<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 작성</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fcfcfc;
}

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

.container {
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
	 font-size: 18px;
	
}

input {
	width: 50%;
	padding: 0px;
	margin-top: 5px;
	border:none;
	border-radius: 5px;
	box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
}


/* 폼 앞에 공간을 두기 위한 스타일 */
form {
    margin-left: 26px; /* 상단에 40px 여백을 추가 */
}
.form-control{
	width: 53%;
	padding: 10px;
	margin-top: 5px;
	border:none;
	border-radius: 5px;
	
	
}
 textarea {
	width: 55%;
	padding: 0px;
	margin-top: 0px;
	border:none;
	border-radius: 5px;
	box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
	height: 220px;
	
}
 select {
	width: 20%;
	padding: 10px;
	margin-top: 5px;
	border:none;
	border-radius: 5px;
	box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
}
.condition{
width: 25%;
	padding: 10px;
	margin-top: 5px;
	border:none;
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
/* 푸터 */
.footer {
	clear: both;
	text-align: center;
	padding: 10px 0;
	background-color: #fdd835;
}

.footer a {
	text-decoration: none;
	color: #333;
	padding: 5px 10px;
}

.footer a:hover {
	text-decoration: underline;
}
  
        .form-row {
            display: flex;
            justify-content: space-between;
            gap: 10px; /* 공간을 주기 위해 gap을 추가 */
        }

        .form-row .form-group {
            flex: 1; /* 각 항목이 동일한 비율로 차지 */
        }
        
/* 문의 유형 label과 select의 높이를 맞추기 위한 CSS */
.form-row2 {
    display: flex;
    align-items: center; /* 세로로 중앙 정렬 */
    gap: 95px; /* 공간을 주기 위해 gap을 추가 */
margin-bottom:5%;
}

.form-row2 label,
.form-row2 select 
{
    height: 40px;  /* 동일한 높이로 설정 */
    display: flex;
    align-items: center;  /* 텍스트를 세로로 중앙 정렬 */
}

.form-row2 select {
    width: 20%;
    padding: 0 10px; /* 좌우 패딩만 설정, 위아래는 0으로 */
    border: none;
    border-radius: 5px;
    box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
}

.form-row2 label {
    font-weight: bold;
    margin: 0; /* 여백 없애기 */
}

/* 문의 유형 label과 select의 높이를 맞추기 위한 CSS */
.form-row3 {
    display: flex;
    align-items: center; /* 세로로 중앙 정렬 */
    gap: 95px; /* 공간을 주기 위해 gap을 추가 */
    margin-bottom:5%;
}

.form-row3 label,
.form-row3 input 
{
    height: 40px;  /* 동일한 높이로 설정 */
    display: flex;
    align-items: center;  /* 텍스트를 세로로 중앙 정렬 */
}

.form-row3 input {
width: 55%
}

/* 문의 내용 label과 textarea의 높이를 맞추기 위한 CSS */
.form-row4 {
    display: flex;
    gap: 95px; /* 공간을 주기 위해 gap을 추가 */
    margin-bottom:5%;
}

/* 문의 첨부파일 label과 input의 높이를 맞추기 위한 CSS */
.form-row5 {
    display: flex;
    gap: 48px; /* 공간을 주기 위해 gap을 추가 */
    margin-bottom:5%;
}
/* 문의 상태 label과 select의 높이를 맞추기 위한 CSS */
.form-row6 {
    display: flex;
    gap: 95px; /* 공간을 주기 위해 gap을 추가 */
}
.form-row6 label,
.form-row6 select 
{
    height: 40px;  /* 동일한 높이로 설정 */
    display: flex;
    align-items: center;  /* 텍스트를 세로로 중앙 정렬 */
}
/* 문의 비밀번호 label과 input의 높이를 맞추기 위한 CSS */
.form-row7 {
    display: flex;
    gap: 40px; /* 공간을 주기 위해 gap을 추가 */
     margin-left: -61px; 
}
.form-row7 label {
   font-size: 16px;
   margin-top: 8px; /* 비밀번호 label을 조금 더 위로 올려줬어요 */
}

.form-row7 input{
   width:25%;
}
    /* 푸터 */
        .footer {
            clear: both;
            text-align: center;
            padding: 10px 0;
            background-color: #fdd835;
             margin-top: auto; /* 자동으로 콘텐츠 아래로 푸터를 밀어냄 */
        }

        .footer a {
            text-decoration: none;
            color: #333;
            padding: 5px 10px;
        }

        .footer a:hover {
            text-decoration: none;
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

	<!-- 🐤 헤더 -->
<div class="header">
    <h1>고객센터</h1>
    <div class="search-bar">
        <form action="Search.do" method="get" style="display: flex; align-items: center;">
            <!-- 검색어 입력 -->
            <input type="text" name="keyword" placeholder="자주 묻는 질문 검색" style="flex: 1; padding: 5px; border: 1px solid #ccc; border-radius: 5px;" required>
            <!-- 검색 버튼 -->
            <button type="submit" style="padding: 5px 10px; background-color: #fdd835; border: none; cursor: pointer; border-radius: 5px; margin-left: 10px;">검색</button>
        </form>
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
		<div class="content">
			<h2>1:1 문의</h2>
			<form action="SupportWrite.do" method="post"
				enctype="multipart/form-data">
				<div class="form-group">
				<div class="form-row2">
					<label for="type">문의 유형</label>
					 <select id="type" name="type">
						<option value="1">로그인 및 계정</option>
						<option value="2">결제 및 환불</option>
						<option value="3">챌린지 방식/인증 규정</option>
						<option value="4">참가비/환급/상금</option>
						<option value="5">인증패스/레드카드</option>
						<option value="6">회원가입 및 탈퇴</option>
						<option value="7">주제제안</option>
						<option value="8">챌린지</option>
						<option value="9">기능/오류</option>
						<option value="10">광고</option>
						<option value="11">기타</option>
					</select>
					</div>
				</div>
				
				
				
				<div class="form-group">
		<div class="form-row3">
					<label for="title">문의 제목</label>
					 <input type="text" id="title"name="title" >
				</div>
			</div>
				<div class="form-group">
				<div class="form-row4">
					<label for="content">문의 내용</label>
					<textarea id="content" name="content" rows="5"></textarea>
				</div>
				</div>
				<div class="form-group">
				<div class="form-row5">
					<label for="sup_img" class="form-label">파일 첨부 (선택)</label> <input
						type="file" id="sup_img" name="sup_img" class="form-control">
				</div>
				</div>
						<div class="form-row">
				<div class="form-group">
				<div class="form-row6">
					<label for="visibility">문의 상태</label> <select class="condition" id="visibility"
						name="visibility" onchange="togglePasswordField()">
						<option value="1">비공개</option>
						<option value="2">공개</option>
					</select>
					</div>
				</div>
								
				<!-- 비공개 비밀번호 -->
				<div class="form-group" id="sup_pwd">
				<div class="form-row7">
					<label for="sup_pwd_input" class="form-label">비밀번호 <br>
					 (숫자4자리)</label>
					  <input type="password" id="sup_pwd_input" name="sup_pwd"
						class="form-control" placeholder="비밀번호를 입력해주세요" maxlength="4">
				</div>
				</div>
						</div>
				<div class="button" style="text-align: right; margin: 20px 28%">
					<button type="submit">문의 등록</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 푸터 -->
    <div class="footer">
        <a href="ChallengeHelp.do">챌린지 안내</a> |
        <a href="SupportWrite.do">1:1 문의</a> |
        <a href="<%= request.getContextPath() %>/mypage/mypage.do">마이페이지</a> |
        <a href="NoticeList.do">공지사항</a>
    </div>
</body>
</html> 