<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비즈니스 광고 모집</title>

<style>
/* 기본 초기화 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans', sans-serif;
	background-color: #fff;
	color: #333;
	flex-direction: column; /* 콘텐츠와 푸터를 세로 정렬 */
}

a {
	text-decoration: none;
	color: inherit;
}

/* 헤더 */
header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 40px;
	border-bottom: 1px solid #eaeaea;
	font-size: 14px;
}

header .logo {
	font-size: 24px;
	font-weight: bold;
	margin-left: 90px;
}

header .menu {
	color: #777;
	margin-right: 90px;
}
/* 메인 콘텐츠 */
main {
    flex: 1; /* 남은 공간을 모두 차지하도록 설정 */
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 40px 20px;
}

main h1 {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
}

section {
    padding: 40px 20px;
    max-width: 1200px;
    margin: 0 auto;
}

h1 {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
}

/* 광고 채널 리스트 */
.channel-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 20px;
}

.channel-item {
    flex: 1 1 calc(33.333% - 20px);
    min-width: 280px;
    background: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    
}

.channel-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}

.channel-item img {
    width: 50px;
    height: 50px;
    margin-bottom: 10px;
    
}

.channel-item h2 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #6200ee;
}

.channel-item p {
    font-size: 14px;
    color: #555;
    line-height: 1.6;
    margin-bottom: 20px;
}

.channel-item button {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    background-color: #6200ee;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.channel-item button:hover {
    background-color: #4500a3;
}

 /* 푸터 */
        .footer {
            clear: both;
            text-align: center;
            padding: 10px 0;
            background-color: #fdd835;
             margin-top: 290px; /* 자동으로 콘텐츠 아래로 푸터를 밀어냄 */
        }

        .footer a {
            text-decoration: none;
            color: #333;
            padding: 5px 10px;
        }

        .footer a:hover {
            text-decoration: none;
        }
</style>
</head>
<body>

<!-- 헤더 -->
	<header>

		<div class="logo">
			<a href="SupportMain.do" class="logo-link">꼬박꼬박 고객센터</a>
		</div>
		<div class="menu">
			<a class="menu-link" aria-label="menu-link">한국어</a>
			<!-- 로그인 상태 확인 -->
			<c:choose>
				<c:when test="${empty xuser.us_num}">
					<!-- 로그인하지 않은 경우 -->
            | <a href="<%= request.getContextPath() %>/xuser/login.do"
						class="menu-link" aria-label="menu-link">로그인</a>
				</c:when>
				<c:otherwise>
					<!-- 로그인한 경우 닉네임 표시 -->
            | <span onclick="location.href='${pageContext.request.contextPath}/mypage/mypage.do'" class="menu-link">${xuser.nickname} 님 </span>
				</c:otherwise>
			</c:choose>
		</div>
	</header>

<!-- 비즈니스 광고 모집 -->
<section>
    <h1>비즈니스 광고 모집</h1>
    <p style="text-align: center; color: #777; margin-bottom: 40px;">
        꼬박꼬박에서 다양한 광고 채널과 함께 비즈니스를 시작하세요.<br>
        아래에서 원하는 채널을 선택하여 신청해 보세요!
    </p>

    <div class="channel-list">
        <!-- 채널 1 -->
        <div class="channel-item">
            <img src="${pageContext.request.contextPath}/images/Social.png" alt="채널 이미지">
            <h2>소셜 미디어 광고</h2>
            <p>꼬박꼬박의 소셜 미디어 채널을 통해 고객들에게 직접 다가가 보세요. 빠르고 효율적인 홍보를 제공합니다.</p>
            <button onclick="location.href='<%= request.getContextPath() %>/support/SupportWrite.do'">신청하기</button>
        </div>

        <!-- 채널 2 -->
        <div class="channel-item">
            <img src="${pageContext.request.contextPath}/images/Email.png" alt="이메일 이미지">
            <h2>이메일 마케팅</h2>
            <p>효과적인 이메일 마케팅으로 고객의 관심을 끌어보세요. 꼬박꼬박에서 도와드립니다.</p>
            <button onclick="location.href='<%= request.getContextPath() %>/support/SupportWrite.do'">신청하기</button>
        </div>

        <!-- 채널 3 -->
        <div class="channel-item">
            <img src="${pageContext.request.contextPath}/images/ads.png" alt="배너 이미지">
            <h2>배너 광고</h2>
            <p>꼬박꼬박 웹사이트에 배너 광고를 게시하여 제품 또는 서비스를 홍보하세요.</p>
            <button onclick="location.href='<%= request.getContextPath() %>/support/SupportWrite.do'">신청하기</button>
        </div>

        <!-- 추가적인 채널들을 여기서 확장 가능 -->
    </div>
</section>

<!-- 푸터 -->
<div class="footer">
    <a href="SupportMain.do">홈</a> |
    <a href="SupportWrite.do">1:1 문의</a> |
    <a href="NoticeList.do">공지사항</a>
</div>

</body>
</html>
