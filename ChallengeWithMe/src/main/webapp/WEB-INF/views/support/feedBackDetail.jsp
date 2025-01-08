<%@page import="kr.support.vo.SupportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>피드 내역</title>
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1, h2 {
            margin: 0;
            padding: 10px;
            color: #333;
           
        }

        /* 헤더 */
        .header {
            background-color: #ffeb3b;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header input[type="text"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .header button {
            padding: 5px 10px;
            background-color: #fdd835;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        /* 네비게이션 */
        .nav {
            display: flex;
            justify-content: space-around;
            background-color: #fff;
            padding: 10px 0;
        }

        .nav a {
            text-decoration: none;
            color: #333;
            padding: 10px 20px;
        }

        .nav a:hover {
            background-color: #fdd835;
            color: #fff;
            border-radius: 5px;
        }

        /* 컨테이너 (Flexbox 레이아웃) */
        .container {
            display: flex;
            flex-direction: row;
        }

        /* 사이드바 */
        .sidebar {
            width: 20%;
            background-color: #fff9c4;
            padding: 15px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar a {
            display: block;
            text-decoration: none;
            color: #333;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background-color: #fdd835;
            color: #fff;
        }

        /* 메인 콘텐츠 스타일 */
        main {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        flex-grow: 1;
            padding: 20px;
        }
        

         .content h2 {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
            border-bottom: 2px solid #ffcc00;
            padding-bottom: 10px;
            font-size: 1.5em;
        }

        .detail-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .detail-table th, .detail-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .detail-table th {
            background-color: #fdd835;
            color: #333;
            font-weight: bold;
        }

        .detail-table tr:nth-child(even) {
            background-color: #fff9c4;
        }
 /* 버튼 스타일 */
        .buttons {
            text-align: center;
            
        }

        .buttons .button {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background-color: #ffcc00;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .buttons .button:hover {
            background-color: #ff9900;
        }
             /* 비밀번호 입력 폼 스타일 */
        .password-form {
            margin-top: 20px;
            text-align: center;
        }
        /* 🐤 페이징 스타일 */
        .pagination {
            text-align: center;
            margin: 20px 0;
        }

        .pagination a {
            display: inline-block;
            margin: 0 5px;
            padding: 10px 15px;
            color: #333;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-decoration: none;
            background-color: #fff;
            transition: all 0.3s ease;
        }

        .pagination a:hover {
            background-color: #ffcc00;
            color: #fff;
        }

        .pagination .current {
            background-color: #ffcc00;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            border: none;
        }

        /* 푸터 */
        .footer {
            clear: both;
            text-align: center;
            padding: 10px 0;
            background-color: #fdd835;
        }

        .footer a {
            text-decoration: none;
            color: #333;
            padding: 5px 10px;
        }

        .footer a:hover {
            text-decoration: underline;
        }

      /* 팝업창 스타일 */
.modal {
    display: none; /* 기본적으로 숨겨둔다 */
    position: fixed; /* 고정 위치 */
    z-index: 1; /* 다른 콘텐츠 위에 보이게 */
    left: 0;
    top: 0;
    width: 100%; /* 전체 화면 */
    height: 100%; /* 전체 화면 */
    overflow: auto; /* 필요 시 스크롤 */
    background-color: rgba(0,0,0,0.5); /* 배경을 반투명하게 */
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* 80% 너비 */
    max-width: 500px;
    border-radius: 8px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
}

/* 닫기 버튼 스타일 */
.close {
    color: #aaa;
    font-size: 28px;
    font-weight: bold;
    position: absolute;
    top: 10px;
    right: 25px;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
/* 표의 첫 번째 열의 너비를 줄이는 CSS */
.detail-table th:nth-child(1), .detail-table td:nth-child(1) {
    width: 150px; /* 원하는 너비로 설정 */
    word-wrap: break-word; /* 텍스트가 길어지면 줄바꿈이 되게 설정 */
    white-space: normal;  /* 텍스트가 줄 바꿈 되게 설정 */
}
.img-preview {
    max-width: 100%;
    max-height: 300px;
    border: 1px solid #ddd;
    padding: 5px;
    margin-top: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}


    </style>

</head>
<body>
    <!-- 🐤 헤더 -->
    <div class="header">
        <h1>고객센터</h1>
         <div class="search-bar">
        <form action="Search.do" method="get" style="display: flex; align-items: center;">
            <!-- 검색어 입력 -->
            <input type="text" name="keyword" placeholder="자주 묻는 질문 검색" style="flex: 1; padding: 5px; border: 1px solid #ccc; border-radius: 5px;" required>
            <!-- 검색 버튼 -->
            <button type="submit" style="padding: 5px 10px; background-color: #fdd835; border: none; cursor: pointer; border-radius: 5px; margin-left: 10px;">검색</button>
        </form>
    </div>
    </div>

    <!-- 네비게이션 -->
    <div class="nav">
        <a href="${pageContext.request.contextPath}/support/List.do">문의 내역</a>
        <a href="${pageContext.request.contextPath}/support/FaqList.do">자주 묻는 질문</a>
        <a href="${pageContext.request.contextPath}/support/FeedBackList.do">고객의 소리</a>
    </div>

    <!-- 🐤 메인 컨테이너 -->
    <div class="container">
        <!-- 사이드바 -->
        <div class="sidebar">
            <a href="${pageContext.request.contextPath}/support/FaqList.do">자주 묻는 질문</a>
            <a href="${pageContext.request.contextPath}/support/LoginaAcount.do">로그인 및 계정</a>
            <a href="${pageContext.request.contextPath}/support/RefundGuide.do">결제 및 환불</a>
            <a href="${pageContext.request.contextPath}/support/ChallengeHelp.do">꼬박꼬박 챌린지</a>
            <a href="${pageContext.request.contextPath}/support/CommunityHelp.do">꼬박꼬박 커뮤니티</a>
              <a href="${pageContext.request.contextPath}/support/MyBird.do">꼬박꼬박 나만의 새</a>
        </div>

           <!-- 메인 콘텐츠 -->
        <main>
            <section class="content">
                <h2>피드백 상세 정보 </h2>
                <table class="detail-table">
                    <tr>
                        <th>문의 제목</th>
                        <td>${feedback.sup_title}</td>
                    </tr>
                    <tr>
                        <th>문의 유형</th>
                        <td>${feedback.sup_pick}</td> <!-- 문의 유형을 문자열로 표시 -->
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${feedback.us_nickname}</td> <!-- 작성자 닉네임 표시 -->
                    </tr>
                    <tr>
                        <th>문의 내용</th>
                        <td><pre>${feedback.sup_content}</pre></td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td><fmt:formatDate value="${feedback.sup_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td> <!-- 작성일 포맷 -->
                    </tr>
                    <!-- 첨부 파일 목록을 테이블에 추가 -->
                    <tr>
                        <th>첨부 파일</th>
                        <td>
                            <c:if test="${!empty support.sup_img}">
                            <img src="${pageContext.request.contextPath}/upload/${feedback.sup_img}" alt="첨부 파일" class="img-preview"/>
                            
                                <a href="<%=request.getContextPath()%>/upload/${feedback.sup_img}" download>파일 다운로드 📂</a>
                            </c:if>
                            <c:if test="${empty feedback.sup_img}">
                                <span> 첨부 파일이 없습니다</span>
                            </c:if>
                        </td>
                    </tr>
                </table>


                <div class="buttons">
                    <a href="<%=request.getContextPath()%>/support/List.do" class="button">문의 내역</a>
                    <a href="<%=request.getContextPath()%>/support/FeedBackUpdateForm.do?sup_num=${feedback.sup_num}" class="button">수정하기</a>
                    <a href="<%=request.getContextPath()%>/support/Delete.do?sup_num=${feedback.sup_num}" class="button">삭제하기</a>
                
                </div>
            </section>
        </main>

    </div>

    <!-- 푸터 -->
    <div class="footer">
        <a href="ChallengeHelp.do">챌린지 안내</a> |
        <a href="SupportWrite.do">1:1 문의</a> |
        <a href="${pageContext.request.contextPath}/mypage/mypage.do">마이페이지</a> |
        <a href="${pageContext.request.contextPath}/common/notice.do">공지사항</a>
    </div>

   <!-- 팝업 모달 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <p>작성자 본인만 확인할 수 있는 게시물입니다. 🐇</p>
        <!-- 안내 메시지 추가 -->
        <p>본 게시물은 다른 사용자가 확인할 수 없습니다. 본인만 확인 가능합니다.</p>
    </div>
</div>
</body>
</html>
