<%@page import="kr.support.vo.SupportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꼬박꼬박 고객센터</title>

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

/* 메인 영역 */
.main {
	text-align: center;
	padding: 50px 20px;
}

.main h1 {
	font-size: 40px;
	font-weight: bold;
	margin-bottom: 20px;
	line-height: 1.2;
	color: inherit;
}

.main input {
	width: 60%;
	padding: 15px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 30px;
	margin-top: 20px;
	outline: none;
}

.main input[type="submit"] {
	width: 10px; /* 버튼 너비 */
	height: 10px; /* 버튼 높이 */
	padding: 0; /* 내부 여백 제거 */
	margin: 0; /* 외부 여백 제거 */
	border: none; /* 테두리 제거 */
	background-color: transparent; /* 투명 배경 */
	cursor: pointer; /* 커서 모양은 유지 */
}

.main input:focus {
	border-color: #6200ee;
	box-shadow: 0 0 8px rgba(98, 0, 238, 0.3);
}

.keywords {
	margin: 20px auto;
	font-size: 14px;
	color: #777;
}

.keywords span {
	margin: 0 8px;
	padding: 5px 15px;
	background: #f9f9f9;
	border-radius: 15px;
	cursor: pointer;
}

.keywords span:hover {
	background: #6200ee;
	color: white;
}

/* 공지 */
.notice {
	margin: 30px auto;
	padding: 15px 20px;
	font-size: 14px;
	color: #555;
	background: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 5px;
	text-align: center;
}

/* 서비스별 고객센터 */
.categories-container {
	padding: 40px 20px;
}

.categories-title {
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 10px;
	margin-left: 100px;
}

/* 서비스별 고객센터 */
.categories {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-top: 50px;
    max-width: calc((100px + 85px) * 6 - 85px); /* 한 줄에 6개 */
    margin-left:200px;
    gap: 35px 85px; /* 세로 간격을 줄이기 위해 첫 번째 값을 줄임 */
    
}

.category {
	width: 100px;
	text-align: center;
}

.category img {
	width: 80px;
	height: 80px;
	margin-bottom: 0px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.category span {
	font-size: 14px;
}
/* 상단 제목과 전체보기 버튼을 같은 행에 배치 */
.categories-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
	padding: 0 10px;
}

/* 네비게이션 바 전체 스타일 */
.nav-container {
	margin: 20px auto;
	padding: 10px 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	max-width: 1200px;
	position: relative;
}

/* 네비게이션 타이틀 */
.nav-title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
	text-align: left;
	width: 100%;
}
/* 네비게이션 래퍼 */
.nav-wrapper {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 100%;
	position: relative;
	overflow: hidden;
	border-bottom: 1px solid #ddd;
	
}

/* 스크롤 영역 */
.nav-scroll {

	display: flex;
	overflow-x: auto;
	scrollbar-width: none; /* 스크롤바 숨김 */
	-ms-overflow-style: none; /* IE 스크롤바 숨김 */
	scroll-behavior: smooth;
	white-space: nowrap;
	padding: 0px 0;
	flex: 1;
	justify-content: center; /* 네비게이션 항목들을 중앙 정렬 */
	
	
}
.nav-scroll2 {

	display: flex;
	overflow-x: auto;
	scrollbar-width: none; /* 스크롤바 숨김 */
	-ms-overflow-style: none; /* IE 스크롤바 숨김 */
	scroll-behavior: smooth;
	white-space: nowrap;
	padding: 0px 0;
	flex: 1;
	justify-content: center; /* 네비게이션 항목들을 중앙 정렬 */
	
	
}

.nav-scroll::-webkit-scrollbar {
	display: none; /* 크롬/사파리 스크롤바 숨김 */
}
.nav-scroll2::-webkit-scrollbar {
	display: none; /* 크롬/사파리 스크롤바 숨김 */
}

/* 네비게이션 아이템 */
.nav-item {
	flex: 0 0 auto;
	padding: 10px 20px;
	font-size: 18px;
	color: #8e8e8e;
	font-weight: normal;
	cursor: pointer;
	border-bottom: 3px solid transparent;
	white-space: nowrap;
	transition: color 0.3s, border-color 0.3s;
	
	

}

.nav-item2 {
	flex: 0 0 auto;
	padding: 10px 20px;
	font-size: 18px;
	color: #8e8e8e;
	font-weight: normal;
	cursor: pointer;
	border-bottom: 3px solid transparent;
	white-space: nowrap;
	transition: color 0.3s, border-color 0.3s;
	
	

}

.nav-item:hover, .nav-item.active {
	color: #333;
	border-bottom: 3px solid;
	font-weight: bold;
	
}
.nav-item2:hover, .nav-item2.active {
	color: #333;
	border-bottom: 3px solid;
	font-weight: bold;
	
}

/ /* 화살표 버튼 래퍼 */
.nav-arrows {
	display: flex;
	align-items: center;
	gap: 5px;
	margin-left: 10px;
}

/* 화살표 버튼 */
.nav-arrow {
	background: none;
	border: none;
	font-size: 16px;
	font-weight:;
	color: #191919;
	cursor: pointer;
	padding: 5px 10px;
}

.nav-arrow:hover {

    transform: scale(1.05); /* 호버 시 살짝 확대 */
        background: rgba(255, 247, 214, 0.9);
}
/* 서비스 전체보기 버튼 스타일 */
.service-all-button {
	padding: 8px 18px 8px 16px;
	font-size: 14px;
	font-weight: bold;
	color: #333;
	background: #f2f4f6;
	border: 1px solid #ddd;
	border-radius: 6px;
	cursor: pointer;
	text-align: center;
	background: #eee;
	line-height: 1.5;
	font-family: 'Apple SD Gothic Neo', 'notoSans', '돋움', dotum, sans-serif,
		color : #191919;;
	letter-spacing: -0.5px;
	margin-bottom: 15px;
	margin-right: 85px;
}

.service-all-button:hover {
	background: #eaeaea;
}
/* FAQ 섹션 */
.faq {
	padding: 40px 20px;
	background-color: #fff;
}

.faq h2 {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 10px;
    margin-left: 100px;
}
}

.faq-tabs {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-bottom: 20px;
}

