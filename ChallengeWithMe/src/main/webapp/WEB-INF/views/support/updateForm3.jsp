<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 수정</title>
  
</head>
<body>

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

    <div class="nav">
        <a href="${pageContext.request.contextPath}/support/List.do">문의 내역</a>
        <a href="${pageContext.request.contextPath}/support/FaqList.do">자주 묻는 질문</a> 
        <a href="${pageContext.request.contextPath}/support/FeedBackList.do">고객의 소리</a>
    </div>

    <div class="container">
        <div class="sidebar">
            <a href="${pageContext.request.contextPath}/support/FaqList.do">자주 묻는 질문</a> 
            <a href="${pageContext.request.contextPath}/support/LoginaAcount.do">로그인 및 계정</a> 
            <a href="${pageContext.request.contextPath}/support/RefundGuide.do">결제 및 환불</a> 
            <a href="${pageContext.request.contextPath}/support/ChallengeHelp.do">꼬박꼬박 챌린지</a> 
            <a href="${pageContext.request.contextPath}/support/CommunityHelp.do">꼬박꼬박 커뮤니티</a>
        </div>
        <div class="content">
        
            <h2>1:1 문의 수정</h2>

            <!-- 수정 폼 -->
            <form action="${pageContext.request.contextPath}/support/Update.do" method="post" enctype="multipart/form-data">
                
                <!-- 문의 번호 (숨겨진 필드) -->
                <input type="hidden" name="sup_num" value="${support.sup_num}">
                
                <!-- 제목 입력 -->
                <div class="form-group">
                    <label for="sup_title">문의 제목</label>
                    <input type="text" id="sup_title" name="sup_title" value="${support.sup_title}" required>
                </div>

                <!-- 내용 입력 -->
                <div class="form-group">
                    <label for="sup_content">문의 내용</label>
                    <textarea id="sup_content" name="sup_content" rows="6" required>${support.sup_content}</textarea>
                </div>

                <!-- 공개 여부 -->
                <div class="form-group">
                    <label for="sup_visi">공개 여부</label>
                    <select id="sup_visi" name="sup_visi" onchange="togglePasswordField()">
                        <option value="1" ${support.sup_visi == 1 ? "selected" : ""}>공개</option>
                        <option value="0" ${support.sup_visi == 0 ? "selected" : ""}>비공개</option>
                    </select>
                </div>

                <!-- 비공개 비밀번호 -->
                <div class="form-group" id="sup_pwd">
                    <label for="sup_pwd_input" class="form-label">비공개 비밀번호 (숫자 4자리)</label>
                    <input type="password" id="sup_pwd_input" name="sup_pwd" class="form-control" placeholder="비공개 비밀번호를 입력해주세요" maxlength="4">
                </div>

                <!-- 수정하기 버튼 -->
                <div>
                    <button type="submit">수정하기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
