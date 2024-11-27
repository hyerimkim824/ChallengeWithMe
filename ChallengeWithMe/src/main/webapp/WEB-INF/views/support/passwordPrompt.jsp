<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비공개 게시글 비밀번호 확인</title>
    <script>
        function submitPassword(supNum) {
            const form = document.getElementById("passwordForm");
            form.action = `DetailAction.do?sup_num=${supNum}`;
            form.submit();
        }
    </script>
</head>
<body>
    <h2>비공개 게시글 확인</h2>
    <p>${error}</p>
    <form id="passwordForm" method="post">
        <input type="password" name="sup_pwd" placeholder="비밀번호 입력" required>
        <button type="button" onclick="submitPassword(${sup_num});">확인</button>
    </form>
</body>
</html>