.faq-tabs button {
	padding: 10px 20px;
	font-size: 14px;
	background: none;
	border: 1px solid #ddd;
	border-radius: 20px;
	cursor: pointer;
	color: #333;
}

.faq-tabs button.active {
	background: #6200ee;
	color: white;
	border-color: #6200ee;
}

.faq-list {
	font-family: 'Noto Sans', sans-serif;
    color: #333;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    max-width: calc((230px + 20px) * 4 - 20px); /* 한 줄에 6개 */
    margin: 0 auto; /* 가운데 정렬 */
}

.faq-item {
 
    width: 230px; /* 동일한 너비로 고정 */
    height: 245px; /* 동일한 높이로 고정 */
    font-family: 'Noto Sans', sans-serif;
    color: #333;
    margin: 0;
    box-sizing: border-box;
    display: block;
    min-height: 48px;
    font-size: 16px;
    word-break: keep-all;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    text-align: ;
    transition: all 0.3s ease;
}

.faq-item:hover {
	background: #6200ee;
	color: white;
	border-color: #6200ee;
}

.faq-item strong {
	display: block;
	font-size: 16px;
	margin-bottom: 10px;
	display: block;
    min-height: 48px;
    padding: 16px 0;
    word-break: keep-all;
}
.faq-extra-container {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 40px;
    margin-bottom: 100px;
    
}

.faq-extra-item {
    display: flex;
    align-items: flex-start; /* 왼쪽 정렬 */
    gap: 15px; /* 이미지와 텍스트 사이의 간격 */
    width: 470px;
    padding: 20px;
    border-radius: 10px;
    background-color: #f9f9f9;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.faq-extra-item .image-container2 {
    flex-shrink: 0; /* 이미지 크기 고정 */
}

.faq-extra-item img {
    width: 40px; /* 이미지 크기 */
    height: 40px;
    border-radius: 0; /* 이미지는 네모 */
}
.text-content {
   margin-left: 10px;
}
.faq-extra-item .text-content {
    display: flex;
    flex-direction: column; /* 텍스트 세로 정렬 */
     margin-left: 20px; /* 오른쪽으로 이동 */
     
}


.faq-extra-item h3 {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin: 0 0 10px 0; /* 아래쪽 간격 */
    line-height: 1.4;
    line-height: 1.5;
    font-family: 'Apple SD Gothic Neo', 'notoSans', '돋움', dotum, sans-serif;
    color: #191919;
    letter-spacing: -0.5px;
    
}

.faq-extra-item p {
    font-size: 14px;
    color: #555;
    margin: 0; /* 기본 여백 제거 */
    line-height: 1.6;
}

.faq-extra-item button {
    width: 430px; /* 버튼 너비 */
    padding: 8px; /* 버튼 높이 */
    margin-top: 18px; /* 버튼과 텍스트 간격 */
    font-size: 16px; /* 글자 크기 */
    font-weight: bold; /* 글자 강조 */
    color: #191919; /* 텍스트 색상 */
    background-color: #fff; /* 버튼 배경색 */
    border: none; /* 테두리 제거 */
    border-radius: 6px; /* 둥근 모서리 */
    cursor: pointer; /* 마우스 커서 */
    transition: background-color 0.3s; /* 배경색 변경 효과 */
    margin-left: -105px;
}


.faq-extra-item button:hover {
    background-color: #4500a3;
    transform: scale(1.05); /* 호버 시 살짝 확대 */
    color: #FFFFFF; /* 텍스트 색상 */
}
.faq-extra-item .image-container2 {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
}

.faq-extra-item img {
    width: 50px;
    height: 50px;
    border-radius: 0; /* 이미지는 네모로 유지 */
    margin-left: 20px; /* 오른쪽으로 이동 */
}
.notice-container {
	margin: 30px auto; /* 가운데 정렬 */
	padding: 15px 20px;
	background-color: #fdfdfd; /* 아주 연한 회색 */
	border: none; /* 테두리 제거 */
	border-radius: 5px; /* 모서리를 둥글게 */
	width: 100%; /* 가로를 화면 전체로 설정 */
	max-width: 1500px; /* 최대 가로 크기를 1500px로 제한 */
	height: auto; /* 높이는 내용에 맞게 자동으로 설정 */
	display: flex; /* 플렉스 컨테이너 */
	align-items: center; /* 세로 가운데 정렬 */
	justify-content: center; /* 중앙 정렬 */
	position: relative; /* 공지 전체보기를 절대 위치로 설정하기 위한 상대 위치 */
	font-family: 'Noto Sans', sans-serif;
	box-sizing: border-box; /* 패딩 포함 크기 계산 */
}

/* 공지 버튼 */
.notice-button {
	background-color: #f2f4f6; /* 연한 회색 */
	color: #333; /* 텍스트 색상 */
	border: 1px solid #ddd; /* 테두리 */
	border-radius: 20px; /* 둥근 버튼 */
	padding: 5px 10px; /* 버튼 크기 */
	font-size: 12px;
	font-weight: bold;
	cursor: default;
}

/* 공지와 텍스트 중앙 정렬 */
.notice-title {
	display: flex; /* 플렉스 컨테이너 */
	align-items: center; /* 세로 가운데 정렬 */
	gap: 10px; /* 버튼과 텍스트 간격 */
}
/* 공지 텍스트 */
.notice-title span {
	font-size: 14px;
	color: #777;
	flex: 1; /* 텍스트가 공간을 차지하게 함 */
}

/* 공지 전체보기 오른쪽 정렬 */
.notice-link {
	position: absolute; /* 부모 요소를 기준으로 절대 위치 */
	right: 120px; /* 오른쪽 여백 */
	top: 50%; /* 수직 가운데 정렬 */
	transform: translateY(-50%); /* 수직 정렬 보정 */
	font-size: 12px;
	color:; /* 링크 색상 */
	font-weight: bold;
	text-decoration: none;
 
}


/* 로고 링크 기본 스타일 */
.logo-link {
	text-decoration: none; /* 밑줄 제거 */
	color: #333; /* 기본 텍스트 색상 */
	font-size: 24px; /* 로고 크기 */
	font-weight: bold; /* 강조된 글꼴 */
}

/* 메뉴 링크 스타일 */
.menu-link {
	text-decoration: none; /* 밑줄 제거 */
	color: #666; /* 기본 텍스트 색상 */
	font-size: 14px; /* 메뉴 글씨 크기 */
}

