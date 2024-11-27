<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>아이디/비밀번호 찾기</title>
</head>
<body>
    <!-- 고객센터 헤더 -->
    <header>
        <h1>고객센터</h1>
        <form action="Search.do" method="get">
            <input type="text" name="query" placeholder="자주묻는 질문 검색">
            <button type="submit">검색</button>
        </form>
    </header>

    <!-- 상단 메뉴 -->
    <nav>
        <ul>
            <li><a href="List.do">문의 내역</a></li>
            <li><a href="FaqList.do">자주묻는 질문</a></li>
            <li><a href="FeedBack.do">고객의 소리</a></li>
        </ul>
    </nav>

    <!-- 좌측 메뉴 -->
    <aside>
        <ul>
            <li><a href="FaqList.do">자주묻는질문</a></li>
            <li><a href="LoginaAcount.do">로그인 및 계정</a></li>
            <li><a href="RefundGuide.do">결제 및 환불</a></li>
            <li><a href="ChallengeHelp.do">꼬박꼬박 챌린지</a></li>
            <li><a href="CommunityHelp.do">꼬박꼬박 커뮤니티</a></li>
        </ul>
    </aside>

    <!-- 아이디/비밀번호 찾기 -->
    <main>
        <h2>아이디/비밀번호 찾기</h2>

        <!-- 탭 메뉴 -->
        <div>
            <button onclick="location.href='findID.do'">아이디 찾기</button>
            <button onclick="location.href='findPassword.do'">비밀번호 찾기</button>
        </div>

        <!-- 선택 및 입력 폼 -->
        <form action="findIDResult.do" method="post">
            <p>아이디를 찾을 방법을 선택해 주세요</p>
            <label>
                <input type="radio" name="findMethod" value="email" required> 가입한 이메일로 찾기
            </label>
            <input type="text" name="email" placeholder="이메일을 입력하세요">

            <label>
                <input type="radio" name="findMethod" value="phone"> 가입 가능한 휴대폰으로 찾기
            </label>
            <input type="text" name="phone" placeholder="휴대폰 번호를 입력하세요">

            <button type="submit">아이디 찾기</button>
        </form>
    </main>

    <!-- 하단 메뉴 -->
    <footer>
        <ul>
            <li><a href="ChallengeMain.do">챌린지 홈</a></li>
            <li><a href="SupportWrite.do">1:1문의</a></li>
            <li><a href="MyPage.do">마이페이지</a></li>
            <li><a href="notice.do">공지사항</a></li>
        </ul>
    </footer>
</body>
</html>
