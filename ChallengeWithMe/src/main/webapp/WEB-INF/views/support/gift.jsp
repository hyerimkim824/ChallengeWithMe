<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꼬박꼬박 선물하기</title>

<style>
/* 기본 초기화 */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Noto Sans', sans-serif;
    background-color: #f8f9fa;
    color: #333;
    line-height: 1.6;
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
header .logo a {
    text-decoration: none; /* 밑줄 제거 */
    color: #000; /* 글씨 색 검정으로 */
}
header .menu {
	color: #777;
	margin-right: 90px;
}
/* 선물 페이지 */
.gift-container {
    max-width: 1200px;
    margin: 50px auto;
    padding: 20px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.gift-title {
    text-align: center;
    font-size: 36px;
    font-weight: bold;
    color: #6200ee;
    margin-bottom: 10px;
    text-decoration: none; /* 밑줄 제거 */
    color: #000; /* 글씨 색 검정으로 */
}

.gift-description {
    text-align: center;
    font-size: 16px;
    color: #777;
    margin-bottom: 40px;
}

.gift-items {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
}

.gift-item {
    border: 1px solid #ddd;
    border-radius: 10px;
    overflow: hidden;
    background: #fff;
    transition: transform 0.3s, box-shadow 0.3s;
    text-align: center;
    position: relative;
}

.gift-item:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.gift-item img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-bottom: 1px solid #ddd;
}

.gift-item h3 {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin: 15px 0;
}

.gift-item p {
    font-size: 14px;
    color: #666;
    padding: 0 15px;
    margin-bottom: 10px;
}

.gift-item .price {
    font-size: 16px;
    font-weight: bold;
    color: #6200ee;
    margin-bottom: 15px;
}

.gift-item button {
    width: calc(100% - 30px);
    padding: 10px;
    margin: 10px auto 20px;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    background-color: #6200ee;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.gift-item button:hover {
    background-color: #4500a3;
}
/* 팝업 */
.popup-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 1000;
    justify-content: center;
    align-items: center;
}

.popup {
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    width: 400px;
    max-width: 90%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
}

.popup h3 {
    margin-bottom: 20px;
    font-size: 20px;
    color: #333;
}

.popup select, .popup input[type="number"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
}

.popup button {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    background: #6200ee;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.popup button:hover {
    background: #4500a3;
}

/* 닫기 버튼 */
.popup .close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    background: none;
    border: none;
    font-size: 18px;
    cursor: pointer;
    color: #666;
}

.popup .close-btn:hover {
    color: #000;
}
/* 푸터 */
        .footer {
            clear: both;
            text-align: center;
            padding: 10px 0;
            background-color: #fdd835;
             margin-top: 190px; /* 자동으로 콘텐츠 아래로 푸터를 밀어냄 */
        }

        .footer a {
            text-decoration: none;
            color: #333;
            padding: 5px 10px;
        }

        .footer a:hover {
            text-decoration: none;
        }
        .service-section {
    background-color: #F9F9F9; /* 배경색 변경 */
    padding: 40px 20px; /* 섹션 여백 */
    }
    .chick-image {
    width: 55px; /* 병아리 이미지의 너비 */
    height: auto; /* 비율 유지 */
}
</style>
<script>

function openPopup(itemName, itemPrice) {
    const overlay = document.querySelector(".popup-overlay");
    const popup = overlay.querySelector(".popup");

    // 팝업 내용 업데이트
    popup.querySelector("h3").textContent = `${itemName} 선택하기`;
    popup.querySelector("input[name='price']").value = itemPrice; // 가격 설정
    popup.querySelector("input[name='quantity']").value = 1; // 초기 수량 설정

    // 초기 총 금액 설정
    calculateTotal(popup); // 팝업을 열 때 총 금액 계산

    // 팝업 표시
    overlay.style.display = "flex";
}

function closePopup() {
    document.querySelector(".popup-overlay").style.display = "none";
}

