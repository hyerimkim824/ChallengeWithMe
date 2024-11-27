<%@page import="kr.support.vo.SupportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>문의 내역</title>
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

        /* 메인 콘텐츠 */
        .content {
            flex-grow: 1;
            padding: 20px;
            background-color: #ffffff;
        }

        .list-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .list-table th, .list-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .list-table th {
            background-color: #fdd835;
            color: #333;
        }

        .list-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .list-table tr:hover {
            background-color: #fffde7;
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

    </style>
    <script>
        // 비공개 게시물 클릭 시 모달을 띄우는 함수
        function showPrivatePostMessage() {
            // 모달 표시
            var modal = document.getElementById("myModal");
            modal.style.display = "block";
        }

        // 모달 닫기 함수
        function closeModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }
    </script>
</head>
<body>
    <!-- 🐤 헤더 -->
    <div class="header">
        <h1>고객센터</h1>
        <div class="search-bar">
            <input type="text" placeholder="자주 묻는 질문 검색">
            <button>검색</button>
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
        </div>

        <!-- 🐤 콘텐츠 -->
        <div class="content">
            <h2>문의 내역</h2>
            <table class="list-table">
                <thead>
                    <tr>  
                        <th>번호</th>
                        <th>문의 유형</th>
                        <th>문의 제목</th>
                        <th>작성자</th> <!-- 작성자 닉네임 추가 -->
                        <th>문의 날짜</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 문의 내역 데이터 출력 -->
                    <c:forEach var="inquiry" items="${list}">
                        <tr>
                            <td>${inquiry.sup_num}</td>
                            <td>${inquiry.supPickString}</td> <!-- 유형 조건 -->
                            <td>
                                <!-- 비공개 게시물일 경우 팝업창 띄우기 -->
                                <c:if test="${inquiry.sup_visi == 1 and us_num!=inquiry.us_num}">
                                    <a href="javascript:void(0);" onclick="showPrivatePostMessage()">${inquiry.sup_title}</a>
                                </c:if>
                                <c:if test="${inquiry.sup_visi == 0 or (inquiry.sup_visi == 1 and us_num==inquiry.us_num)}">
                                    <a href="Detail.do?sup_num=${inquiry.sup_num}">${inquiry.sup_title}</a>
                                </c:if>
                            </td>
                            <td>${inquiry.us_nickname}</td> <!-- 작성자 닉네임 표시 -->
                            <td><fmt:formatDate value="${inquiry.sup_date}" pattern="yyyy-MM-dd" /></td>
                            <td>
                            	<c:if test="${inquiry.sup_visi==0}">공개</c:if>
                            	<c:if test="${inquiry.sup_visi==1}">비공개</c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty list}">
                        <tr>
                            <td colspan="6">문의 내역이 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>

            <!-- 게시글 작성 버튼 -->
            <div style="text-align: right; margin: 20px 0.5%;">
                <a href="SupportWriteForm.do" style="display: inline-block; text-decoration: none; color: #333; background-color: #fff; padding: 10px 20px; border-radius: 5px; font-size: 14px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); transition: all 0.3s ease;">
                    1:1문의 작성 💌
                </a>
            </div>

            <!-- 🐤 페이징 -->
            <div class="pagination">
                ${totalPages}
            </div>
        </div>
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
