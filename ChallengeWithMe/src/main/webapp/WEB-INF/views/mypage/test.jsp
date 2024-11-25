<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/test.css" type="text/css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/mypage.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
            <div class="card-3d-wrap">
              <div class="card-3d-wrapper">
                <div class="card-front">
                  <div class="center-wrap">
                    <!-- 아래 내용 앞면 -->
                    <form class="mypage-form" action="#" id="form1">
		<div class="green"></div>
		<div class="mypage-wrapper">
			<!-- 앞면 헤더 -->
			<div>
			      <input class="checkbox" type="checkbox" id="reg-log" name="reg-log" style="display: none"/>
          <label for="reg-log"></label>
				<img class="logo" src="${ pageContext.request.contextPath }/images/logo.png">
			</div>
			<!-- 프로필사진 랭크 닉네임 -->
			<div class="profile-container">
				<div class="profile-wrapper">
					<c:if test="${ empty xuser.img }">
						<img class="profile" src="${ pageContext.request.contextPath }/images/face.png">
					</c:if>
					<c:if test="${ !empty xuser.img }">
						<img class="profile" src="${ pageContext.request.contextPath }/upload/${ xuser.img }">
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
                      <!-- center-wrap -->
                    </div>
                    <!-- card-front -->
                <div class="card-back">
                    <!-- 아래 내용 뒷면 -->
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
                    <!-- center-wrap -->
                    </div>
                    <!-- card-back -->
                  </div>
                  <!-- card-3d-wrapper -->
                </div>
                <!-- card-3d-wrap mx-auto -->
</body>
</html>