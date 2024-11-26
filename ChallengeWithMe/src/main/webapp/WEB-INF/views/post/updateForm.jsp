<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hj.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//게시판 유효성 체크
		$('#update_form').submit(function(){
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

<div class=writeform-main>
<h4>글 수정하기</h4>
<form id="update_form" action="update.do" method="post" enctype="multipart/form-data">
			<!-- 숨겨진 필드로 post_num 전달 -->
    		<input type="hidden" name="post_num" value="${post.post_num}">


<%-- 프로필 사진 유저닉네임 날짜 좋아요 댓글개수 조회수 표시 --%>
<div>
	<div class="updateform-header">
		<c:if test="${!empty us_img}">
		<img src="${pageContext.request.contextPath}/upload/${us_img}" width="40" height="40" class="my-photo">
		</c:if>
		<c:if test="${empty us_img}">
		<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
		</c:if>
		<span class="updateform-nickname">${us_nickname}</span>
	</div>
		<hr size="1" noshade="noshade" width="100%">
<%-- 제목, 내용 --%>
	<div class="updateform-header">
    	<label for="post_title">제목 입력</label>
    	<input type="text" name= "post_title" id="post_title" value="${post.post_title}" class="input-check">
	</div>
		<hr size="1" noshade="noshade" width="100%">
	<div>
   		<label for="post_content">내용 입력</label>
   		<textarea name= "post_content" id="post_content"  rows="10" cols="75" >${post.post_content}</textarea>
		<hr size="1" noshade="noshade" width="100%">
	</div>
	
<%-- 이미지 첨부--%>
	
   	<label for="post_img">이미지</label>
   	<input type="file" name=post_img id=post_img accept="image/*">
   	<c:if test="${!empty post.post_img}">
   		<div id="update-photo">
   			(${post.post_img})파일이 등록되어있습니다.
   			<img src="${pageContext.request.contextPath}/upload/${post.post_img}" width="100">
   			<input type="button" value="사진 삭제" id="photo_del">
   			<script type="text/javascript">
   				$('#photo_del').click(function(){
   					let choice = confirm('삭제하시겠습니까?');
   					if(choice){
   						//서버와 통신
   						$.ajax({
   							url:'deleteFile.do',
   							type:'post',
   							data:{post_num:${post.post_num}},
   							dataType:'json',
   							success:function(param){
   								if(param.result == 'logout'){
   									alert('로그인 후 이용해주세요.')
   								}else if(param.result == 'success'){
   									$('#update-photo').hide();
   								}else if(param.result =='wrongAccess'){
   									alert('잘못된 접속입니다.')
   								}else{
   									alert('사진 삭제를 실패했습니다.')
   								}
   							},error:function(){
   								alert('네트워크 오류가 발생했습니다.!!')
   							}
   						});
   					};
   				});
   			</script>
   		</div>
   	</c:if>
   		
   		
   		
   		
	
</div>
	<div>
		<button type="submit" id="submit-btn">글 등록</button>
		<button type="button" id="cancle-btn" onclick="location.href='list.do'">취소</button>
	</div>
</form>
</div>

</body>
</html>

