<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 커뮤니티</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">

<script type="text/javascript">
	window.onload=function(){
		//변수 지정
		const myForm = document.getElementById('search_form');
		//이벤트 연력
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
<div class="page-main">
	<%-- <jsp:include page="/WEB-INF/views/commom/header.jsp"/> --%>
		<div class="content-main">
			<h4>꼬박꼬박 커뮤니티</h4>
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
			</form>
			
			<div class = "top-list-space align-right">
				<c:if test="${!empty us_num}">
				<input type="button" value="글 작성" onclick="location.href='writeForm.do'">
				</c:if>
			</div>
			
			<div class = "bottom-list-space align-right">
				<c:if test="${!empty us_num}">
				<input type="button" value="글 작성" onclick="location.href='writeForm.do'">
				</c:if>
			</div>
			
				<c:if test="${empty us_num}">
					<div class="result-display"> 
					작성한 게시물이 없습니다.
					</div>
				</c:if>
				
				<!-- 글 하나 작성 하면 폼 만들기  -->
				<c:if test="${count>0}">
				<div class="card">
					<div class="card_us_nickname">유저닉네임
					<span class="card_us_img"></span>
					<span class="date"></span>
					
					</div>				
					</div>
				
				</div>
				</c:if>
		
		
		</div>
	</div>
</body>
</html>





















