<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>아이디 찾기 결과</title>
</head>
<body>
    <h2>아이디 찾기 결과</h2>
    <c:if test="${not empty id}">
        <p>찾으신 아이디는 <strong>${id}</strong>입니다.</p>
    </c:if>
    <c:if test="${not empty error}">
        <p>${error}</p>
    </c:if>
    <a href="findID.do">돌아가기</a>
</body>
</html>
