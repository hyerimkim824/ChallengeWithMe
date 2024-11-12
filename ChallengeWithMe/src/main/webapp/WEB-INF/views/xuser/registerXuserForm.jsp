<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 회원가입</title>
</head>
<body>
	<div>
		<div>
			<h2>회원가입</h2>
			<form id="register_form" action="registerXuser.do" method="post">
				<div>
					<ul>
						<li>
							<label for="id">아이디</label>
							<input type="text" id="id" name="id" maxlength="12" autocomplete="off" class="check">
							<input type="button" id="id_check" value="중복체크">
							<span id="message_id"></span>
							<div class="form_notice">* 영문 숫자 포함 4 ~ 12자</div>
						</li>
						<li>
							<label for="pwd">비밀번호</label>
							<input type="password" id="pwd" name="pwd" maxlength="16" class="check">
						</li>
						<li>
							<label for="nick">닉네임</label>
							<input type="text" id="nick" name="nick" maxlength="15" class="check">
							<input type="button" id="nick_check" value="중복체크">
							<span id="message_id"></span>
							<div class="form_notice">* 한글 영문 숫자 포함 2 ~ 10자</div>
						</li>
						<li>
							<label for="email">이메일</label>
							<input type="email" id="email" name="email" maxlength="50" class="check">
						</li>
						<li>
							<label for="name">이름</label>
							<input type="text" id="name" name="name" maxlength="6" class="check">
						</li>
						<li>
							<label for="gender">성별</label>
							<input type="button" id="men" name="men" class="check" value="남">
							<input type="button" id="women" name="women" class="check" value="여">
						</li>
						<li>
							<label for="birth">생년월일</label>
							<input type="date" id="birth" name="birth" class="check">
						</li>
						<li>
							<label for="tel">전화번호</label>
							<input type="text" id="tel" name="tel" maxlength="11" class="check">
							<span id="message_id"></span>
							<div class="form_notice">* "-" 제외한 번호 11개 입력</div>
						</li>
					</ul>
					
				</div>
			</form>
		</div>
	</div>
</body>
</html>