.category-link {
	
	color: #333; /* 기본 텍스트 색상 */
	text-decoration: none; /* 밑줄 제거 */
	display: inline-block; /* 블록처럼 동작 */
	margin-top: 10px; /* 이미지와 간격 유지 */
	 white-space: nowrap; /* 줄 바꿈 방지 */
    overflow: hidden; /* 넘치는 텍스트 숨김 */
     margin-top: 16px;
    font-size: 16px;
    word-break: keep-all;
    word-wrap: break-word;

}

/* 이미지 컨테이너 스타일 */
.image-container {
	background-color: #ffeb3b; /* 노란색 배경 */
	padding: 10px; /* 이미지와 배경 사이 여백 */
	display: inline-block; /* 이미지를 감싸는 박스 크기 조절 */
	border-radius: 40px; /* 모서리 둥글게 */
	width: 105px; /* 컨테이너의 너비 (선택 사항) */
	height: 105px; /* 컨테이너의 높이 (선택 사항) */
}

.image-container img {
	display: block; /* 이미지의 기본 블록 정렬 */
	max-width: 100%; /* 이미지 크기 제한 */
	height: auto; /* 이미지 비율 유지 */
	border-radius: 30px; /* 이미지도 둥글게 */
	margin-left: 2px;
}
  /* 푸터 */
        .footer {
            clear: both;
            text-align: center;
            padding: 10px 0;
            background-color: #fdd835;
             margin-top: auto; /* 자동으로 콘텐츠 아래로 푸터를 밀어냄 */
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
 /* 병아리 이미지 */
.chick-image {
    width: 55px; /* 병아리 이미지 크기 */
    height: auto; /* 비율 유지 */
    cursor: pointer; /* 커서 변경 */
}
    /* 말풍선 스타일 */
.speech-bubble {
    display: none; /* 기본적으로 숨김 */
    position: absolute;
    bottom: 70px; /* 말풍선의 위치 조정 */
    left: 50%;
    transform: translateX(-50%);
    background: #fff7d6; /* 부드러운 노란색 */
    color: #333; /* 텍스트 색상 */
    font-size: 14px;
    font-weight: bold;
    padding: 10px 15px;
    border-radius: 15px;
    background: rgba(255, 247, 214, 0.9); /* 반투명 노란색 */
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    z-index: 100; /* 위로 올리기 */
    font-family: 'Noto Sans', sans-serif;
}


/* 말풍선의 화살표 */
.speech-bubble::after {
    content: '';
    position: absolute;
    bottom: -10px; /* 병아리 이미지와 연결 */
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 0;
    border-style: solid;
    border-width: 10px 10px 0 10px;
    border-color: #fff7d6 transparent transparent transparent; /* 화살표 색상 */
}

.chick-image:hover + .speech-bubble {
    display: block; /* 말풍선 표시 */
    z-index: 10; /* 우선순위 높이기 */
}
<!-- 팝업창 CSS -->
<style>
/* 팝업창 배경 오버레이 */
.popup-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(0, 0, 0, 0.6);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
}

/* 팝업창 박스 */
.popup-box {
    background: white;
    width: 90%;
    max-width: 600px;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    animation: fadeIn 0.3s ease-out;
}

/* 팝업 헤더 */
.popup-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    background-color: #f5f5f5;
    border-bottom: 1px solid #ddd;
}

.popup-header h2 {
    margin: 0;
    font-size: 18px;
    font-weight: bold;
    color: #333;
}

.popup-close {
    background: none;
    border: none;
    font-size: 18px;
    cursor: pointer;
    color: #888;
}

.popup-close:hover {
    color: #333;
}

/* 검색창 */
.popup-search {
    padding: 15px 20px;
    border-bottom: 1px solid #ddd;
}

.popup-search input {
    width: 100%;
    padding: 12px;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 20px;
    outline: none;
    background: #f9f9f9;
}

/* 팝업 본문 */
.popup-body {
    padding: 20px;
    max-height: 400px;
    overflow-y: auto;
}

/* 카테고리 섹션 */
.popup-category {
    margin-bottom: 20px;
}

.popup-category h3 {
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #333;
}

/* 카테고리 항목 */
.popup-category-items {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
}

.popup-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    width: 80px;
    cursor: pointer;
    transition: transform 0.2s;
}

.popup-item img {
    width: 50px;
    height: 50px;
    margin-bottom: 8px;
}

.popup-item span {
    font-size: 12px;
    color: #333;
    word-break: keep-all;
}

.popup-item:hover {
    transform: scale(1.1);
}

/* 팝업 애니메이션 */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: scale(0.9);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}
</style>
<script>
document.addEventListener("DOMContentLoaded", () => {
    const navItems = document.querySelectorAll(".nav-item"); // 네비게이션 항목
    const categoriesContainer = document.querySelector(".categories"); // 카테고리 영역

    // 네비게이션 클릭 이벤트 핸들러 추가
    navItems.forEach((item) => {
        item.addEventListener("click", () => {
            // 'active' 클래스 제거 및 추가
            navItems.forEach((nav) => nav.classList.remove("active"));
            item.classList.add("active");

            // 클릭한 항목의 텍스트 가져오기
            const categoryName = item.textContent.trim();

            // categoryData에서 관련 데이터 가져오기
            const categoryContent = categoryData[categoryName] || "<p>해당 카테고리가 없습니다.</p>";

            // 카테고리 콘텐츠 업데이트
            categoriesContainer.innerHTML = categoryContent;
        });
    });

    // 기본값 설정: 첫 번째 네비게이션 항목 클릭
    if (navItems[0]) {
        navItems[0].click();
    }
});
</script>
<script>
// 말풍선 표시 함수
function showSpeechBubble() {
    const bubble = document.querySelector('.speech-bubble');
    bubble.style.display = 'block';

    // 3초 후 말풍선 숨기기
    setTimeout(() => {
        bubble.style.display = 'none';
    }, 3000);
}
</script>
 <script>
        // 🐥 질문 클릭 시 답변 토글 스크립트 🐥
        function toggleAnswer(id) {
            const answer = document.getElementById(id);
            if (answer.style.display === "none") {
                answer.style.display = "block";
            } else {
                answer.style.display = "none";
            }
        }
    </script>
   
