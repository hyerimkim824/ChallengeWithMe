<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div>
		<!-- 마이페이지 앞 -->
		<div>
			<!-- 앞면 헤더 -->
			<div>
				<img alt="" src="">
			</div>
			<!-- 프로필사진 랭크 닉네임 -->
			<div>
				<div>
					<c:if test="${ empty xuser.img }">
						<img src="${ pageContext.request.contextPath }/images/face.png" width="200" height="200" class="">
					</c:if>
					<c:if test="${ !empty xuser.img }">
						<img src="${ pageContext.request.contextPath }/upload/${ xuser.img }" width="200" height="200" class="">
					</c:if>
				</div>
				<div>
					<input type="button" value="프로필 이미지 변경" id="photo_btn">
				</div>
				<div style="display: none;">
					<input type="file" id="photo" accept="image/png, image/jpeg"><br>
					<input type="button" value="저장" id="photo_set">
					<input type="button" value="취소" id="photo_reset">
				</div>
				<div>
					<ul>
						<li><img alt="" src=""></li>
						<li>Lv${ xuser.rank }</li>
					</ul>
				</div>
				<div>
					<h3>닉네임</h3>
					<ul>
						<li>${ xuser.nickname }님</li>
					</ul>
				</div>
			</div>
			<!-- 각종 챌린지 성과 -->
			<div>
				<h3>챌린지 기록</h3>
				<div class="result1">
					<ul>
						<li>성과 점수</li>
						<li>점</li>
					</ul>
				</div>
				<div class="result2">
					<ul>
						<li>참여횟수</li>
						<li>회</li>
					</ul>
				</div>
				<div class="result3">
					<ul>
						<li>완료횟수</li>
						<li>회</li>
					</ul>
				</div>
				<div class="result4">
					<ul>
						<li>개설횟수</li>
						<li>회</li>
					</ul>
				</div>
			</div>
			<!-- 상금 잔고 -->
			<div>
				<div class="prize">
					<ul>
						<li>상금</li>
						<li>원</li>
					</ul>
				</div>
				<div>
					<ul>
						<li>잔고</li>
						<li><fmt:formatNumber value="${ xuser.wallet }" type="number" pattern="#,###원"/></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 마이페이지 뒤 -->
		<div>
			<!-- 뒷면 헤더 -->
			<div>
				<img alt="" src="">
			</div>
			<!-- 닉네임 아이디 비밀번호 -->
			<div>
				<div>
					<h3>닉네임</h3>
					<p>${ xuser.nickname }<p>
					<input type="button" value="닉네임 변경">
				</div>
				<div>
					<h3>이메일</h3>
					<p>${ xuser.email }</p>
					<input type="button" value="이메일 변경">
				</div>
				<div>
					<h3>아이디</h3>
					<p>${ xuser.id }</p>
				</div>
				<div>
					<h3>비밀번호</h3>
					<input type="button" value="비밀번호 변경">
					<input type="button" value="회원탈퇴">
				</div>
			</div>
			<!-- 개인정보 -->
			<div>
				<ul>
					<li>이름</li>
					<li>성별</li>
					<li>전화번호</li>
					<li>성별</li>
				</ul>
			</div>
			<div>
				<ul>
					<li>${ xuser.name }</li>
					<li>${ xuser.gen }</li>
					<li>${ xuser.tel }</li>
					<li>${ xuser. }</li>
				</ul>
			</div>
			<!-- 선호 카테고리 -->
			<div>
			
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>