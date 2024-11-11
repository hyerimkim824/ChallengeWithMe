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
						</select>
				
				</ul>
			</form>
		
		
		
		
		</div>
</div>


</body>
</html>





















