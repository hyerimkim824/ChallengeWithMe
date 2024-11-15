<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>권한 없음</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>고객센터</h1>
            <nav>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/support/List.do">문의 내역</a></li>
                    <li><a href="<%= request.getContextPath() %>/support/FaqList.do">자주 묻는 질문</a></li>
                    <li><a href="<%= request.getContextPath() %>/support/RefundGuide.do">환불 안내</a></li>
                </ul>
            </nav>
        </header>
        
        <main class="main-content">
            <h2>권한이 없습니다</h2>
            <p>이 작업을 수행할 권한이 없습니다. 😥</p>
            <p>잘못된 접근일 수 있으니, 다시 확인해주세요.</p>
            <div class="btn-container">
                <a href="<%= request.getContextPath() %>/support/List.do" class="btn">문의 내역으로 돌아가기</a>
                <a href="<%= request.getContextPath() %>/main/Main.do" class="btn">홈으로 돌아가기</a>
            </div>
        </main>
        
        <footer class="footer">
            <p>ⓒ 꼬박꼬박 챌린지 | 고객센터 | 마이페이지 | 공지사항</p>
        </footer>
    </div>
</body>
</html>
