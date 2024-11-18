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
			<div class="align-left">
				<ol>
					<input type="button" value="참여 챌린지" id="part_ch_btn">
				</ol>
				<ol>
					<input type="button" value="개설 챌린지" id="gen_ch_btn">
				</ol>
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
			<div class ="report">
				<h4>챌린지 리포트</h4>
				<input type="date" value="참여 날짜" id="part_date">
				
				
			
			
			</div>




		</div>

	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>





