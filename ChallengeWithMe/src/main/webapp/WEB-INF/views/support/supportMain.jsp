<%@page import="kr.support.vo.SupportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        }

        header .menu {
            color: #777;
        }

        /* 메인 영역 */
        .main {
            text-align: center;
            padding: 50px 20px;
        }

        .main h1 {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 20px;
            line-height: 1.5;
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
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .categories {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }

        .category {
            width: 101px;
            text-align: center;
        }

        .category img {
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .category span {
            font-size: 14px;
        }

        /* FAQ 섹션 */
        .faq {
            padding: 40px 20px;
            background-color: #fff;
        }

        .faq h2 {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
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
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .faq-item {
            width: 30%;
            background: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            font-size: 14px;
            text-align: center;
            transition: all 0.3s ease;
        }

        .faq-item:hover {
            background: #6200ee;
            color: white;
            border-color: #6200ee;
        }

        .faq-item strong {
            display: block;
            font-size: 14px;
            margin-bottom: 10px;
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
    right: 80px; /* 오른쪽 여백 */
    top: 50%; /* 수직 가운데 정렬 */
    transform: translateY(-50%); /* 수직 정렬 보정 */
    font-size: 12px;
    color: #6200ee; /* 링크 색상 */
    font-weight: bold;
    text-decoration: none;
}
   .notice-link:hover {
    text-decoration: underline; /* 호버 시 밑줄 추가 */
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
    font-size: 14px; /* 텍스트 크기 */
    color: #333; /* 기본 텍스트 색상 */
    text-decoration: none; /* 밑줄 제거 */
    display: inline-block; /* 블록처럼 동작 */
    margin-top: 10px; /* 이미지와 간격 유지 */
}

    /* 이미지 컨테이너 스타일 */
    .image-container {
        background-color: #ffeb3b; /* 노란색 배경 */
        padding: 10px; /* 이미지와 배경 사이 여백 */
        display: inline-block; /* 이미지를 감싸는 박스 크기 조절 */
        border-radius: 10px; /* 모서리 둥글게 */
    }

    .image-container img {
        display: block; /* 이미지의 기본 블록 정렬 */
        max-width: 100%; /* 이미지 크기 제한 */
        height: auto; /* 이미지 비율 유지 */
        border-radius: 10px; /* 이미지도 둥글게 */
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
     <a class="menu-link" aria-label="menu-link">   한국어</a> | <a href="<%= request.getContextPath() %>/xuser/Login.do" class="menu-link" aria-label="menu-link">로그인</a>
    </div>
</header>

    <!-- 메인 -->
    <div class="main">
    <h1>
        <a href="SupportMain.do" class="main-link">꼬박꼬박 고객센터</a><br>
        무엇을 도와드릴까요?
    </h1>
    <input type="text" placeholder="서비스명과 함께 검색해 보세요.">
    <div class="keywords">
    <span onclick="location.href='${pageContext.request.contextPath}/mypage/modifyPwdFrom.do'">비밀번호 변경</span>
  <span onclick="location.href='${pageContext.request.contextPath}/support/FaqList.do#q4'">이용제한조치</span>
    <span>챌린지 나가기</span>
    <span>생일 설정</span>
    <span>1:1 문의</span>
</div>
</div>

    <!-- 공지 -->
<div class="notice-container">
    <!-- 공지와 텍스트 -->
    
    <div class="notice-title">
    <button class="notice-button" onclick="location.href='${pageContext.request.contextPath}/support/NoticeList.do'">공지</button>
    <span onclick="location.href='${pageContext.request.contextPath}/support/NoticeList.do#notice1'">[공지] 꼬박꼬박 챌린지 웹사이트 개설</span>
</div>
    <!-- 공지 전체보기 -->
    <a href="NoticeList.do" class="notice-link">공지 전체보기</a>
</div>

    <!-- 서비스별 고객센터 -->
    <section class="categories-container">
        <h2 class="categories-title">서비스 찾기</h2>
        <div class="categories">
             <div class="category">
    <div class="image-container" >
        <a href="<%= request.getContextPath() %>/main/main.do">
            <img src="${pageContext.request.contextPath}/images/Bird2.png" alt="꼬박꼬박">
        </a>
    </div>
    <a href="<%= request.getContextPath() %>/main/main.do" class="category-link">꼬박꼬박</a>
</div>
        <div class="category">
    <div class="image-container">
     <a href="<%= request.getContextPath() %>/support/LoginaAcount.do">
        <img src="${pageContext.request.contextPath}/images/Account2.png" alt="꼬박꼬박계정"></a>
    </div>
    <a href="<%= request.getContextPath() %>/support/LoginaAcount.do" class="category-link">꼬박꼬박 계정</a>
</div>
            <div class="category">
                 <div class="image-container">
                 <a href="<%= request.getContextPath() %>/mypage/myBadgeListForm.do">
        <img src="${pageContext.request.contextPath}/images/Badge.png" alt="꼬박꼬박 뱃지"></a>
    </div>
            <a href="<%= request.getContextPath() %>/mypage/myBadgeListForm.do" class="category-link">꼬박꼬박 뱃지</a>
            </div>
            <div class="category">
                 <div class="image-container">
                 <a href="<%= request.getContextPath() %>/gift/Gift.do">
        <img src="${pageContext.request.contextPath}/images/Gift.png" alt="꼬박꼬박 선물하기"></a>
    </div>
            <a href="<%= request.getContextPath() %>/gift/Gift.do" class="category-link">꼬박꼬박 선물하기</a>
            </div>
            <div class="category">
                 <div class="image-container">
                 <a href="<%= request.getContextPath() %>/business/Business.do">
        <img src="${pageContext.request.contextPath}/images/Business.png" alt="꼬박꼬박 비즈니스"></a>
    </div>
            <a href="<%= request.getContextPath() %>/Business/Business.do" class="category-link">꼬박꼬박 비즈니스</a>
            </div>
            <div class="category">
                <div class="image-container">
                <a href="<%= request.getContextPath() %>/support/ChallengeHelp.do">
        <img src="${pageContext.request.contextPath}/images/Admin.png" alt="꼬박꼬박 서비스"></a>
    </div>
            <a href="<%= request.getContextPath() %>/support/ChallengeHelp.do" class="category-link">꼬박꼬박 서비스</a>
            </div>
        </div>
    </section>

    <!-- FAQ -->
    <section class="faq">
        <h2>자주 묻는 질문</h2>
        <div class="faq-tabs">
            <button class="active">기능</button>
            <button>계정/인증</button>
            <button>신고/이용제한</button>
            <button>결제</button>
            <button>피해 예방</button>
        </div>
        <div class="faq-list">
            <div class="faq-item">
                <strong>꼬박꼬박</strong>
                계정을 백업하고 복원하려면 어떻게 해야 하나요?
            </div>
            <div class="faq-item">
                <strong>꼬박꼬박</strong>
                챌린지에서 "나가기" 옵션이 안 보여요.
            </div>
            <div class="faq-item">
                <strong>꼬박꼬박 지갑</strong>
                꼬박꼬박 지갑은 어떤 기능인가요?
            </div>
        </div>
    </section>
    <body>
    <!-- 페이지의 콘텐츠 -->

  
</body>
    
</body>
</html>
