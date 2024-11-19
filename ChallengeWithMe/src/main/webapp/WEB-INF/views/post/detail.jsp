<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="detail-top-nickname">
	<h4>${post.us_nickname} 님의 글</h4>
	<div class="detail-header">
		<span class="post-detail-img">${post.us_img}</span> 
		<span class="post-detail-nickname">${post.us_nickname}</span> 
		<span class="post-detail-date">
			<li>
				<c:if test="${!empty post.post_modifydate}">
				최근 수정일 : ${post.post_modifydate}
				</c:if>
				
				작성일 : ${post.post_date}
				<%-- 로그인한 유저번호와 작성자 유저번호 일치하면 수정,삭제 가능 --%>
				<c:if test="${us_num == post.us_num}">
				<input type="button" value="수정" onclick="location.href='updateForm.do?post_num=${post.post_num}'">
				<input type="button" value="삭제" id="delete_btn">
				<script type="text/javascript">
					const delete_btn = document.getElementById('delete_btn');
					//이벤트 연결
					delete_btn.onclick=function(){
						let choice = confirm('삭제하시겠습니까?');
						if(choice){location.replace('delete.do?post_num=${post.post_num}');
						}
					};
				</script>
				</c:if>
			</li>
		</span>
		<span class="post-detail-like">좋아요 + </span>
		<span class="post-detail-like">댓글 : 개</span>
		<span class="post-detail-view">조회수 : ${post.post_view}</span>
	</div>
	
	<div>
		<h5>${post.post_title}</h5>
	</div>
	
	<div>
		<c:if test="${!empty post.post_img}">
		<img src="${pageContext.request.contextPath}/upload/${post.post_img}" width="40" height="40" class="my-photo">
		</c:if>
		<c:if test="${empty post.post_img}">
		<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
		</c:if>
	</div>
	
	<div>
		${post.post_content}
	</div>
	
	<div class="post-detail">
	<span><a href="">글 수정</a></span>
	<span><a href="">글 삭제</a></span>
	<span><a href="list.do">글 목록</a></span>
	<span><a href="고객센터 링크">신고하기</a></span>
	</div>
	
	<%-- 댓글 시작 --%>
	<div id="reply">
		<span class="post-reply">댓글 작성</span>
		
	
	</div>





</div>
</body>
</html>