<script>
function scrollToHash() {
    const hash = window.location.hash; // 현재 URL의 #hash 값을 가져옴
    if (hash) {
        const target = document.querySelector(hash); // 해시 값에 해당하는 요소 선택
        if (target) {
            target.scrollIntoView({ behavior: "smooth" }); // 부드럽게 스크롤
            const answer = target.querySelector(".faq-answer"); // 답변 부분 찾기
            if (answer) {
                answer.style.display = "block"; // 답변을 바로 열기
            }
        }
    }
}
     
</script>
<script>
 
function scrollNav(direction) {
    const navScroll = document.querySelector('.nav-scroll'); // 스크롤 컨테이너
    const navItems = document.querySelectorAll('.nav-item'); // 모든 nav-item 요소
    const activeItem = document.querySelector('.nav-item.active'); // 현재 활성화된 항목
    let newIndex;

    // 현재 활성화된 항목의 인덱스 찾기
    const currentIndex = Array.from(navItems).indexOf(activeItem);

    if (direction === 'left') {
        // 왼쪽 버튼 클릭 시 이전 항목으로 이동
        newIndex = currentIndex > 0 ? currentIndex - 1 : 0;
    } else if (direction === 'right') {
        // 오른쪽 버튼 클릭 시 다음 항목으로 이동
        newIndex = currentIndex < navItems.length - 1 ? currentIndex + 1 : navItems.length - 1;
    }

    // 새로 활성화할 항목
    const newActiveItem = navItems[newIndex];

    if (newActiveItem) {
        // 이전 active 클래스 제거
        activeItem.classList.remove('active');
        // 새로 활성화된 항목에 active 클래스 추가
        newActiveItem.classList.add('active');
    }
    //----------------------
    const categoriesContainer = document.querySelector(".categories");
    const categoryName = newActiveItem.textContent.trim();
    const categoryContent = categoryData[categoryName] || "<p>해당 카테고리가 없습니다.</p>";
    // 카테고리 영역 업데이트
    categoriesContainer.innerHTML = categoryContent;
    //----------------------
}
function scrollNav2(direction) {
    const navScroll = document.querySelector('.nav-scroll2'); // 스크롤 컨테이너
    const navItems = document.querySelectorAll('.nav-item2'); // 모든 nav-item 요소
    const activeItem = document.querySelector('.nav-item2.active'); // 현재 활성화된 항목
    let newIndex;

    // 현재 활성화된 항목의 인덱스 찾기
    const currentIndex = Array.from(navItems).indexOf(activeItem);

    if (direction === 'left') {
        // 왼쪽 버튼 클릭 시 이전 항목으로 이동
        newIndex = currentIndex > 0 ? currentIndex - 1 : 0;
    } else if (direction === 'right') {
        // 오른쪽 버튼 클릭 시 다음 항목으로 이동
        newIndex = currentIndex < navItems.length - 1 ? currentIndex + 1 : navItems.length - 1;
    }

    // 새로 활성화할 항목
    const newActiveItem = navItems[newIndex];

    if (newActiveItem) {
        // 이전 active 클래스 제거
        activeItem.classList.remove('active');
        // 새로 활성화된 항목에 active 클래스 추가
        newActiveItem.classList.add('active');
    }
    //----------------------
    const categoryName = newActiveItem.textContent.trim();
    updateFaq(categoryName);
    //----------------------
}
</script>

