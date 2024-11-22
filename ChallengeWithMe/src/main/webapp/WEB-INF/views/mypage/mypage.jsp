<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/mypage.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	function FormClick() {
	  	document.querySelector('.mypage-form').classList.add('active');  // 폼1을 위로 이동
	  	document.querySelector('.mypage-form2').classList.add('active');  // 폼2를 화면에 나타냄
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="mypage">
		<!-- 마이페이지 앞 -->
		<div class="form-wrapper">
		<form class="mypage-form" action="#" id="form1">
		<div class="green"></div>
		<div class="mypage-wrapper">
			<!-- 앞면 헤더 -->
			<div>
				<input class="hole" type="button">
				<img class="logo" src="${ pageContext.request.contextPath }/images/logo.png">
			</div>
			<!-- 프로필사진 랭크 닉네임 -->
			<div class="profile-container">
				<div class="profile-wrapper">
					<c:if test="${ empty xuser.img }">
						<img class="profile" src="${ pageContext.request.contextPath }/images/face.png" width="100" height="100" class="">
					</c:if>
					<c:if test="${ !empty xuser.img }">
						<img class="profile" src="${ pageContext.request.contextPath }/upload/${ xuser.img }" width="100" height="100" class="">
					</c:if>
				</div>
				
				<div class="badge-nick">
					<div class="badge">
						<span><img class="badge" src="${ pageContext.request.contextPath }/images/fav01.gif" width="35" height="35"></span>
						<span class="level"><b>Lv${ xuser.rank }</b></span>
					</div>
					<div>
						<h3>닉네임</h3>
						<span class="nick"><b>${ xuser.nickname }님</b></span>
					</div>
				</div>
			</div>
			<div class="photo-btn">
				<input type="button" value="이미지 변경" id="photo_btn">
				<div style="display: none;">
					<input type="file" id="photo" accept="image/png, image/jpeg"><br>
					<input type="button" value="저장" id="photo_set">
					<input type="button" value="취소" id="photo_reset">
				</div>
			</div>
			<!-- 각종 챌린지 성과 -->
			<div class="chall">
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
			<div class="prize">
				<div>
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
		</form>
		</div>
		<!-- 마이페이지 뒤 -->
		<form class="mypage-form2" action="#" id="form2">
		<div class="green2"></div>
		<div class="mypage-wrapper">
			<!-- 뒷면 헤더 -->
			<div>
				<input class="hole2" type="button">
				<img class="logo2" src="${ pageContext.request.contextPath }/images/logo.png">
			</div>
			<!-- 닉네임 아이디 비밀번호 -->
			<div class="mydetail-wrapper">
				<div class="mydetail-list">
					<ul>
						<li><h3>닉네임</h3></li>
						<li><h3>이메일</h3></li>
						<li><h3>내 계정</h3></li>
					</ul>
				</div>
				<div class="mydetail-result">
					<ul>
						<li><span>${ xuser.nickname }</span></li>
						<li><input type="button" value="닉네임 변경"></li>
						<li><span>${ xuser.email }</span></li>
						<li><input type="button" value="이메일 변경"></li>
						<li><span>${ xuser.id }</span></li>
						<li><input type="button" value="비밀번호 변경"></li>
						<li><input type="button" value="회원탈퇴" style="background-color: #e04e4e"></li>
					</ul>
				</div>
			</div>
			<!-- 개인정보 -->
			<div class="myinfo-wrapper">
				<div class="myinfo-list">
					<ul>
						<li>이름</li>
						<li>성별</li>
						<li>전화번호</li>
						<li>우편번호</li>
						<li>주소</li>
						<li>나머지주소</li>
					</ul>
				</div>
				<div class="myinfo-result">
					<ul>
						<li>${ xuser.name }</li>
						<c:if test="${ xuser.gen == 0 }">
							<li>남</li>
						</c:if>
						<c:if test="${ xuser.gen == 1 }">
							<li>여</li>	
						</c:if>
						<li>${ xuser.tel }</li>
						<li>${ xuser.zipcode }</li>
						<li>${ xuser.address1 }</li>
						<li>${ xuser.address2 }</li>
					</ul>
				</div>
			</div>
			</div>
			
			<!-- 선호 카테고리 -->
			<div class="pref-wrapper">
				<div class="pref-pref">
					<h3>선호 카테고리</h3><input type="button" value="카테고리 변경">
				</div>
				<div class="pref-result">
					<ul>
					<c:forEach var="pref" items="${ preName }">
						<li>${ pref }</li>
					</c:forEach>
					</ul>
				</div>
			</div>
			</form>
			</div>
			<!-- 꼬박꼬박 달성도 -->
			<h1>꼬박꼬박 달성도</h1>
			<div class="pp">
			<p></p>
			</div>
			<div class="rank-wrapper">
			<div class="rank" style="background-color: #ffe479">
				<!-- 좌측 정보 -->
				<div class="rank-left">
					<div class="rank-rank">
						<ul>
							<li><h3>나의 등급</h3></li>
							<li>Lv${ xuser.rank }</li>
							<li><!-- 점수 들어갈 예정 -->점</li>
						</ul>
					</div>
					<div>
						<!-- 나무 애니메이션 들어가는곳 -->
						<img src="${ pageContext.request.contextPath }/images/logo.png">
					</div>
				</div>
				<!-- 우측 정보 -->
				<div class="rank-right">
					<div>
						<img src="${ pageContext.request.contextPath }/images/rank.png">
					</div>
				</div>
			</div>
			</div>
			<!-- 보유 뱃지 -->
			<h1>보유 뱃지</h1>
			<div class="infobadge-wrapper">
			<div class="infobadge" style="background-color: #ffe479">
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>