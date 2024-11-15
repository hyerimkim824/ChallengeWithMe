<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 정보 없음</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>고객센터</h1>
        </header>
        <nav>
            <ul class="menu">
                <li><a href="<%=request.getContextPath()%>/support/List.do">문의 내역</a></li>
                <li><a href="<%=request.getContextPath()%>/support/FaqList.do">자주 묻는 질문</a></li>
                <li><a href="<%=request.getContextPath()%>/support/SupportWriteFrom.do">1:1 문의</a></li>
            </ul>
        </nav>
        <main>
            <section class="content">
                <h2>문의 정보 없음</h2>
                <p>요청하신 문의 정보를 찾을 수 없습니다. 다시 시도해주세요.</p>
                <p><a href="<%=request.getContextPath()%>/support/list.do" class="button">문의 내역으로 돌아가기</a></p>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 고객센터</p>
        </footer>
    </div>
</body>
</html>