<script>
// 카테고리 데이터를 정의
const categoryData = {
    "자주찾는": `
    
    	<div class="category">
		<div class="image-container">
		<a href="<%= request.getContextPath() %>/support/MyBird.do">
		<img src="${pageContext.request.contextPath}/images/Level6.png"
		     alt="꼬박꼬박" style="width: 80px; height: 81px;">
			</a>
		</div>
		<a href="<%= request.getContextPath() %>/support/MyBird.do"
			class="category-link">꼬박꼬박 나만의 새</a>
	</div>
	<div class="category">
		<div class="image-container">
			<a href="<%= request.getContextPath() %>/mypage/mypage.do">
				<img src="${pageContext.request.contextPath}/images/Account2.png"
				alt="꼬박꼬박계정">
			</a>
		</div>
		<a href="<%= request.getContextPath() %>/mypage/mypage.do"
			class="category-link">꼬박꼬박 계정</a>
	</div>
	<div class="category">
		<div class="image-container">
			<a href="<%= request.getContextPath() %>/mypage/myBadgeListForm.do">
				<img src="${pageContext.request.contextPath}/images/Badge.png"
				alt="꼬박꼬박 배지">
			</a>
		</div>
		<a href="<%= request.getContextPath() %>/mypage/myBadgeListForm.do"
			class="category-link">꼬박꼬박 뱃지</a>
	</div>
	<div class="category">
		<div class="image-container">
			<a href="<%= request.getContextPath() %>/support/Gift.do"> <img
				src="${pageContext.request.contextPath}/images/Gift.png"
				alt="꼬박꼬박 선물하기"></a>
		</div>
		<a href="<%= request.getContextPath() %>/support/Gift.do"
			class="category-link">꼬박꼬박 선물하기</a>
	</div>
	<div class="category">
		<div class="image-container">
			<a href="<%= request.getContextPath() %>/support/Business.do">
				<img src="${pageContext.request.contextPath}/images/Business.png"
				alt="꼬박꼬박 비즈니스">
			</a>
		</div>
		<a href="<%= request.getContextPath() %>/support/Business.do"
			class="category-link">꼬박꼬박 비즈니스</a>
	</div>
	<div class="category">
		<div class="image-container">
			<a href="<%= request.getContextPath() %>/support/ChallengeHelp.do">
				<img src="${pageContext.request.contextPath}/images/Admin.png"
				alt="꼬박꼬박 서비스">
			</a>
		</div>
		<a href="<%= request.getContextPath() %>/support/ChallengeHelp.do"
			class="category-link">꼬박꼬박 서비스</a>
	</div>
        <div class="category">
		<div class="image-container">
			<a href="<%= request.getContextPath() %>/mypage/mypage.do">
				  <img src="${pageContext.request.contextPath}/images/wallet.png" alt="꼬박꼬박 지갑">
</a>
		</div>
		<a href="<%= request.getContextPath() %>/mypage/mypage.do"
			class="category-link">꼬박꼬박 지갑</a>
	</div>
	<div class="category">
		<div class="image-container">
			<a href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do">
				<img
				src="${pageContext.request.contextPath}/images/Challenge2.png"
				alt="My 챌린지"></a>
		</div>
		<a href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do"
			class="category-link">My 챌린지</a>
			
	</div>
	<div class="category">
		<div class="image-container">
			<a href="<%= request.getContextPath() %>/post/list.do"> <img
				src="${pageContext.request.contextPath}/images/Community.jpg"
				alt="커뮤니티"></a>
		</div>
		<a href="<%= request.getContextPath() %>/post/list.do"
			class="category-link">커뮤니티</a>
	</div>
	<div class="category">
		<div class="image-container">
			<a
				href="<%= request.getContextPath() %>/support/FaqList.do#q1">
				<img src="${pageContext.request.contextPath}/images/Benefit.png"
				alt="꼬박꼬박 혜택쌓기">
			</a>
		</div>
		<a href="<%= request.getContextPath() %>/support/FaqList.do#q1"
			class="category-link">꼬박꼬박 혜택쌓기</a>
	</div>
	<div class="category">
		<div class="image-container">
			<a
				href="<%= request.getContextPath() %>/challenge/challengeList.do">
				<img src="${pageContext.request.contextPath}/images/Book.png"
				alt="챌린지 예약하기">
			</a>
		</div>
		<a
			href="<%= request.getContextPath() %>/challenge/challengeList.do"
			class="category-link">챌린지 예약하기</a>
	</div>
	<div class="category">
		<div class="image-container">
			<a
				href="<%= request.getContextPath() %>/support/FeedBack.do">
				<img src="${pageContext.request.contextPath}/images/FeedBack.png"
				alt="신고하기">
			</a>
		</div>
		<a
			href="<%= request.getContextPath() %>/support/FeedBack.do"
			class="category-link">신고하기</a>
	</div>
</div>
        
    `,
    "커뮤니케이션": `
    	<div class="category">
		<div class="image-container">
			<a href="<%= request.getContextPath() %>/post/list.do"> <img
				src="${pageContext.request.contextPath}/images/Community.jpg"
				alt="커뮤니티"></a>
		</div>
		<a href="<%= request.getContextPath() %>/post/list.do"
			class="category-link">커뮤니티</a>
	</div>
    `,
     "콘텐츠": `
    	 <div class="category">
 		<div class="image-container">
 			<a href="<%= request.getContextPath() %>/mypage/myBadgeListForm.do">
 				<img src="${pageContext.request.contextPath}/images/Badge.png"
 				alt="꼬박꼬박 배지">
 			</a>
 		</div>
 		<a href="<%= request.getContextPath() %>/mypage/myBadgeListForm.do"
 			class="category-link">꼬박꼬박 뱃지</a>
 	</div>
    	<div class="category">
		<div class="image-container">
			<a href="<%= request.getContextPath() %>/post/list.do"> <img
				src="${pageContext.request.contextPath}/images/Community.jpg"
				alt="커뮤니티"></a>
		</div>
		<a href="<%= request.getContextPath() %>/post/list.do"
			class="category-link">커뮤니티</a>
	</div>
	 `,
	 "챌린지": `
		 <div class="category">
			<div class="image-container">
				<a href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do">
					<img
					src="${pageContext.request.contextPath}/images/Challenge2.png"
					alt="My 챌린지"></a>
			</div>
			<a href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do"
				class="category-link">My 챌린지</a>
				
		</div>
		<div class="category">
		<div class="image-container">
			<a
				href="<%= request.getContextPath() %>/challenge/challengeList.do">
				<img src="${pageContext.request.contextPath}/images/Book.png"
				alt="챌린지 예약하기">
			</a>
		</div>
		<a
			href="<%= request.getContextPath() %>/challenge/challengeList.do"
			class="category-link">챌린지 예약하기</a>
	</div>
	 `,
	  "광고": `
			<div class="category">
			<div class="image-container">
				<a href="<%= request.getContextPath() %>/support/Business.do">
					<img src="${pageContext.request.contextPath}/images/Business.png"
					alt="꼬박꼬박 비즈니스">
				</a>
			</div>
			<a href="<%= request.getContextPath() %>/support/Business.do"
				class="category-link">꼬박꼬박 비즈니스</a>
		</div>
	 `,
	  "비즈니스": `
			<div class="category">
			<div class="image-container">
				<a href="<%= request.getContextPath() %>/support/Business.do">
					<img src="${pageContext.request.contextPath}/images/Business.png"
					alt="꼬박꼬박 비즈니스">
				</a>
			</div>
			<a href="<%= request.getContextPath() %>/support/Business.do"
				class="category-link">꼬박꼬박 비즈니스</a>
		</div>
	 `,
	  "기타": `
		  <div class="category">
			<div class="image-container">
				<a href="<%= request.getContextPath() %>/main/main.do"> <img
					src="${pageContext.request.contextPath}/images/Bird2.png"
					alt="꼬박꼬박">
				</a>
			</div>
			<a href="<%= request.getContextPath() %>/main/main.do"
				class="category-link">꼬박꼬박</a>
		</div>
	 `,
    
    // 추가적으로 다른 카테고리도 필요하면 추가
};

