<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 상세</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>고객센터</h1>
        </header>
        <nav>
            <ul class="menu">
                <li><a href="<%=request.getContextPath()%>/support/list.do">문의 내역</a></li>
                <li><a href="<%=request.getContextPath()%>/support/faq.do">자주 묻는 질문</a></li>
                <li><a href="<%=request.getContextPath()%>/support/write.do">1:1 문의</a></li>
            </ul>
        </nav>
        <main>
            <section class="content">
                <h2>문의 상세 정보</h2>
                <table class="detail-table">
                    <tr>
                        <th>문의 제목</th>
                        <td><%= ((kr.support.vo.SupportVO)request.getAttribute("support")).getSup_title() %></td>
                    </tr>
                    <tr>
                        <th>문의 유형</th>
                        <td><%= ((kr.support.vo.SupportVO)request.getAttribute("support")).getSup_pick() %></td>
                    </tr>
                    <tr>
                        <th>문의 내용</th>
                        <td><pre><%= ((kr.support.vo.SupportVO)request.getAttribute("support")).getSup_content() %></pre></td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td><%= ((kr.support.vo.SupportVO)request.getAttribute("support")).getSup_date() %></td>
                    </tr>
                </table>
                <p class="buttons">
                    <a href="<%=request.getContextPath()%>/support/list.do" class="button">문의 내역으로 돌아가기</a>
                    <a href="<%=request.getContextPath()%>/support/updateForm.do?sup_num=<%= ((kr.support.vo.SupportVO)request.getAttribute("support")).getSup_num() %>" class="button">수정하기</a>
                    <a href="<%=request.getContextPath()%>/support/delete.do?sup_num=<%= ((kr.support.vo.SupportVO)request.getAttribute("support")).getSup_num() %>" class="button">삭제하기</a>
                </p>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 고객센터</p>
        </footer>
    </div>
</body>
</html>
