<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 커뮤니티</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hj.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>



<%-- 부트스트랩 링크 --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">


<script type="text/javascript">
	window.onload=function(){
		//변수 지정
		const myForm = document.getElementById('search_form');
		//이벤트 연결
		myForm.onsubmit=function(){
			const keyword = getElementById('keyword');
			if(keyword.value.trim()==''){
				alert('검색어를 입력하세요!');
				keyword.value = '';
				keyword.focus();
				return false;
			}
		}
	}
 
</script>
</head>
<body>
	<%-- 부트스트랩 <script> 태그 --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
		
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="list-page-main">
		<div class="content-main">
			<h4>꼬박꼬박 커뮤니티</h4>
	<%-- 부트스트랩 버튼 사용 확정 시 삭제할 것
			<form id="search_form" action="list.do" method="get">
				<ul class = "search">
					<li>
						<select name="keyfield">
							<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>작성자 닉네임</option>
							<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>제목</option>
							<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>내용</option>
						</select>
					</li>
					
					<li>
						<input type="search" size="10" name="keyword" id="keyword" value="${param.keyword}">
						<input type="submit" value="🔍">				
					</li>
				</ul>
			</form> --%>


	<%-- 부트스트랩 버튼  --%>
			<div id="search_form" class="btn-group" role="group"
				aria-label="Button group with nested dropdown">
				<button type="button" class="btn btn-light">🔍</button>

				<div class="btn-group" role="group">
					<button type="button" class="btn btn-light">작성자</button>
					<button type="button" class="btn btn-light dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"></button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">제목</a></li>
						<li><a class="dropdown-item" href="#">내용</a></li>
					</ul>
				</div>

				<button type="button" class="btn btn-light">검색하기</button>
			</div>
		
	<%-- 글 작성 버튼 --%>
			<div class="top-list-space align-right">
				<c:if test="${!empty us_num}">
					<input type="button" value="글 작성"
						onclick="location.href='writeForm.do'">
				</c:if>
			</div>

			<div class="bottom-list-space align-right">
				<c:if test="${!empty us_num}">
					<input type="button" value="글 작성"
						onclick="location.href='writeForm.do'">
				</c:if>
			</div>
		</div>

	<%-- 게시글 --%>
			<c:if test="${count==0}">
				<div class="result-display">작성한 게시물이 없습니다.</div>
			</c:if>

	
			<c:if test="${count>0}">
				<c:forEach var="post" items="${post}">
					<div class="post-list">
						<div class="post-list-header">
							<c:if test="${!empty post.us_img}">
							<img src="${pageContext.request.contextPath}/upload/${post.us_img}" width="40" height="40" class="my-photo">
							</c:if>
							<c:if test="${empty post.us_img}">
							<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
							</c:if>
							<span class="post-list-nickname">${post.us_nickname}</span> 
							<span class="post-list-date"> <fmt:formatDate value="${post.post_date}" pattern="yyyy-MM-dd"/></span>
							
							
							<%-- 조회수 --%>
							<span class="post-list-view">
							<img src="${pageContext.request.contextPath}/images/eye.svg" width="15" height="15">
							<c:if test="${!empty post.post_view}">
							${post.post_view}
							</c:if>
							<c:if test="${empty post.post_view}">
							0
							</c:if>
							</span>
							<hr size="1" noshade="noshade" width="100%">
						</div>
						
						<div class="post-list-bottom">
							<a href="detail.do?post_num=${post.post_num}">${post.post_title}</a>
							<hr size="1" noshade="noshade" width="100%">
						</div>
					</div>
				</c:forEach>
			</c:if>

	</div>
</body>
</html>





