// 네비게이션 클릭 이벤트 핸들러
document.addEventListener("DOMContentLoaded", () => {
    const navItems = document.querySelectorAll(".nav-item");
    const categoriesContainer = document.querySelector(".categories");

    navItems.forEach(item => {
        item.addEventListener("click", () => {
            // 활성화된 nav-item 업데이트
            navItems.forEach(nav => nav.classList.remove("active"));
            item.classList.add("active");

            // 클릭된 항목에 해당하는 카테고리 데이터 가져오기
            const categoryName = item.textContent.trim();
            const categoryContent = categoryData[categoryName] || "<p>해당 카테고리가 없습니다.</p>";

            // 카테고리 영역 업데이트
            categoriesContainer.innerHTML = categoryContent;
        });
    });

    // 페이지 로드 시 기본값 (자주찾는 카테고리)
    if (navItems[0]) {
        navItems[0].click();
    }
});
</script>
<script>
// FAQ 데이터를 정의
const faqData = {
    "기능": `
    	<div class="faq-list">
		<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q11">
			꼬박꼬박 <br><br> <strong>계정을 백업하고 복원하려면 어떻게 해야 하나요?</strong></a>
		</div>
		<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/FaqList.do#q12">
			꼬박꼬박 <br><br> <strong>챌린지에서 "나가기" 옵션이 안 보여요.</strong></a>
		</div>
		<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/FaqList.do#q13">
			꼬박꼬박 지갑<br><br> <strong> 꼬박꼬박 지갑은 어떤 기능인가요?</strong></a>
		</div>
		
		<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/FaqList.do#q16">
			꼬박꼬박 <br><br> <strong> 꼬박꼬박 카카오톡 채널은 어떻게 추가하나요?</strong></a>
		</div>
		
		<div class="faq-item">
			<a href="<%= request.getContextPath() %>/support/FaqList.do#q14">
			꼬박꼬박 <br><br> <strong> 배지는 어떻게 받을 수 있나요?</strong></a>
		</div>
		<div class="faq-item">
				<a href="<%= request.getContextPath() %>/support/FaqList.do#q15">
			꼬박꼬박 <br><br> <strong> 챌린지 참가코드는 무엇인가요? </strong></a>
		</div>
		<div class="faq-item">
						<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q1">
			꼬박꼬박 <br><br> <strong> 꼬박꼬박 계정의 비밀번호가 기억나지 않아요.</strong></a>
		</div>
		<div class="faq-item">
				<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q8">
			꼬박꼬박 <br><br> <strong> 꼬박꼬박에 등록된 전화번호를 바꾸고 싶어요.</strong></a>
		</div>
	</div>
    `,
    "계정/인증": `
    	<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q11">
			꼬박꼬박 <br><br> <strong>계정을 백업하고 복원하려면 어떻게 해야 하나요?</strong></a>
		</div>
		<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q1">
꼬박꼬박 <br><br> <strong> 꼬박꼬박 계정의 비밀번호가 기억나지 않아요.</strong></a>
</div>
<div class="faq-item">
<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q8">
꼬박꼬박 <br><br> <strong> 꼬박꼬박에 등록된 전화번호를 바꾸고 싶어요.</strong></a>
</div>
</div>
    `,
    "신고/이용제한": `
    	<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/FaqList.do#q11">
			꼬박꼬박<br><br> <strong> 커뮤니티 이용제한이 적용되는 사유는 어떤 것이 있나요?</strong></a>
		</div>

    	<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/FaqList.do#q17">
			꼬박꼬박<br><br> <strong> 당사자는 아닌데요. 가족, 지인이 이용제한/ 이용자 보호조치를 당해서 대신 문의하고자 해요.</strong></a>
		</div>

    	<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/FaqList.do#q18">
			꼬박꼬박<br><br> <strong> 오픈채팅에서 신고를 받으면 어떻게 되나요?</strong></a>
		</div>
		<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/FaqList.do#q19">
			꼬박꼬박<br><br> <strong> 유명인, 은행 및 기관을 사칭하는 게시글을 올렸어요. 어떻게 대처해야 하나요?</strong></a>
		</div>
		
    `,
    "결제": `
    	<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/RefundGuide.do">
			꼬박꼬박 지갑<br><br> <strong> 선물을 결제 취소 할 수 있나요?</strong></a>
		</div>
		<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/RefundGuide.do">
			꼬박꼬박 지갑<br><br> <strong> 결제취소(청약철회) 또는 환불은 어떻게 하나요?</strong></a>
		</div>
    `,
    "피해 예방": `
    	<div class="faq-item">
		<a href="<%= request.getContextPath() %>/support/FaqList.do#q20">
			꼬박꼬박 지갑<br><br> <strong> 꼬박꼬박을 사칭하는 듯한 SMS를 받았어요. 꼬박꼬박에서 보낸 것이 맞나요?</strong></a>
		</div>
    `,
};

// FAQ 콘텐츠를 업데이트하는 함수
function updateFaq(categoryName) {
    const faqList = document.querySelector(".faq-list");
    const faqContent = faqData[categoryName] || "<p>해당 FAQ가 없습니다.</p>";
    faqList.innerHTML = faqContent;
}

// DOMContentLoaded 이벤트에서 FAQ 초기화
document.addEventListener("DOMContentLoaded", () => {
    const navItems = document.querySelectorAll(".nav-item2");

    navItems.forEach(item => {
        item.addEventListener("click", () => {
            // 'active' 클래스 업데이트
            navItems.forEach(nav => nav.classList.remove("active"));
            item.classList.add("active");

            // 선택된 카테고리의 FAQ 업데이트
            const categoryName = item.textContent.trim();
            updateFaq(categoryName);
        });
    });

    // 초기값 설정 (기능 카테고리 FAQ 표시)
    if (navItems[0]) {
        navItems[0].classList.add("active");
        updateFaq(navItems[0].textContent.trim());
    }
});
</script>
<!-- 팝업창 JavaScript -->
<script>
function openPopup() {
    document.getElementById('popup').style.display = 'flex';
}

