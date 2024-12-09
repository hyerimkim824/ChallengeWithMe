<%@page import="kr.support.vo.SupportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>문의 내역</title>
   
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
