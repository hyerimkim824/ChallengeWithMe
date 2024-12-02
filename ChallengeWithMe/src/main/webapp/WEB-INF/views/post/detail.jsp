<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/hj.css" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/post.like.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/post.reply.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="detail-background">
		<div class=header>
			<h4 class=nickname>
				도전을 멈추지 않는<br> <span class="highlight-nickname">${post.us_nickname}
					님</span>의 이야기
			</h4>
			<%-- 좋아요 이미지 -> post.like.js로 연결--%>
			<span class="like"> <img id="output_like"
				data-num="${post.post_num}"
				src="${pageContext.request.contextPath}/images/hj_heart.png"
				width="17" height="17">
			</span>
		</div>

		<div class="detail-main">
			<div class="detail-header">
				<ul class="user-info">
					<li class="post-detail-img"><c:if test="${!empty post.us_img}">
							<img
								src="${pageContext.request.contextPath}/upload/${post.us_img}"
								width="40" height="40" class="my-photo">
						</c:if> <c:if test="${empty post.us_img}">
							<img src="${pageContext.request.contextPath}/images/face.png"
								width="40" height="40" class="my-photo">
						</c:if></li>
					<li class="post-detail-nickname">${post.us_nickname}님</li>
				</ul>

				<ul class="like-reply-view">
					<%--detail.do화면상 좋아요 개수 --%>
					<li id="likecount"><img
						src="${pageContext.request.contextPath}/images/heart.png"
						width="13" height="13" class="likecount"> <span
						id="output_likecount"></span></li>
					<%-- 댓글 갯수 --%>
					<li class="post-replyCount"><img
						src="${pageContext.request.contextPath}/images/comment.png"
						width="13" height="13"> ${comm_count}</li>
					<%-- 조회수 --%>
					<li class="post-view"><img
						src="${pageContext.request.contextPath}/images/eye.svg" width="14"
						height="14"> <c:if test="${!empty post.post_view}">
				${post.post_view}
				</c:if> <c:if test="${empty post.post_view}">
				0
				</c:if></li>
				</ul>
			</div>
			<div class=user-info2>
				<c:if test="${!empty post.post_modifydate}">
			최근 업데이트 : <fmt:formatDate value="${post.post_modifydate}"
						pattern="yyyy-MM-dd HH시 mm분" />
				</c:if>
				<c:if test="${empty post.post_modifydate}">
			등록일 : <fmt:formatDate value="${post.post_date}"
						pattern="yyyy-MM-dd HH시 mm분" />
				</c:if>
			</div>
			<hr class="custom-hr" noshade="noshade" width="100%">
			<div class="post-title">제목 : ${post.post_title}</div>

			<div>
				<hr class="custom-hr" noshade="noshade" width="100%">
				<c:if test="${!empty post.post_img}">
					<div class="img-content">
						<img
							src="${pageContext.request.contextPath}/upload/${post.post_img}"
							class="detail-photo">
					</div>
				</c:if>

				<p class="content">${post.post_content}</p>
				<hr class="custom-hr" noshade="noshade" width="100%">
			</div>

			<div class="post-detail">
				<%-- 로그인한 유저번호와 작성자 유저번호 일치하면 수정,삭제 가능 --%>
				<c:if test="${us_num == post.us_num}">
					<input type="button" value="글 수정"
						onclick="location.href='updateForm.do?post_num=${post.post_num}'">
					<input type="button" value="글 삭제" id="delete_btn">
					<script type="text/javascript">
						const delete_btn = document
								.getElementById('delete_btn');
						//이벤트 연결
						delete_btn.onclick = function() {
							let choice = confirm('삭제하시겠습니까?');
							if (choice) {
								location
										.replace('delete.do?post_num=${post.post_num}');
							}
						};
					</script>
				</c:if>
				<c:if test="${us_num != post.us_num}"></c:if>

				<input type="button" value="고객의소리" onclick="location.href='${pageContext.request.contextPath}/support/FeedBack.do'">
				<input type="button" value="커뮤니티 목록" onclick="location.href='list.do'">
			</div>
			<hr class="custom-hr" noshade="noshade" width="100%">

			<%-- 댓글 시작 --%>
			<div id="post-reply" class="post-reply">
				<span class="reply"> <span class="highlight-nickname">${us_nickname}님의</span>
					의견을 자유롭게 남겨주세요!😊
				</span>
				<form id="re_form" action="writeReply.do" method="post">
					<input type="hidden" id="post_num" name="post_num"
						value="${post.post_num}">
					<textarea rows="5" cols="100" id="re_content" name="com_content"
						class="rep-content"
						<c:if test="${empty us_num}">disabled="disabled"</c:if>><c:if
							test="${empty us_num}">댓글 작성은 로그인 후 가능합니다.</c:if></textarea>
					<c:if test="${!empty us_num}">
						<div id="re_first">
							<span class="letter-count"></span>
						</div>
						<div id="re_second" class="align-right">
							<input type="submit" value="댓글등록">
						</div>
					</c:if>
				</form>
			</div>
			<hr class="custom-hr" noshade="noshade" width="100%">

			<%-- 댓글 페이징 --%>
			<div id="output"></div>
			<div class="paging-button" style="display: none;">
				<input type="button" value="다음글 보기"> 
			</div>
				<a class="top" href="detail.do?post_num=${post.post_num}">상단으로</a>
			<div id="paging" class="paging">
				<div id="loading" style="display: none;">
					<img src="${pageContext.request.contextPath}/images/loading.gif"
						width="40" height="40">
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>



