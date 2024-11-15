<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 수정 완료</title>
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
                <li><a href="<%=request.getContextPath()%>/support/SupportWrite.do">1:1 문의</a></li>
            </ul>
        </nav>
        <main>
            <section class="content">
                <h2>문의 수정 완료</h2>
                <p class="success-message">
                    문의 내용이 성공적으로 수정되었습니다! 🐇
                </p>
                <p class="buttons">
                    <a href="<%=request.getContextPath()%>/support/List.do" class="button">문의 내역 보기</a>
                    <a href="<%=request.getContextPath()%>/support/Detail.do?sup_num=<%=request.getParameter("sup_num")%>" class="button">수정된 문의 보기</a>
                </p>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 고객센터</p>
        </footer>
    </div>
</body>
</html>