function calculateTotal(popup) {
    // 팝업 내 요소 가져오기
    const priceInput = popup.querySelector("input[name='price']");
    const quantityInput = popup.querySelector("input[name='quantity']");
    const totalPriceElement = popup.querySelector(".total-price");

    // 값 가져오기
    const price = parseFloat(priceInput.value) || 0; // 가격 값
    const quantity = parseInt(quantityInput.value) || 1; // 수량 값

    // 총 금액 계산
    const total = price * quantity;

    // 총 금액 표시 업데이트
    totalPriceElement.textContent = `총 금액: ${total.toLocaleString()}원`;
}

// 수량 변경 이벤트 연결
document.addEventListener("input", (event) => {
    if (event.target.matches(".popup input[name='quantity']")) {
        const popup = event.target.closest(".popup");
        calculateTotal(popup);
    }
});

</script>
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

<!-- 선물 페이지 내용 -->
<div class="gift-container">
    <h1 class="gift-title">선물로 행복을 나눠보세요 🎁</h1>
    <p class="gift-description">
        챌린지 상금을 모아 원하는 물건을 구입하거나, 사랑하는 사람에게 특별한 선물을 전달할 수 있습니다. <br>
        아래의 옵션 중 원하는 선물을 선택하세요!
    </p>

    <div class="gift-items">
        <!-- 선물 아이템 1 -->
        <div class="gift-item">
    <img src="<%= request.getContextPath() %>/images/Netflix.png" alt="기프트 카드">
    <h3>기프트 카드</h3>
    <p>쇼핑, 외식, 엔터테인먼트까지 다양한 선택이 가능한 기프트 카드입니다.</p>
    <p class="price">10,000원</p>
    <button onclick="openPopup('기프트 카드', 10000)">선물하기</button>
</div>

        <!-- 선물 아이템 2 -->
        <div class="gift-item">
            <img src="<%= request.getContextPath() %>/images/electronics.png" alt="전자제품">
            <h3>최신 전자제품</h3>
            <p>챌린지 성공으로 최신 스마트 기기와 가전제품을 구매해보세요.</p>
            <p class="price">300,000원</p>
            <button onclick="openPopup('에어팟 프로', 300000)">선물하기</button>
        </div>

        <!-- 선물 아이템 3 -->
        <div class="gift-item">
            <img src="<%= request.getContextPath() %>/images/Flower.png" alt="꽃다발">
            <h3>특별한 꽃다발</h3>
            <p>소중한 사람에게 감사와 사랑의 마음을 꽃으로 전하세요.</p>
            <p class="price">20,000원</p>
            <button onclick="openPopup('꽃다발', 20000)">선물하기</button>
        </div>

        <!-- 선물 아이템 4 -->
        <div class="gift-item">
            <img src="<%= request.getContextPath() %>/images/donation.png" alt="기부">
            <h3>소중한 기부</h3>
            <p>상금을 모아 도움이 필요한 사람들에게 나눔의 손길을 건네보세요.</p>
            <p class="price">기부 가능 금액 설정</p>
            <button onclick="openPopup('소중한 기부', 10000)">선물하기</button>
        </div>
    </div>
</div>
<div class="popup-overlay">
    <div class="popup">
        <button class="close-btn" onclick="closePopup()">✖</button>
        <h3>상품 선택</h3>
        <!-- 가격과 수량 입력 -->
        <input type="hidden" name="price" value="">
        <label for="quantity">수량 선택:</label>
        <input type="number" id="quantity" name="quantity" value="1" min="1" onchange="calculateTotal(this.closest('.popup'))">
        <!-- 총 금액 표시 -->
        <p class="total-price">총 금액: 0원</p>
        <button onclick="alert('계산 완료!')">계산하기</button>
    </div>
</div>
<!-- 푸터 -->
<div class="footer">
    <p>
        <a href="ChallengeHelp.do">챌린지 안내</a> |
        <a href="SupportWrite.do">1:1 문의</a> |
        <a href="mypage/mypage.do">마이페이지</a> |
        <a href="NoticeList.do">공지사항</a>

</div>
</body>
</html>