function closePopup() {
    document.getElementById('popup').style.display = 'none';
}
</script>
<script>
    // JavaScript 코드를 DOMContentLoaded 안에 추가
    document.addEventListener('DOMContentLoaded', () => {
        // JavaScript 코드 작성
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

	<!-- 메인 -->
	<div class="main">
		<h1>
			 <a href="SupportMain.do" class="main-link">꼬박꼬박 고객센터</a><br> 
		<!-- 병아리 이미지와 말풍선 -->
<span style="display: flex; align-items: center; justify-content: center; gap: 10px;">
    무엇을 도와드릴까요?
    <div style="position: relative;">
        <img src="<%= request.getContextPath() %>/images/Bird3.png" alt="병아리 이미지" class="chick-image">
        <div class="speech-bubble">꼬꼬가 도와줄게!</div>
    </div>
</span>
		</h1>
		
		<form action="Search.do" method="get">
			<input type="text" name="keyword" placeholder="   서비스명과 함께 검색해 보세요."
				style="flex: 1; margin-left: 12px;"> <input type="submit"
				value="">
		</form>
		<div class="keywords">
			<span
				onclick="location.href='${pageContext.request.contextPath}/mypage/modifyPwdForm.do'">비밀번호
				변경</span> <span
				onclick="location.href='${pageContext.request.contextPath}/support/FaqList.do#q11'">이용제한조치</span>
			<span
				onclick="location.href='${pageContext.request.contextPath}/mychallenge/myChallengePart.do'">챌린지
				나가기</span> <span
				onclick="location.href='${pageContext.request.contextPath}/mypage/infoModifyForm.do'">생일
				설정</span> <span
				onclick="location.href='${pageContext.request.contextPath}/support/SupportWrite.do'">1:1
				문의</span>
		</div>
	</div>

	<!-- 공지 -->
	<div class="notice-container">
		<!-- 공지와 텍스트 -->

		<div class="notice-title">
			<button class="notice-button" onclick="openNotice('notice1');">
    공지
</button><script>
    function openNotice(id) {
        // 공지사항 페이지로 이동하며 해시(#id)를 포함
        location.href = `${'<%= request.getContextPath() %>'}/support/NoticeList.do#${id}`;
    }
</script>
			<span
				onclick="location.href='${pageContext.request.contextPath}/support/NoticeList.do#notice1'">[공지]
				꼬박꼬박 챌린지 웹사이트 개설</span>
		</div>
		<!-- 공지 전체보기 -->
		<a href="NoticeList.do" class="notice-link">공지 전체보기 ></a>
	</div>

	<!-- 서비스별 고객센터 -->
	<section class="service-section categories-container">
		<div class="categories-header">
			<h2 class="categories-title">서비스 찾기</h2>
<!-- 팝업창 HTML -->
<div id="popup" class="popup-overlay" style="display: none;">
    <div class="popup-box">
        <div class="popup-header">
            <h2>고객센터 전체 서비스</h2>
            <button class="popup-close" onclick="closePopup()">✕</button>
        </div>
        <div class="popup-search">
            <input type="text" placeholder="서비스명을 검색해 보세요." />
        </div>
        <div class="popup-body">
            <!-- 자주찾는 -->
            <div class="popup-category">
                <h3>자주찾는</h3>
                <div class="popup-category-items">
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Bird2.png" alt="꼬박꼬박">
                        <span>꼬박꼬박</span>
                    </div>
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Account2.png" alt="카카오 계정">
                        <span>꼬박꼬박 계정</span>
                    </div>
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Badge.png" alt="My 구독">
                        <span>My 챌린지</span>
                    </div>
                       <div class="popup-item">
                    <a href="<%= request.getContextPath() %>/support/NoticeList.do">
                        <img src="<%= request.getContextPath() %>/images/FeedBack.png" alt="공지사항">
                        <span>공지사항</span></a>
                    </div>
                </div>
            </div>
            <!-- 커뮤니케이션 -->
            <div class="popup-category">
                <h3>커뮤니케이션</h3>
                <div class="popup-category-items">
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Community.jpg" alt="커뮤니티">
                        <span>커뮤니티</span>
                    </div>
                 
                </div>
            </div>
            <!-- 콘텐츠 -->
            <div class="popup-category">
                <h3>콘텐츠</h3>
                <div class="popup-category-items">
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Benefit.png" alt="꼬박꼬박 배지">
                        <span>꼬박꼬박 배지</span>
                    </div>
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Community.jpg" alt="커뮤니티">
                        <span>커뮤니티</span>
                    </div>
                    <!-- 챌린지 -->
                     <div class="popup-category">
                <h3>챌린지</h3>
                <div class="popup-category-items">
                    <div class="popup-item">
                    	<a
						href="<%= request.getContextPath() %>/challenge/challengeList.do">
                    <img src="${pageContext.request.contextPath}/images/Book.png"alt="챌린지 예약하기">
                    <span>챌린지 예약하기</span></a>
                    </div>
                     <div class="popup-item">
                    	<a
						href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do">
                    <img src="${pageContext.request.contextPath}/images/Challenge2.png"alt="My 챌린지">
                    <span> My 챌린지</span></a>
                    </div>
                    
                    
                 
				</div>
				<a href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do"
					class="category-link">My 챌린지</a>
					
			</div>
				
						<div>
					
				
			</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 서비스 전체보기 버튼 -->
<button onclick="openPopup()" class="service-all-button">서비스 전체보기 &nbsp;𓅰</button>

		</div>
		<!-- 네비게이션바 추가 -->
		<div class="nav-container">
			<div class="nav-wrapper">
				<div class="nav-scroll">
					<div class="nav-item">자주찾는</div>
					<div class="nav-item">커뮤니케이션</div>
					<div class="nav-item">콘텐츠</div>
					<div class="nav-item">챌린지</div>
					<div class="nav-item">광고</div>
					<div class="nav-item">비즈니스</div>
					<div class="nav-item">기타</div>
				</div>
				<div class="nav-arrows">
					<button class="nav-arrow left" onclick="scrollNav('left')">&lt;</button>
					<button class="nav-arrow right" onclick="scrollNav('right')">&gt;</button>
				</div>
			</div>
		</div>

		<div class="categories">
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/main/main.do"> <img
						src="${pageContext.request.contextPath}/images/Bird2.png"
						alt="꼬박꼬박">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/main/main.do"
					class="category-link">꼬박꼬박</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/mypage/mypage.do">
						<img src="${pageContext.request.contextPath}/images/Account2.png"
						alt="꼬박꼬박계정">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/mypage/mypage.do"
					class="category-link">꼬박꼬박 계정</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/mypage/myBadgeListForm.do">
						<img src="${pageContext.request.contextPath}/images/Badge.png"
						alt="꼬박꼬박 배지">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/mypage/myBadgeListForm.do"
					class="category-link">꼬박꼬박 뱃지</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/support/Gift.do"> <img
						src="${pageContext.request.contextPath}/images/Gift.png"
						alt="꼬박꼬박 선물하기"></a>
				</div>
				<a href="<%= request.getContextPath() %>/support/Gift.do"
					class="category-link">꼬박꼬박 선물하기</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/support/Business.do">
						<img src="${pageContext.request.contextPath}/images/Business.png"
						alt="꼬박꼬박 비즈니스">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/support/Business.do"
					class="category-link">꼬박꼬박 비즈니스</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/support/ChallengeHelp.do">
						<img src="${pageContext.request.contextPath}/images/Admin.png"
						alt="꼬박꼬박 서비스">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/support/ChallengeHelp.do"
					class="category-link">꼬박꼬박 서비스</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/support/wallet.do">
						  <img src="${pageContext.request.contextPath}/images/wallet.png" alt="꼬박꼬박 지갑">
        </a>
				</div>
				<a href="<%= request.getContextPath() %>/pocket/wallet.do"
					class="category-link">꼬박꼬박 지갑</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do">
						<img
						src="${pageContext.request.contextPath}/images/Challenge2.png"
						alt="My 챌린지"></a>
				</div>
				<a href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do"
					class="category-link">My 챌린지</a>
					
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/post/list.do"> <img
						src="${pageContext.request.contextPath}/images/Community.jpg"
						alt="커뮤니티"></a>
				</div>
				<a href="<%= request.getContextPath() %>/post/list.do"
					class="category-link">커뮤니티</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a
						href="<%= request.getContextPath() %>/support/FaqList.do#q1">
						<img src="${pageContext.request.contextPath}/images/Benefit.png"
						alt="꼬박꼬박 혜택쌓기">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/support/FaqList.do#q1"
					class="category-link">꼬박꼬박 혜택쌓기</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a
						href="<%= request.getContextPath() %>/challenge/challengeList.do">
						<img src="${pageContext.request.contextPath}/images/Book.png"
						alt="챌린지 예약하기">
					</a>
				</div>
				<a
					href="<%= request.getContextPath() %>/challenge/challengeList.do"
					class="category-link">챌린지 예약하기</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a
						href="<%= request.getContextPath() %>/support/FeedBack.do">
						<img src="${pageContext.request.contextPath}/images/FeedBack.png"
						alt="신고하기">
					</a>
				</div>
				<a
					href="<%= request.getContextPath() %>/support/FeedBack.do"
					class="category-link">신고하기</a>
			</div>
		</div>
	</section>

	<!-- FAQ -->
	<section class="faq">
		<h2>자주 묻는 질문</h2>
		<!-- 추가된 네비게이션 바 -->
<div class="nav-container">
    <div class="nav-wrapper">
        <div class="nav-scroll2">
            <div class="nav-item2">기능</div>
            <div class="nav-item2">계정/인증</div>
            <div class="nav-item2">신고/이용제한</div>
            <div class="nav-item2">결제</div>
            <div class="nav-item2">피해 예방</div>
        </div>
        <div class="nav-arrows">
            <button class="nav-arrow left" onclick="scrollNav2('left')">&lt;</button>
            <button class="nav-arrow right" onclick="scrollNav2('right')">&gt;</button>
        </div>
    </div>
</div>
		<div class="faq-list">
			<div class="faq-item">
			<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q11">
				꼬박꼬박 <br><br> <strong>계정을 백업하고 복원하려면 어떻게 해야 하나요?</strong></a>
			</div>
			<div class="faq-item">
			<a href="<%= request.getContextPath() %>/support/FaqList.do#q12">
				꼬박꼬박 <br><br> <strong>챌린지에서 "나가기" 옵션이 안 보여요.</strong></a>
			</div>
			<div class="faq-item">
			<a href="<%= request.getContextPath() %>/support/FaqList.do#q13">
				꼬박꼬박 지갑<br><br> <strong> 꼬박꼬박 지갑은 어떤 기능인가요?</strong></a>
			</div>
			
			<div class="faq-item">
			<a href="<%= request.getContextPath() %>/support/FaqList.do#q16">
				꼬박꼬박 <br><br> <strong> 꼬박꼬박 카카오톡 채널은 어떻게 추가하나요?</strong></a>
			</div>
			
			<div class="faq-item">
				<a href="<%= request.getContextPath() %>/support/FaqList.do#q14">
				꼬박꼬박 <br><br> <strong> 배지는 어떻게 받을 수 있나요?</strong></a>
			</div>
			<div class="faq-item">
					<a href="<%= request.getContextPath() %>/support/FaqList.do#q15">
				꼬박꼬박 <br><br> <strong> 챌린지 참가코드는 무엇인가요? </strong></a>
			</div>
			<div class="faq-item">
							<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q1">
				꼬박꼬박 <br><br> <strong> 꼬박꼬박 계정의 비밀번호가 기억나지 않아요.</strong></a>
			</div>
			<div class="faq-item">
					<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q8">
				꼬박꼬박 <br><br> <strong> 꼬박꼬박에 등록된 전화번호를 바꾸고 싶어요.</strong></a>
			</div>
		</div>
	</section>
	<!-- 새로운 두 개의 상자 -->
       <div class="faq-extra-container">
    <!-- 첫 번째 상자 -->
    <div class="faq-extra-item">
        <div class="image-container2">
            <img src="${pageContext.request.contextPath}/images/Pencil.png" alt="연필 이미지">
        </div>
        <div class="text-content">
            <h3>답을 찾지 못하셨나요?</h3>
            <p>1:1 문의로 상담직원에게 문의하세요.<br>
             꼼꼼히 확인하여 답변 드리겠습니다.</p>
            <button onclick="location.href='<%= request.getContextPath() %>/support/SupportWrite.do';">1:1 문의하기</button>
        </div>
    </div>
    <!-- 두 번째 상자 -->
    <div class="faq-extra-item">
        <div class="image-container2">
            <img src="${pageContext.request.contextPath}/images/FeedBack2.png" alt="신고 이미지">
        </div>
        <div class="text-content">
            <h3>신고가 필요하신가요?</h3>
            <p>꼬박꼬박 신고센터를 통해 유해정보, 권리침해,<br>
             불법촬영물 등의 콘텐츠 신고를 하실 수 있습니다.</p>
            <button onclick="location.href='<%= request.getContextPath() %>/support/FeedBack.do';">신고 바로가기</button>
        </div>
    </div>
</div>





    <!-- 푸터 -->
    <div class="footer">
        <a href="ChallengeHelp.do">챌린지 안내</a> |
        <a href="SupportWrite.do">1:1 문의</a> |
        <a href="<%= request.getContextPath() %>/mypage/mypage.do">마이페이지</a> |
        <a href="NoticeList.do">공지사항</a>
    </div>
</body>
</html>
