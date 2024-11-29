<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff9c4;
        }

        .header {
            background-color: #ffeb3b;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        h1 {
            color: #333;
            font-size: 24px;
        }

        .search-bar {
            display: flex;
            align-items: center;
        }

        .search-bar input {
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }

        .search-bar button {
            padding: 5px 10px;
            background-color: #fdd835;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .search-bar button:hover {
            background-color: #ffcc00;
        }

        .container {
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            max-width: 900px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .results-header {
            margin-bottom: 20px;
            font-size: 20px;
            color: #333;
        }

        .results-header span {
            font-weight: bold;
            color: #fdd835;
        }

        .result-item {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
        }

        .result-item:last-child {
            border-bottom: none;
        }

        .result-item a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .result-item a:hover {
            color: #fdd835;
        }

        .result-info {
            font-size: 14px;
            color: #777;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #fdd835;
            color: #333;
        }

        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination a {
            display: inline-block;
            padding: 10px 15px;
            margin: 0 5px;
            text-decoration: none;
            color: #333;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            transition: all 0.3s ease;
        }

        .pagination a:hover {
            background-color: #fdd835;
            color: #fff;
        }

        .pagination .current {
            background-color: #fdd835;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            border: none;
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <div class="header">
        <h1>고객센터 검색 결과 🐰✨</h1>
         <div class="search-bar">
        <form action="Search.do" method="get" style="display: flex; align-items: center;">
            <!-- 검색어 입력 -->
            <input type="text" name="keyword" placeholder="자주 묻는 질문 검색" style="flex: 1; padding: 5px; border: 1px solid #ccc; border-radius: 5px;" required>
            <!-- 검색 버튼 -->
            <button type="submit" style="padding: 5px 10px; background-color: #fdd835; border: none; cursor: pointer; border-radius: 5px; margin-left: 10px;">검색</button>
        </form>
    </div>
    </div>

    <!-- 검색 결과 컨테이너 -->
    <div class="container">
        <div class="results-header">
            "<span>${param.keyword}</span>" 검색 결과 <span>${totalCount}</span>개를 찾았습니다.
        </div>

        <!-- 검색 결과가 있을 경우 -->
        <c:if test="${not empty searchList}">
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성자</th>
                        <th>작성 날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="result" items="${searchList}">
                        <tr>
                            <td>${result.sup_num}</td>
                            <td>
                                <a href="Detail.do?sup_num=${result.sup_num}">
                                    ${result.sup_title}
                                </a>
                            </td>
                            <td>${result.sup_content}</td>
                            <td>${result.us_num}</td>
                            <td>
                                <fmt:formatDate value="${result.sup_date}" pattern="yyyy-MM-dd" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- 검색 결과가 없을 경우 -->
        <c:if test="${empty searchList}">
            <div class="results-header">
                검색 결과가 없습니다. 🐇 다른 검색어를 입력해주세요.
            </div>
        </c:if>

        <!-- 페이징 -->
        <div class="pagination">
            ${pagingHtml}
        </div>
    </div>
</body>
</html>
