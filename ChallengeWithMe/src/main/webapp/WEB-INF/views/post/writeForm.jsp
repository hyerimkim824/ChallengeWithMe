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
		$('#post_form').submit(function(){
			const items = document.querySelectorAll('.input-check');
			for(let i=0;i<items.length;i++){
				if(items[i].value.trim()==''){
					const label = document.querySelector(
							       'label[for="'+items[i].id+'"]');
					alert(label.textContent + ' 필수');
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
<h4>꼬박꼬박 커뮤니티</h4>
<form id="post_form" action="write.do" method="post" enctype="multipart/form-data">
<%-- 프로필 사진 유저닉네임 날짜 좋아요 댓글개수 조회수 표시 --%>
<div>
	<div class="writeform-header">
		<span class="post-write-us_img">${post.us_img}</span> 
		<span class="post-write-us_nickname">${post.us_nickname}</span> 
	</div>

<%-- 제목, 내용 --%>
	<div class="writeform-header">
    	<label for="post_title">제목 입력</label>
    	<input type="text" id="post_title" name= "post_title" placeholder="제목을 입력하세요" class="input-check">
	</div>
	<div>
   		<label for="post_content">내용 입력</label>
   		<textarea id="post_content" name= "post_content" rows="10" cols="75" placeholder="내용을 입력하세요" class="input-check"></textarea>
	</div>
	
<%-- 이미지 첨부--%>
	<div>
   		<label for="post_img">이미지 첨부</label>
   		<input type="file" id="post_img" name="post_img" accept="image/gif,image/png,image/jpeg">
		<button type="button">파일 전송</button>
	</div>
</div>
	<div>
		<button type="submit" id="submit-btn">글 등록</button>
		<button type="button" id="cancle-btn" onclick="location.href='list.do'">취소</button>
	</div>
</form>
</div>

</body>
</html>




















