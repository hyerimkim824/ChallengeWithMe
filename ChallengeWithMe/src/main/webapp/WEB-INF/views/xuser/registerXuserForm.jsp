<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 회원가입</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		let idChecked = 0;
		let nickChecked = 0;
		let emailChecked = 0;
		
		// 아이디 중복체크
		$('#id_check').click(function(){
			if(!/^[A-Za-z0-9]{4,12}$/.test($('#id').val())){
				alert('영문 숫자 포함 4 ~ 12자로 작성해주세요.')
				$('#id').val('').focus()
				return
			}
			
			// 서버 통신
			$.ajax({
				url:'checkDuplicatedId.do',
				type:'post',
				data:{id:$('#id').val()},
				dataType:'json',
				success:function(param){
					if(param.result == 'idNotFound'){
						idChecked = 1
						$('#message_id').css('color', '#000000').text('등록 가능한 ID입니다.')
					}else if(param.result == 'idDuplicated'){
						idChecked = 0
						$('#message_id').css('color', 'red').text('중복된 ID입니다.')
						$('#id').val('').focus()
					}else{
						idChecked = 0
						alert('아이디 중복 체크 오류 발생')
					}
				},
				error:function(){
					idChecked = 0
					alert('네트워크 오류 발생')
				}
			})
		})
			// 닉네임 중복체크
		$('#nick_check').click(function(){
			if(!/^[가-힣A-Za-z0-9]{2,15}$/.test($('#nick').val())){
				alert('한글 영문 숫자 포함 2 ~ 15자로 작성해주세요.')
				$('#nick').val('').focus()
				return
			}
			
			// 서버 통신
			$.ajax({
				url:'checkDuplicatedNick.do',
				type:'post',
				data:{nick:$('#nick').val()},
				dataType:'json',
				success:function(param){
					if(param.result == 'nickNotFound'){
						nickChecked = 1
						$('#message_nick').css('color', '#000000').text('등록 가능한 닉네임입니다.')
					}else if(param.result == 'nickDuplicated'){
						nickChecked = 0
						$('#message_nick').css('color', 'red').text('중복된 닉네임입니다.')
						$('#nick').val('').focus()
					}else{
						nickChecked = 0
						alert('닉네임 중복 체크 오류 발생')
					}
				},
				error:function(){
					nickChecked = 0
					alert('네트워크 오류 발생')
				}
			})
		})
		
		// 이메일 중복체크
		$('#email_check').click(function(){
			// 서버 통신
			$.ajax({
				url:'checkEmail.do',
				type:'post',
				data:{email:$('#email').val()},
				dataType:'json',
				success:function(param){
					if(param.result == 'emailNotFound'){
						emailChecked = 1
						$('#message_email').css('color', '#000000').text('가입 가능한 이메일입니다.')
					}else if(param.result == 'emailDuplicated'){
						emailChecked = 0
						$('#message_email').css('color', 'red').text('이미 가입된 이메일입니다.')
						$('#email').val('').focus()
					}else{
						emailChecked = 0
						alert('이메일 가입 체크 오류 발생')
					}
				},
				error:function(){
					emailChecked = 0
					alert('네트워크 오류 발생')
				}
			})
		})
		
		// 아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
		$('#register_from #id').keydown(function(){
			idChecked = 0
			$('#message_id').text('')
		})
		
		// 닉네임 중복 안내 메시지 초기화 및 닉네임 중복 값 초기화
		$('#register_from #nick').keydown(function(){
			nickChecked = 0
			$('#message_nick').text('')
		})
		
		// 이메일 이미 가입 안내 메시지 초기화 및 이메일 값 초기화
		$('#register_from #email').keydown(function(){
			emailChecked = 0
			$('#message_email').text('')
		})
		
		// 회원 정보 등록 유효성 체크
		$('#register_form').submit(function(){
			const items = document.querySelectorAll('.check')
			for(let i = 0; i < items.length; i++){
				if(items[i].value.trim()==''){
					const label = document.querySelector('label[for="'+items[i].id+'"]')
					alert(label.textContent + ' 필수 입력입니다.')
					items[i].value=''
					items[i].focus()
					return false	
				}
				
				if(items[i].id == 'id' && !/^[A-Za-z0-9]{4,12}$/.test($('#id').val())){
					alert('영문 숫자 포함 4 ~ 12자로 작성해주세요.')
					$('#id').val('').focus()
					return false
				}
				
				if(items[i].id == 'pwd' && !/^[A-Za-z0-9]{8,16}$/.test($('#pwd').val())){
					alert('영문 숫자 포함 8 ~ 16자로 작성해주세요.')
					$('#pwd').val('').focus()
					return false
				}
				
				if(items[i].id == 'nick' && !/^[가-힣A-Za-z0-9]{2,15}$/.test($('#nick').val())){
					alert('한글 영문 숫자 포함 2 ~ 15자로 작성해주세요.')
					$('#nick').val('').focus()
					return false
				}
				if(items[i].id =='id' && idChecked == 0){
					alert('아이디 중복체크 필수입니다.')
					return false
				}
				
				if(items[i].id =='nick' && nickChecked == 0){
					alert('닉네임 중복체크 필수입니다.')
					return false
				}
				
				if(items[i].id == 'name' && !/^[가-힣]{2,10}$/.test($('#name').val())){
					alert('한글만 입력해주세요.')
					$('#name').val('').focus()
					return false
				}
				
				if(items[i].id == 'tel' && !/^[0-9]{11,11}$/.test($('#tel').val())){
					alert('11자리 숫자로만 입력해주세요.')
					$('#tel').val('').focus()
					return false
				}
			}
		})
	})
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
							<div class="form_notice">* 영문 숫자 포함 8 ~ 16자</div>
						</li>
						<li>
							<label for="nick">닉네임</label>
							<input type="text" id="nick" name="nick" maxlength="15" class="check">
							<input type="button" id="nick_check" value="중복체크">
							<span id="message_nick"></span>
							<div class="form_notice">* 한글 영문 숫자 포함 2 ~ 15자</div>
						</li>
						<li>
							<label for="email">이메일</label>
							<input type="email" id="email" name="email" maxlength="50" class="check">
							<input type="button" id="email_check" value="가입체크">
							<span id="message_email"></span>
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
					<div>
						<input type="submit" value="등록">
						<input type="button" value="메인으로"
						onclick="location.href='${ pageContext.request.contextPath }/main/main.do'">
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>