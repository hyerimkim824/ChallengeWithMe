<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//게시판 유효성 체크
		$('#write_form').submit(function(){
			const items = document.querySelectorAll('.input-check');
			for(let i=0;i<items.length;i++){
				if(items[i].value.trim()==''){
					const label = document.querySelector(
							       'label[for="'+items[i].id+'"]');
					alert(label.textContent + ' 필수 입력');
					items[i].value='';
					items[i].focus();
					return false;
				}			
			}//end of for		
		});//end of submit
	});
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div>
<h4>${post.us }</h4>
<%-- 프로필 사진 유저닉네임 날짜 좋아요 댓글개수 조회수 표시 --%>
<div class="writeform-header">
	
	


</div>

<%-- 제목 --%>
<div class="writeform-header">
	
	


</div>

<%-- 프로필 사진 유저닉네임 날짜 좋아요 댓글개수 조회수 표시 --%>
<div class="writeform-header">
	
	


</div>



</div>
</body>
</html>




















