<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 커뮤니티</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hj.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>


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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="list-page-main">
		<div class="content-main">
			<h4 class=main-title>꼬박꼬박 커뮤니티</h4>
			
			<div class="search-and-button">
			<form id="search_form" action="list.do" method="get">
				<ul class = "search">
					<li class="search-filter">
						<select  class="keyfield" name="keyfield">
							<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>전체</option>
							<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>닉네임</option>
							<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>제목</option>
							<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>내용</option>
						</select>
					</li>
					<li class="search-box">
						<input type="search" size="10" name="keyword" id="keyword" value="${param.keyword}">
					</li>
					<li class="magnigierButton">	
						<button type="submit" class="magnigierButton" id="magnigierButton">
							<img src="${pageContext.request.contextPath}/images/magnifier.png" width="15" height="15">
						</button>		
					</li>
				</ul>
			</form>
	<%-- 목록 및 글 작성 버튼 --%>
				<div class="search-and-button2">
					<c:if test="${!empty us_num}">
						<input type="button" value="글 작성" class="writeButton" onclick="location.href='writeForm.do'">
						<input type="button" value="사용 가이드" class="helpButton" onclick="location.href='${pageContext.request.contextPath}/support/CommunityHelp.do'">
					</c:if>
				</div>
			</div>
		</div>
	
	<%-- 게시글 --%>
			<c:if test="${count==0}">
				<div class="result-display">첫 번째 게시물을 작성해보세요!</div>
			</c:if>

	
			<c:if test="${count>0}">
				<c:forEach var="post" items="${post}">
					<div class="post-list">
						<div class="post-list-header">
							<div class="post-list-header1">
								<c:if test="${!empty post.us_img}">
									<img src="${pageContext.request.contextPath}/upload/${post.us_img}" width="40" height="40" class="my-photo">
								</c:if>
								<c:if test="${empty post.us_img}">
									<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
								</c:if>
								<div class="post-list-nickname">${post.us_nickname}</div> 
								<div class="post-list-date"> <fmt:formatDate value="${post.post_date}" pattern="yyyy-MM-dd"/></div>
							</div>
							
							<%-- 조회수 --%>
							<div class="post-list-header2">
								<span class="post-list-view">
								<img src="${pageContext.request.contextPath}/images/eye.svg" width="13" height="13">
								<c:if test="${!empty post.post_view}">
								${post.post_view}
								</c:if>
								<c:if test="${empty post.post_view}">
								0
								</c:if>
								</span>
							</div>
						</div>	
							<hr class="custom-hr"  noshade="noshade" width="100%">
						
						<div class="post-list-bottom">
							<a href="detail.do?post_num=${post.post_num}">제목 : ${post.post_title}</a>
						</div>
					</div>
				</c:forEach>
			</c:if>
		<div class=list-paging>
		${page}
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>





















