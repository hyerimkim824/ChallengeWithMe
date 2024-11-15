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
					<li>우편번호</li>
					<li>주소</li>
					<li>나머지주소</li>
				</ul>
			</div>
			<div>
				<ul>
					<li>${ xuser.name }</li>
					<c:if test="${ xuser.gen == 0 }">
						<li>남자</li>
					</c:if>
					<c:if test="${ xuser.gen == 1 }">
						<li>여자</li>
					</c:if>
					<li>${ xuser.tel }</li>
					<li>${ xuser.zipcode }</li>
					<li>${ xuser.address1 }</li>
					<li>${ xuser.address2 }</li>
				</ul>
			</div>
			<!-- 선호 카테고리 -->
			<div>
				<h3>선호 카테고리</h3>
				<input type="button" value="카테고리 변경">
				<c:forEach var="pref" items="${ preName }">
				<ul>
					<li>${ pref }</li>
				</ul>
				</c:forEach>
			</div>
			<!-- 꼬박꼬박 달성도 -->
			<h1>꼬박꼬박 달성도</h1>
			<div>
				<!-- 좌측 정보 -->
				<div>
					<div>
						<h3>나의 등급</h3>
						<p>Lv${ xuser.rank }</p>
					</div><br>
					<div>
						<p><!-- 점수 들어갈 예정 -->점</p>
					</div>
					<div>
						<!-- 나무 애니메이션 들어가는곳 -->
					</div>
				</div>
				<!-- 우측 정보 -->
				<div>
					<h3>등급 기준 표</h3>
					<div>
						<ul>
							<li>0 ~ 99				점</li>
							<li>100 ~ 499			점</li>
							<li>500 ~ 999			점</li>
							<li>1000 ~ 1499			점</li>
							<li>1500 ~ 2499			점</li>
							<li>2500 ~ 3999			점</li>
							<li>4000 ~ 5499			점</li>
							<li>5500 ~ 6999			점</li>
							<li>7000 ~ 8999			점</li>
							<li>9000 ~				점</li>
						</ul>
					</div>
					<div>
						<ul>
							<li>Lv1</li>
							<li>Lv2</li>
							<li>Lv3</li>
							<li>Lv4</li>
							<li>Lv5</li>
							<li>Lv6</li>
							<li>Lv7</li>
							<li>Lv8</li>
							<li>Master</li>
							<li style="color: red;">Challenger</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 보유 뱃지 -->
			<h1>보유 뱃지</h1>
			<div>
				<!-- 대표 뱃지 -->
				<div>
					<h3>대표 뱃지</h3>
					<a href="#"><img src="${ pageContext.request.contextPath }/images/face.png" width="200" height="200" class=""></a>
					<input type="button" value="뱃지 변경">
				</div>
				<!-- 뱃지 개수 정보 -->
				<div>
					<input type="button" value="자세히 보기">
					<ul>
						<li>총 뱃지</li>
						<li>획득 뱃지</li>
						<li>미획득 뱃지</li>
					</ul>
				</div>
				<div>
					<ul>
						<c:forEach var="bg" items="${ bgInfo }">
						<li>${ bg } 개</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>