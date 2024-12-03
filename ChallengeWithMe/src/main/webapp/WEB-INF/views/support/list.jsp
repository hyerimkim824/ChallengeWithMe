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
        /* 🐤 전체 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff9c4;
        }

        /* 🐤 헤더 스타일 */
 
        .header {
            background-color: #ffeb3b;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
          h1, h2 {
            margin: 0;
            padding: 10px;
            color: #333;
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
        
  

        .header a {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: #333;
            background-color: #fff;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .header a:hover {
            background-color: #ffcc00;
            color: #fff;
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
/* 링크 스타일 */
.list-table a {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 링크 색상을 기본 텍스트 색상으로 */
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

        
         .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: #fff9c4;
            padding: 20px;
            border-radius: 15px;
            width: 300px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .modal-content h3 {
            margin: 0 0 15px;
            color: #333;
            font-size: 18px;
            font-weight: bold;
        }
        .modal-content input[type="password"] {
            width: 90%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        .modal-content button {
            padding: 8px 20px;
            background-color: #ffcc00;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.3s;
        }
        .modal-content button:hover {
            background-color: #ffa000;
        }
        .modal-content .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 18px;
            color: #888;
            cursor: pointer;
        }
        .modal-content .close:hover {
            color: #333;
        }
    </style>
      <script>
   // 팝업 모달 제어 🐰✨
      function showPasswordModal(supNum) {
          const modal = document.getElementById("passwordModal");
          modal.style.display = "flex";
          document.getElementById("supNumInput").value = supNum;
      }

      function closePasswordModal() {
          document.getElementById("passwordModal").style.display = "none";
      }

      function submitPassword() {
          const supNum = document.getElementById("supNumInput").value;
          const supPwd = document.getElementById("supPwdInput").value;

          if (supPwd.trim() === "") {
              alert("비밀번호를 입력해주세요 🐰");
              return;
          }

          const form = document.getElementById("passwordForm");
          form.action = 'Detail.do';
          form.submit();
      }
    </script>
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
        <a href="${pageContext.request.contextPath}/support/List.do">1:1 문의</a>
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
             <a href="${pageContext.request.contextPath}/support/CommunityHelp.do">꼬박꼬박 나의 새</a>
        </div>

        <!-- 🐤 피드백 테이블 -->
     <div class="content">
       <h2>1:1 문의 목록</h2>
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
          <c:forEach var="support" items="${list}">
                    <tr>
                        <td>${support.sup_num}</td>
                        <td>${support.supPickString}</td> <!-- 유형 조건 -->
                      
                          <td>
    <!-- 비공개 게시물일 경우 팝업창 띄우기 -->
    
    <c:if test="${support.sup_visi == 1}">
        <a href="javascript:void(0);" onclick="showPasswordModal(${support.sup_num})">
            ${support.sup_title}
        </a>
    </c:if>

    <!-- 공개 게시물일 경우 -->
    <c:if test="${support.sup_visi == 0}">
        <a href="Detail.do?sup_num=${support.sup_num}">${support.sup_title}</a>
    </c:if>
</td>
                        <td>${support.us_nickname}</td> <!-- 작성자 닉네임 표시 -->
                        <td><fmt:formatDate value="${support.sup_date}" pattern="yyyy-MM-dd" /></td>
                        <td>
                        	<c:if test="${support.sup_visi==0}">공개</c:if>
                        	<c:if test="${support.sup_visi==1}">비공개</c:if>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty supportList}">
                    <tr>
                        
                    </tr>
                </c:if>
            </tbody>
        </table>
            <!-- 게시글 작성 버튼 -->
            <div style="text-align: right; margin: 20px 0.5%;">
                <a href="SupportWrite.do" style="display: inline-block; text-decoration: none; color: #333; background-color: #fff; padding: 10px 20px; border-radius: 5px; font-size: 14px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); transition: all 0.3s ease;">
                    1:1문의 작성 💌
                </a>
            </div>
 <!-- 🐤 비밀번호 입력 팝업 -->
    <div id="passwordModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closePasswordModal()">&times;</span>
        <h3>비공개 게시물입니다 🤫</h3>
        <form id="passwordForm" method="post">
            <input type="hidden" id="supNumInput" name="sup_num">
            <input type="password" id="supPwdInput" name="sup_pwd" placeholder="비밀번호를 입력하세요">
            <button type="button" onclick="submitPassword()">확인</button>
        </form>
    </div>
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

  

</body>
</html>
