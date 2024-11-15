<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>환불 안내</title>
</head>
<body>
    <div id="wrapper">
        <!-- 헤더 영역 -->
        <header>
            <h1>고객센터</h1>
            <div id="search-bar">
                <input type="text" placeholder="자주묻는 질문 검색" />
                <button>검색</button>
            </div>
        </header>

        <!-- 네비게이션 메뉴 -->
        <nav>
            <ul>
                <li><a href=List.do">문의 내역</a></li>
                <li><a href="FaqList.do">자주묻는 질문</a></li>
                <li><a href="FeedBack.do">고객의 소리</a></li>
            </ul>
        </nav>

        <!-- 사이드바 -->
        <aside>
            <ul>
                <li><a href="FaqList.do">자주묻는질문</a></li>
                <li><a href="loginAccount.do">로그인 및 계정</a></li>
                <li><a href="refundGuide.do" class="active">결제 및 환불</a></li>
                <li><a href="challengeInfo.do">꼬박꼬박 챌린지</a></li>
                <li><a href="community.do">꼬박꼬박 커뮤니티</a></li>
            </ul>
        </aside>

        <!-- 메인 콘텐츠 -->
        <main>
            <h2>환불 안내</h2>
            <ul>
                <c:forEach var="refund" items="${refundList}">
                    <li>${refund.title}</li>
                </c:forEach>
            </ul>

            <!-- 페이지네이션 -->
            <div id="pagination">
                <a href="?page=1">&lt;&lt;</a>
                <c:forEach var="pageNum" begin="1" end="${totalPages}">
                    <a href="?page=${pageNum}" class="${pageNum == currentPage ? 'active' : ''}">
                        ${pageNum}
                    </a>
                </c:forEach>
                <a href="?page=${totalPages}">&gt;&gt;</a>
            </div>
        </main>

        <!-- 하단 푸터 -->
        <footer>
            <ul>
                <li><a href="ChallengeHelp.do">챌린지 안내</a></li>
                <li><a href="SupportWriteForm.do">1:1 문의</a></li>
                <li><a href="mypage.do">마이페이지</a></li>
                <li><a href="notice.do">공지사항</a></li>
            </ul>
        </footer>
    </div>
</body>
</html>
