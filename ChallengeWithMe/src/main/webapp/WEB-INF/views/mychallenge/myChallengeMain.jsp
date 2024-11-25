<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이첼린지 메인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/header.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/khr.css" type="text/css">
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">




function hideFunction1(){
	var part = document.getElementById("part");

	if(part.style.display==="none"){
	part.style.display = "block";
	}else{
	part.style.display="none"}
	
}
function hideFunction2(){
	var get = document.getElementById("get");
	
	if(get.style.display==="none"){
	get.style.display = "block";
	}else{
	get.style.display="none"}
	
}

function hideFunction3(){
	var like = document.getElementById("like");
	
	if(like.style.display==="none"){
	like.style.display = "block";
	}else{
	like.style.display="none"}
	
}

function hideFunction4(){
	var overall = document.getElementById("overall");
	
	if(overall.style.display==="none"){
	overall.style.display = "block";
	}else{
	overall.style.display="none"}
	
}

</script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="page-main">

		<div class="mychallenge-content-main">
			<h2>마이 첼린지 메인 페이지</h2>
			<div class="mychallenge-div">
				<h4>프로필 사진</h4>
				<ul>
					<li><c:if test="${empty xuser.photo}">
							<img src="${pageContext.request.contextPath}/images/face.png"
								width="150" height="150" class="my-photo">
						</c:if> <c:if test="${!empty xuser.photo}">
							<img
								src="${pageContext.request.contextPath}/upload/${xuser.photo}"
								width="150" height="150" class="my-photo">
						</c:if></li>
				</ul>
			</div>
			
			<div class="align-right" >
				<h4>마이 챌린지</h4>
				<table id=my_challenge>
					<tr>
						<th>참가중</th>
						<th>완료</th>
						<th>개설</th>
					</tr>
					<!--  
							후에 db에서 가져옴
							<c:forEach var="board" items="${boardList}">
								<tr>
									<td><a
										href="${pageContext.request.contextPath}/board/detail.do?board_num=${board.board_num}"
										target="_blank">${fn:substring(board.title,0,26)}</a></td>
									<td>${board.id}</td>
									<td>${board.reg_date}</td>
								</tr>
							</c:forEach>
							-->
					<tr>
						<th>1</th>
						<th>0</th>
						<th>0</th>
					</tr>

				</table>
				
				</div>
			
			
			</div>
			<div class="align-left">
				
					<input type="button" value="참여 챌린지" id="part_ch_btn">
					<br>
				
					<input type="button" value="개설 챌린지" id="gen_ch_btn">
				
			</div>
		
			<div>
			
			<h2>챌린지 리포트</h2>
			
			
			<button onclick="hideFunction1()">챌린지 참가수</button>
			<button onclick="hideFunction2()">챌린지 달성률</button>
			<button onclick="hideFunction3()">챌린지 선호도</button>
			<button onclick="hideFunction4()">전체 챌린지</button>
			<div id ="part" class="ch-button">
				<h4>챌린지 참가수</h4>
				<form id ="" method="post" action="${pageContext.request.contextPath}/mychallenge/myChallengePartNum.do">
				<c:out value="${partNum}" default="partNum is not set!" />
				</form>
				<h4>평균 챌린지</h4>
				<form id ="" method="post" action="${pageContext.request.contextPath}/mychallenge/myChallengePartNum.do">
				
				 <label for="year">Year:</label>
			        <input type="number" id="year" name="year" required><br><br>
			
			        <label for="month">Month:</label>
			        <input type="number" id="month" name="month" required><br><br>
			
			        <button type="submit">Submit</button>
							 
				<c:out value="${partNum}" default="partNum is not set!" />
				</form>
				<!-- <input type="date" value="참여 날짜"> -->
			</div>
			
			 <div id ="get" class="ch-button">
				<h4>챌린지 달성률</h4>
				
				<!--<input type="text" value="달성률" >-->
			 </div>
			  <div id ="like" class="ch-button">
				<h4>챌린지 선호도</h4>
				<!--<input type="text" value="달성률" >-->
			 </div>
			  <div id ="overall" class="ch-button">
				<h4>월별 전체 챌린지</h4>
				<!--<input type="text" value="달성률" >-->
			 </div>


	
	</div>

	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>





