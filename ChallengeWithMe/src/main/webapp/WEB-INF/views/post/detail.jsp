<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hj.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="detail-background">
	<h4>${post.us_nickname} 님의 글</h4>
	<div class="detail-main">
		
		<div class="detail-header">
		<ul>
			<li class="post-detail-img">
				<c:if test="${!empty post.us_img}">
				<img src="${pageContext.request.contextPath}/upload/${post.us_img}" width="40" height="40" class="my-photo">
				</c:if>
				<c:if test="${empty post.us_img}">
				<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
				</c:if>
			</li> 
			<li class="post-detail-nickname">${post.us_nickname}</li> 
			<li class="post-detail-date">
				<c:if test="${!empty post.post_modifydate}">
				최근 수정일 : ${post.post_modifydate}
				</c:if>
				작성일 : ${post.post_date}
			</li>
		
			<%-- 댓글 갯수 --%>
			
			<%-- 조회수 --%>
			<li class="post-view">${post.post_view}</li>
		</ul>
		</div>
			<hr size="1" noshade="noshade" width="100%">
		
	
	<div>
		<h4>${post.post_title}</h4>
	</div>

	<div>
		<hr size="1" noshade="noshade" width="100%">
		<c:if test="${!empty post.post_img}">
		<div class="content">
			<img src="${pageContext.request.contextPath}/upload/${post.post_img}" class="detail-photo">
		</div>
		</c:if>
		<hr size="1" noshade="noshade" width="100%">
		<p>${post.post_content}</p>
		<hr size="1" noshade="noshade" width="100%">
	</div>
	
	<div class="post-detail">
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
		<c:if test="${us_num != post.us_num}">${post.us_num}</c:if>
		
			<input type="button" value="글 목록" onclick="location.href='list.do'">
			<input type="button" value="고객의소리" onclick="support/FeedBackForm.do">
			<hr size="1" noshade="noshade" width="100%">
	</div>
	
	<%-- 댓글 시작 --%>
		<div id="post-reply">
			<span class="reply">댓글 작성</span>
			<form id="re_form">
				<input type="button" name="post_num" value="${post.post_num}" id="post_num">
				<textarea rows="3" cols="50" name="re_content" id="re_content" class="rep-content"
				<c:if test="${empty us_num}">disabled="disabled"</c:if>>
				<c:if test="${empty us_num}">댓글 작성은 로그인 후 가능합니다.</c:if></textarea>
				<c:if test="${!empty us_num}"><div id="re_first"><span class="letter-count"></span>
				</div>
				<div id="re_second" class="align-right">
					<input type="submit" value="댓글등록">
				</div>
				</c:if>
			</form>
		</div>
	<%-- 댓글 시작 --%>
		<div id="output"></div>
		<div class="paging-button" style="display:none;">
			<input type="button" value="다음글 보기">
		</div>
		<div id="loading" style="display:none;">
			<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40">
		</div>
	</div>
</div>
</body>
</html>



