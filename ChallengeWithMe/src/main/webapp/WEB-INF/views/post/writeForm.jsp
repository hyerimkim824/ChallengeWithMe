<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/hj.css" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		//게시판 유효성 체크
		$('#post_form').submit(
				function() {
					const items = document.querySelectorAll('.input-check');
					for (let i = 0; i < items.length; i++) {
						if (items[i].value.trim() == '') {
							const label = document.querySelector('label[for="'
									+ items[i].id + '"]');
							alert(label.textContent + ' 필수');
							items[i].value = '';
							items[i].focus();
							return false;
						}
					}//end of for		
				});//end of submit
	});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class=writeform-background>
		<h4 class="writeform-title">여러분의 이야기를 공유해주세요. 📝</h4>
		<form id="post_form" action="write.do" method="post"
			enctype="multipart/form-data">
			<%-- 프로필 사진 유저닉네임 날짜 좋아요 댓글개수 조회수 표시 --%>
			<div class="writeform-main">
				<div class="writeform-header">
					<c:if test="${!empty us_img}">
						<img src="${pageContext.request.contextPath}/upload/${us_img}"
							width="40" height="40" class="my-photo">
					</c:if>
					<c:if test="${empty us_img}">
						<img src="${pageContext.request.contextPath}/images/face.png"
							width="40" height="40" class="my-photo">
					</c:if>
					<span class="writeform-nickname">${us_nickname}</span>
				</div>
				<hr class="custom-hr" noshade="noshade" width="100%">
				<%-- 제목, 내용 --%>
				<div class="writeform-header2">
					<label for="post_title">제목 :</label> <input type="text"
						id="post_title" name="post_title" placeholder="제목을 입력하세요"
						class="input-check">
				</div>
				<hr class="custom-hr" noshade="noshade" width="100%">
				<div>
					<textarea id="post_content" name="post_content" rows="10" cols="75"
						placeholder="내용을 입력하세요" class="input-check"></textarea>
				</div>
			</div>
			
			
				<%-- 이미지 첨부--%>
				<div class="writeform-main2">
					<label for="post_img"></label> 
					<input type="file"
						id="post_img" name="post_img"
						accept="image/gif,image/png,image/jpeg">
						
				</div>
			
			<div class="submit-button">
				<button type="submit" id="submit-btn">작성 완료</button>
				<button type="button" id="cancel-btn"
					onclick="location.href='list.do'">취소</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

