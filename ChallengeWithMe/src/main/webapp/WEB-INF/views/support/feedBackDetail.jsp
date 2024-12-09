<%@page import="kr.support.vo.SupportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>피드 내역</title>
  

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
