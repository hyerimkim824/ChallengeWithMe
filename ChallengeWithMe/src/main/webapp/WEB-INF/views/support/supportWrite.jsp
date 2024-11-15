<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의 작성</title>
</head>
<body>
    <!-- 상단 헤더 -->
    <header>
        <h1>고객센터</h1>
    </header>
    
    <!-- 검색창 -->
    <div class="search-bar">
        <!-- 검색창 필드 -->
        <input type="text" placeholder="자주 묻는 질문 검색" name="searchKeyword">
        <button type="button">검색</button>
    </div>
    
    <!-- 네비게이션 메뉴 -->
    <nav>
        <ul>
            <!-- 각 페이지로 이동할 수 있는 링크 -->
            <li><a href="inquiryList.jsp">문의 내역</a></li>
            <li><a href="faqList.jsp">자주 묻는 질문</a></li>
            <li><a href="feedBackList.jsp">고객의 소리</a></li>
        </ul>
    </nav>
    
    <!-- 본문: 1:1 문의 작성 폼 -->
    <h2>1:1 문의</h2>
    <form action="supportWriteForm.jsp" method="post">
        <!-- 문의 유형 선택 -->
        <label for="category">문의 유형:</label>
        <select name="category" id="category" required>
            <option value="">선택하세요</option>
            <option value="1">건강</option>
            <option value="2">경제</option>
            <option value="3">식습관</option>
            <option value="4">스터디</option>
            <option value="5">자기개발</option>
            <option value="6">기타</option>
        </select>
        <br>

        <!-- 문의 제목 입력 -->
        <label for="title">문의 제목:</label>
        <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
        <br>

        <!-- 문의 내용 입력 -->
        <label for="content">문의 내용:</label>
        <textarea id="content" name="content" rows="10" placeholder="내용을 입력하세요" required></textarea>
        <br>

        <!-- 문의 상태 선택 -->
        <label for="visibility">문의 상태:</label>
        <select name="visibility" id="visibility" required>
            <option value="1">비공개</option>
            <option value="2">공개</option>
        </select>
        <br>

        <!-- 제출 버튼 -->
        <button type="submit">등록하기</button>
    </form>
    
    <!-- 하단 푸터 -->
    <footer>
        <p>ⓒ 챌린지 윗미 | 1:1문의 | 마이페이지 | 공지사항</p>
    </footer>
</body>
</html>
