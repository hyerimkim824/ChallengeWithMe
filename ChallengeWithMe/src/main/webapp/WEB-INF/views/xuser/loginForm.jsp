<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#login_form').submit(function(){
			if($('#id').val().trim()==''){
				alert('아이디를 입력하세요!')
				$('#id').val('').focus()
				return false
			}
			if($('#pwd').val().trim()==''){
				alert('비밀번호를 입력하세요!')
				$('#pwd').val('').focus()
				return false
			}
		})
	})
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div>
		<div>
			<h2>로그인</h2>
			<form id="login_form" action="login.do" method="post">
				<ul>
					<li>
						<input type="text" placeholder="아이디" name="id" id="id" maxlength="12" autocomplete="off">
					</li>		
					<li>
						<input type="password" placeholder="비밀번호" name="pwd" id="pwd" maxlength="12" autocomplete="off">
					</li>		
				</ul>
				<div>
					<input type="submit" value="로그인">
					<input type="button" value="메인으로" 
					onclick="location.href='${ pageContext.request.contextPath }/main/main.do'">
				</div>		
			</form>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>