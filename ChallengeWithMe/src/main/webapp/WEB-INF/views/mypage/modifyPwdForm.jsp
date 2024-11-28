<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/infomodify.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 비밀번호 수정 유효성 체크
		$('#register_form2').submit(function(e){
			const items = document.querySelectorAll('.check')
			for(let i = 0; i < items.length; i++){
				if(items[i].value.trim()==''){
					const placeholder =  items[i].getAttribute('placeholder')
					alert(placeholder + ' 을(를) 입력해주세요.')
					items[i].value=''
					items[i].focus()
					return false
				}
			}
			
			if($('#cpwd').val()!=$('#ccpwd').val()){
				alert('새비밀번호와 새비밀번호 확인이 불일치합니다.')
				$('#ccpwd').val('').focus()
				return false
			}
		})
		})
</script>
</head>
<body>
	<h2>${ xuser.nickname }님 비밀번호 변경</h2>
	<div class="container-wrapper">
		<div class="container2" id="container2">
			<div class="form-container2" id="detail-container">
			    <form id="register_form2" action="${ pageContext.request.contextPath }/mypage/modifyPwd.do" method="post">
			      <h1>비밀번호 변경</h1>
			      <label for=id></label>
			      <input placeholder="아이디" type="text" name="id" id="id" maxlength="12" class="check">
			      <label for=pwd></label>
			      <input placeholder="현재 비밀번호" type="password" name="pwd" id="pwd" maxlength="16" class="check">
			      <label for=cpwd></label>
			      <input placeholder="새 비밀번호" type="password" name="cpwd" id="cpwd" maxlength="16" class="check">
			      <label for=ccpwd></label>
			      <input placeholder="새 비밀번호 확인" type="password" name="ccpwd" id="ccpwd" maxlength="16" class="check">
			      <span id="msg"></span>
			      <input type="submit" value="비밀번호 변경">
			      <input class="main" type="button" value="마이페이지"
			      onclick="location.href='${ pageContext.request.contextPath }/mypage/mypage.do'">
			    </form>
			 </div>
		</div>
	</div>
</body>
</html>